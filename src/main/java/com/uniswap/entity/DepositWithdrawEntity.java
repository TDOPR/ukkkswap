package com.uniswap.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

@Data
@TableName("deposit_withdraw_info")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DepositWithdrawEntity {
    
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String userAddress;
    private String tokenAddress;
    
    private BigInteger decimals;
    
    private String symbol;
    
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
