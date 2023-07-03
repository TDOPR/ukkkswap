package com.uniswap.utils;

import cn.hutool.core.map.BiMap;

import java.util.HashMap;
import java.util.TreeSet;

/**
 * @author Dominick Li
 * @Description
 * @CreateTime 2023/2/16 14:18
 **/
public class TreeSetTest {
    public static void main(String[] args) {
        TreeSet<Integer> treeSet = new TreeSet<>();
        treeSet.add(0);
        treeSet.add(3);
        treeSet.add(2);
        for (Integer index : treeSet) {
            System.out.println(index);
        }

        BiMap<String,Integer> s=new BiMap<>(new HashMap<>());
        s.put("0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c",1);
        System.out.println(s.containsKey("0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c"));
    }
}
