package com.uniswap.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.uniswap.entity.EvmEventBscEntity;
import com.uniswap.entity.EvmEventEntity;
import com.uniswap.mapper.EvmEventBscDao;
import com.uniswap.mapper.EvmEventDao;
import com.uniswap.service.EvmEventBscService;
import com.uniswap.service.EvmEventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("EvmEventBscService")
public class EvmEventBscServiceImpl extends ServiceImpl<EvmEventBscDao, EvmEventBscEntity> implements EvmEventBscService {
    
    @Autowired
    private EvmEventBscDao evmEventBscDao;

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
        int num = evmEventBscDao.getCountByTxHash(txHash);
        return num > 0;
    }
}
