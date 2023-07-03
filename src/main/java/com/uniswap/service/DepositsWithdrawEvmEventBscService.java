package com.uniswap.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.uniswap.entity.DepositsWithdrawEvmEventBscEntity;
import com.uniswap.entity.DepositsWithdrawEvmEventEntity;

public interface DepositsWithdrawEvmEventBscService extends IService<DepositsWithdrawEvmEventBscEntity> {
    
    boolean getEventExistByTxHash(String txHash);
    
}
