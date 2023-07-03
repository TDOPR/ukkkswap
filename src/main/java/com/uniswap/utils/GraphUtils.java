package com.uniswap.utils;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.map.BiMap;
import com.alibaba.fastjson.JSONObject;

import com.uniswap.entity.PairEntity;
import lombok.Data;

import java.util.*;
import java.util.stream.Collectors;


/**
 * @Description 有向图
 * @Author Dominick Li
 * @CreateTime 2023/2/14 21:46
 **/
@Data
public class GraphUtils {

    /**
     * 基础Tokens图
     */
    private static Graph baseGraph;

    /**
     * 全量数据图
     */
    private static Graph graph;

    private static List<String> baseTokenList = new ArrayList<>();

    public static void setBaseTokenList(List<String> baseTokenList) {
        GraphUtils.baseTokenList = baseTokenList;
    }

    /**
     * 给全量数据图添加新的数据
     *
     * @param pairEntity
     */
    public static void addEdge(PairEntity pairEntity) {
        graph.addEdge(pairEntity);
    }


    /**
     * 构建全量Token图
     */
    public static void buildDigraph(List<PairEntity> pairEntityList) {
        graph = new Graph();
        pairEntityList.forEach(pairEntity -> graph.addEdge(pairEntity));
        baseGraph = new Graph();
        //根据基础Token信息构建基础Token图
        List<PairEntity> basePairEntityList = pairEntityList.stream()
                .filter(pairEntity -> baseTokenList.contains(pairEntity.getToken0()) || baseTokenList.contains(pairEntity.getToken1()))
                .collect(Collectors.toList());
        basePairEntityList.forEach(pairEntity -> baseGraph.addEdge(pairEntity));
    }

    /**
     * 查询所有路径
     *
     * @param token0 起点路径
     * @param token1 终点路径
     * @return
     */
    public static List<List<String>> searchPath(String token0, String token1) {
        List<List<String>> list = baseGraph.searchPath(token0, token1);

        if (CollectionUtil.isEmpty(list)) {
            //查询全量Token图路径
            System.out.println("查询全量Token图最优路径");
            list = graph.searchPath(token0, token1);
        }
        return list;
    }

    public static void main(String[] args) {
        //枚举出所以token存储到图中,对应的下标用hashMap对应
        List<PairEntity> tokenList = new ArrayList<>();
        String token0 = "美元";
        String token1 = "人民币";
        String token2 = "欧元";
        String token3 = "英镑";
        String token4 = "日元";
        tokenList.add(new PairEntity(token0, token1));
        tokenList.add(new PairEntity(token0, token2));
        tokenList.add(new PairEntity(token0, token3));
        tokenList.add(new PairEntity(token2, token1));
        tokenList.add(new PairEntity(token2, token3));
        tokenList.add(new PairEntity(token3, token1));
        tokenList.add(new PairEntity(token3, token4));
        tokenList.add(new PairEntity(token4, token1));
        buildDigraph(tokenList);
        //[["美元","人民币"],["美元","欧元","人民币"],["美元","欧元","英镑","人民币"],["美元","英镑","人民币"],["美元","英镑","日元","人民币"]]
        System.out.println(JSONObject.toJSONString(searchPath(token0, token1)));
    }

    /**
     * @Description 无向图
     * @Author Dominick Li
     * @CreateTime 2023/2/14 21:46
     **/
    @Data
    private static class Graph {
        /**
         * 边的数目
         */
        private int count = 0;
        /**
         * 有向图
         */
        private List<TreeSet<Integer>> tables = new ArrayList<>();
        /**
         * 查找的深度，超过则停止递归
         */
        private int MAX_LEVEL = 3;
        /**
         * 存储Token和图表的下标对应信息
         */
        private BiMap<String, Integer> biMap = new BiMap<>(new HashMap<>());

        /**
         * 获取邻界表的数量
         *
         * @return 返回大小
         */
        private int getSize() {
            return tables.size();
        }

