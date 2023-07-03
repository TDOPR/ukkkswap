package com.uniswap.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.uniswap.entity.CoinConfigEntity;
import com.uniswap.entity.PairEntity;
import com.uniswap.mapper.CoinConfigDao;
import com.uniswap.mapper.PairDao;
import com.uniswap.service.CoinConfigService;
import com.uniswap.service.PairService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class PairServiceImpl extends ServiceImpl<PairDao, PairEntity> implements PairService {
}
