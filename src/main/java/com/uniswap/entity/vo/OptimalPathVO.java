package com.uniswap.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigInteger;
import java.util.List;

/**
 * @author Dominick Li
 * @Description
 * @CreateTime 2023/2/21 16:39
 **/
@Data
@AllArgsConstructor
public class OptimalPathVO {

    /**
     * 最优路径
     */
    private List<String> paths;

    /**
     * 换算金额
     */
    private String amount;

    /**
     * 增幅率
     */
    private String  increaseRate;
}
