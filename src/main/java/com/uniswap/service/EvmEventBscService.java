package com.uniswap.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.uniswap.entity.EvmEventBscEntity;
import com.uniswap.entity.EvmEventEntity;

public interface EvmEventBscService extends IService<EvmEventBscEntity> {
    
    boolean getEventExistByTxHash(String txHash);
    
}
