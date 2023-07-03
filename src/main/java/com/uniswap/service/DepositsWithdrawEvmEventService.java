package com.uniswap.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.uniswap.entity.DepositsWithdrawEvmEventEntity;
import com.uniswap.entity.EvmEventEntity;

public interface DepositsWithdrawEvmEventService extends IService<DepositsWithdrawEvmEventEntity> {
    
    boolean getEventExistByTxHash(String txHash);
    
}
