package com.uniswap.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Dominick Li
 * @Description
 * @CreateTime 2023/3/21 15:56
 **/
@Data
@TableName("token")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Token {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String name;

    private String symbol;

    private String address;
    
    private String logoUrl;
    
    private Long chainId;

    private Long decimals;
}