        /**
         * 根据Token获取图标下标信息
         */
        public int getIndexAndSet(String token) {
            if (biMap.containsKey(token)) {
                return biMap.get(token);
            }
            //如果不存在则插入一条新的信息
            int index = getSize();
            biMap.put(token, index);
            tables.add(new TreeSet());
            return index;
        }

        /**
         * 向有向图中添加一条边 v->w
         *
         * @param start 顶点 开始
         * @param end   顶点 结束
         */
        private void addEdge(int start, int end) {
            //只需要让顶点w出现在顶点v的邻接表中，因为边是有方向的，最终，顶点v的邻接表中存储的相邻顶点的含义是： v->其他顶点
            tables.get(start).add(end);
            tables.get(end).add(start);
            count++;
        }

        public void addEdge(PairEntity pairEntity) {
            int start = getIndexAndSet(pairEntity.getToken0());
            int end = getIndexAndSet(pairEntity.getToken1());
            //System.out.println("start=" + start + ",end=" + end);
            addEdge(start, end);
        }

        /**
         * 获取顶点的连接点
         *
         * @param index
         * @return
         */
        private TreeSet<Integer> get(int index) {
            return tables.get(index);
        }

        /**
         * 查找
         *
         * @param start 起点
         * @param end   终点
         * @return 所有路径
         */
        public List<List<Integer>> dfs(int start, int end) {
            List<List<Integer>> prevList = new ArrayList<>();
            //访问过的标识
            Set<Integer> visited = new HashSet<>();
            HashSet<Integer> igoneSet = new HashSet<>();
            List<Integer> prev = new ArrayList<>();
            //添加起点
            recurDfs(start, end, 0, visited, prev, prevList, igoneSet);
            return prevList;
        }

        private void recurDfs(int start, int end, int level, Set<Integer> visited, List<Integer> prev, List<List<Integer>> prevList, HashSet<Integer> igoneSet) {
            level++;
            //递归深度超出则跳出循环
            if (level > MAX_LEVEL) {
                return;
            }
            //设置当前节点已访问
            visited.add(start);
            TreeSet<Integer> treeSet = get(start);
            for (int nextNode : treeSet) {
                //已访问的节点则不进行出路
                if (!visited.contains(nextNode)) {
                    //把节点添加到路径中
                    //prev.add(nextNode);
                    if (nextNode == end) {
                        //到达终点后把当前的路径添加到所有路径中
                        prevList.add(new ArrayList<>(prev));
                        if (prev.size() > 0) {
                            igoneSet.add(prev.get(0));
                        }
                    } else if (prev.size() == 0 || (prev.size() > 0 && !prev.contains(nextNode) && !igoneSet.contains(nextNode))) {
                        prev.add(nextNode);
                        //没找到则递归往深处查找
                        recurDfs(nextNode, end, level, visited, prev, prevList, igoneSet);
                        //递归查找完设置当前节点为未访问
                        visited.remove(nextNode);
                        prev.remove(prev.size() - 1);
                    }
                }
            }
        }

        /**
         * 根据Token0查询到Token1的所有路径
         * @param token0 起点
         * @param token1 终点
         * @return
         */
        public List<List<String>> searchPath(String token0, String token1) {
            int start = getIndexAndSet(token0);
            int end = getIndexAndSet(token1);
            List<List<Integer>> list = dfs(start, end);
            return getTokenByIndex(start, end, list);
        }

        /**
         * 根据起始点和结束点获取所有路径的Token信息
         *
         * @param start       起始点
         * @param end         结束点
         * @param integerList 匹配路径
         * @return
         */
        private List<List<String>> getTokenByIndex(int start, int end, List<List<Integer>> integerList) {
            List<List<String>> list = new ArrayList<>();
            List<String> data;
            String tokenStart = biMap.getKey(start);
            String tokenEnd = biMap.getKey(end);

            for (List<Integer> cur : integerList) {
                data = new ArrayList<>();
                data.add(tokenStart);
                for (Integer val : cur) {
                    data.add(biMap.getKey(val));
                }
                data.add(tokenEnd);
                list.add(data);
            }
            return list;
        }

    }
}
