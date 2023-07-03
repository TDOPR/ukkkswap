package com.uniswap.entity.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigInteger;
import java.util.Date;

@Data
public class DepositWithdrawVO {
    
    private Integer id;
    private String userAddress;
    private String tokenAddress;
    
    private String amount;
    
    private BigInteger decimals;
    
    private String symbol;
    
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
