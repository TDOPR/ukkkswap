package com.uniswap.utils;

import com.uniswap.config.BaseTokenConfig;
import com.uniswap.entity.GraphData;
import com.uniswap.entity.PairBscEntity;
import com.uniswap.entity.PairEntity;
import com.uniswap.enums.ChainTypeEnum;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * @author Dominick Li
 * @Description 图映射
 * @CreateTime 2023/4/26 10:07
 **/
public class GraphDataMapUtils {
    
    /**
     * 根据chainId区分图对象
     */
    private static Map<ChainTypeEnum, GraphData> map = new HashMap<>();
    
    static {
        //初始化图对象
        for (ChainTypeEnum chainTypeEnum : ChainTypeEnum.values()) {
            map.put(chainTypeEnum, new GraphData());
        }
    }
    
    
    /**
     * 查询路径
     *
     * @param chainId 链的类型
     * @param token0  源地址A
     * @param token1  源地址B
     * @return
     */
    public static List<List<String>> searchPath(int chainId, String token0, String token1) {
        ChainTypeEnum chainTypeEnum = ChainTypeEnum.chainIdOf(chainId);
        if (!map.containsKey(chainTypeEnum)) {
            return Collections.emptyList();
        }
        return map.get(chainTypeEnum).searchPath(token0, token1);
    }
    
    /**
     * 设置基础token
     */
    public static void intBaseToken(BaseTokenConfig baseTokenConfig) {
        for (ChainTypeEnum chainTypeEnum : ChainTypeEnum.values()) {
            List<String> baseToken = new ArrayList<>();
            switch (chainTypeEnum) {
                case ETH:
                    baseTokenConfig.getEth().forEach(token -> baseToken.add(token.toLowerCase()));
                    break;
                case BSC:
                    baseTokenConfig.getBsc().forEach(token -> baseToken.add(token.toLowerCase()));
                    break;
            }
            map.get(chainTypeEnum).setBaseTokenList(baseToken);
        }
    }
    
    public static void buildDigraph(List<PairEntity> tokenList) {
        Map<Integer, List<PairEntity>> pairEntityMap = tokenList.stream().collect(Collectors.groupingBy(PairEntity::getChainId));
        ChainTypeEnum chainTypeEnum;
        for (Map.Entry<Integer, List<PairEntity>> entry : pairEntityMap.entrySet()) {
            chainTypeEnum = ChainTypeEnum.chainIdOf(entry.getKey());
            if (!map.containsKey(chainTypeEnum)) {
                return;
            }
            map.get(chainTypeEnum).buildDigraph(entry.getValue());
        }
    }
    
    public static void buildBscDigraph(List<PairBscEntity> tokenBscList) {
        Map<Integer, List<PairBscEntity>> pairEntityMap = tokenBscList.stream().collect(Collectors.groupingBy(PairBscEntity::getChainId));
        ChainTypeEnum chainTypeEnum;
        for (Map.Entry<Integer, List<PairBscEntity>> entry : pairEntityMap.entrySet()) {
            chainTypeEnum = ChainTypeEnum.chainIdOf(entry.getKey());
            if (!map.containsKey(chainTypeEnum)) {
                return;
            }
            map.get(chainTypeEnum).buildBscDigraph(entry.getValue());
        }
    }
    
    /**
     * 添加数据到图中
     *
     * @param pairEntity
     */
    public static void addEdge(PairEntity pairEntity) {
        ChainTypeEnum chainTypeEnum = ChainTypeEnum.chainIdOf(pairEntity.getChainId());
        if (!map.containsKey(chainTypeEnum)) {
            return;
        }
        map.get(chainTypeEnum).addEdge(pairEntity);
    }
    
    public static void addBscEdge(PairBscEntity pairBscEntity) {
        ChainTypeEnum chainTypeEnum = ChainTypeEnum.chainIdOf(pairBscEntity.getChainId());
        if (!map.containsKey(chainTypeEnum)) {
            return;
        }
        map.get(chainTypeEnum).addBscEdge(pairBscEntity);
    }
}
