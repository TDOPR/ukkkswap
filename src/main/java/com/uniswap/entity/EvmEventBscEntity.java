package com.uniswap.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

@Data
@TableName("evm_event_bsc")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EvmEventBscEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    private BigInteger blockNum;
    private String txHash;
    private String eventName;
    private Integer chainId;
    private Date createTime;

}