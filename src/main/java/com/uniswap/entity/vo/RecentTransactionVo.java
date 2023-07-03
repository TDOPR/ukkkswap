package com.uniswap.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * @author Dominick Li
 * @Description
 * @CreateTime 2023/2/21 16:39
 **/
@Data
@AllArgsConstructor
public class RecentTransactionVo {

    /**
     * 方法名称
     */
    private String methodName;

    /**
     * TOKEN0
     */
    private String token0;

    /**
     * TOKEN1
     */
    private String  token1;
    
    /**
     * AMOUNT
     */
    private Integer  amount;
}
