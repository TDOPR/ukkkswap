package com.uniswap.entity.dto;

import lombok.Data;

import java.util.List;

@Data
public class DepositTokenInfoDto {
    
    /**
     * baseToken数组
     */
    private List<String> baseAddress;
}
