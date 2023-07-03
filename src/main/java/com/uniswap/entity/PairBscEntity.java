package com.uniswap.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigInteger;
import java.util.Date;

@Data
@TableName("pancake_swap_pair_info_bsc")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PairBscEntity {

    public PairBscEntity(String token0, String token1) {
        this.token0 = token0;
        this.token1 = token1;
    }

    private static final long serialVersionUID = 1L;
    
    /**
     *
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String token1;
    
    private String token0;
    private String pair;
    private BigInteger pairLength;
    private Date createTime;

    private Integer chainId;
    
    public String getToken1() {
        return token1.toLowerCase();
    }
    
    public String getToken0() {
        return token0.toLowerCase();
    }
}
