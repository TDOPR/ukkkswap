package com.uniswap.entity.vo;

import lombok.Data;

import java.util.Date;

@Data
public class DepositWithdrawBscVO {
    
    private Integer id;
    private String userAddress;
    private String tokenAddress;
    
    private String amount;
    
    private Date date;
    
    private String eventName;
    
    private Integer chainId;
    
    private Date creatTime;
    
    public String getUserAddress() {
        return userAddress.toLowerCase();
    }
    
    public String getTokenAddress() {
        return tokenAddress.toLowerCase();
    }
}
