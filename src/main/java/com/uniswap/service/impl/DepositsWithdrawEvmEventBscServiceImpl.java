package com.uniswap.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.uniswap.entity.DepositsWithdrawEvmEventBscEntity;
import com.uniswap.entity.DepositsWithdrawEvmEventEntity;
import com.uniswap.mapper.DepositsWithdrawEvmEventBscDao;
import com.uniswap.mapper.DepositsWithdrawEvmEventDao;
import com.uniswap.service.DepositsWithdrawEvmEventBscService;
import com.uniswap.service.DepositsWithdrawEvmEventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("DepositsWithdrawEvmEventBscService")
public class DepositsWithdrawEvmEventBscServiceImpl extends ServiceImpl<DepositsWithdrawEvmEventBscDao, DepositsWithdrawEvmEventBscEntity> implements DepositsWithdrawEvmEventBscService {
    
    @Autowired
    private DepositsWithdrawEvmEventBscDao depositsWithdrawEvmEventBscDao;

////    @Override
//    public PageUtils queryPage(Map<String, Object> params) {
//        IPage<EvmEventEntity> page = this.page(
//                new Query<EvmEventEntity>().getPage(params),
//                new QueryWrapper<EvmEventEntity>()
//        );
//
//        return new PageUtils(page);
//    }
    
    @Override
    public boolean getEventExistByTxHash(String txHash) {
        int num = depositsWithdrawEvmEventBscDao.getCountByTxHash(txHash);
        return num > 0;
    }
}
