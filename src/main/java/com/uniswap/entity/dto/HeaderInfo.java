package com.uniswap.entity.dto;

import lombok.Data;

@Data
public class HeaderInfo {
    
    /**
     * 链Id
     */
    private Integer chianId;
    
    /**
     * 用户地址
     */
    private String userAddress;
}
