package com.uniswap.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.uniswap.entity.EvmEventEntity;
import com.uniswap.sqlPlus.CustomerMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EvmEventDao extends BaseMapper<EvmEventEntity> {
    
    int getCountByTxHash(@Param("txHash") String txHash);
    
    
}