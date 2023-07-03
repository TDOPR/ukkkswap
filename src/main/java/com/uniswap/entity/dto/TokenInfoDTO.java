package com.uniswap.entity.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigInteger;

/**
 * @author Dominick Li
 * @Description 请求路径
 * @CreateTime 2023/2/21 16:38
 **/
@Data
public class TokenInfoDTO {

    /**
     * 链Id 对应 ChainTypeEnum枚举类
     */
    @NotBlank
    private String chainIdX;

    /**
     * 起点
     */
    @NotBlank
    private String tokenA;

    /**
     * 终点
     */
    @NotBlank
    private String tokenB;

    /**
     * 换算金额
     */
    @NotNull
    private BigInteger amount;

}
