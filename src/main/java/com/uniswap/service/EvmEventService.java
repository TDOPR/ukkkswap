package com.uniswap.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.uniswap.entity.EvmEventEntity;
import com.uniswap.sqlPlus.CustomerService;

public interface EvmEventService extends IService<EvmEventEntity> {
    
    boolean getEventExistByTxHash(String txHash);
    
}
