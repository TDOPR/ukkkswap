package com.uniswap.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.uniswap.entity.EvmEventEntity;
import com.uniswap.mapper.EvmEventDao;
import com.uniswap.service.EvmEventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("EvmEventService")
public class EvmEventServiceImpl extends ServiceImpl<EvmEventDao, EvmEventEntity> implements EvmEventService {
    
    @Autowired
    private EvmEventDao evmEventDao;

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
        int num = evmEventDao.getCountByTxHash(txHash);
        return num > 0;
    }
}
