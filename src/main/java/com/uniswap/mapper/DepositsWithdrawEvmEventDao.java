package com.uniswap.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.uniswap.entity.DepositsWithdrawEvmEventEntity;
import com.uniswap.entity.EvmEventEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DepositsWithdrawEvmEventDao extends BaseMapper<DepositsWithdrawEvmEventEntity> {
    
    int getCountByTxHash(@Param("txHash") String txHash);
    
    
}