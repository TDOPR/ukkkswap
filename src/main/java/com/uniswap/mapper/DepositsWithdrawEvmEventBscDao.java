package com.uniswap.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.uniswap.entity.DepositsWithdrawEvmEventBscEntity;
import com.uniswap.entity.DepositsWithdrawEvmEventEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DepositsWithdrawEvmEventBscDao extends BaseMapper<DepositsWithdrawEvmEventBscEntity> {
    
    int getCountByTxHash(@Param("txHash") String txHash);
    
    
}