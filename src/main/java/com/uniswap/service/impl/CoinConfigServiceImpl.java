package com.uniswap.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.uniswap.entity.CoinConfigEntity;
import com.uniswap.mapper.CoinConfigDao;
import com.uniswap.service.CoinConfigService;
import org.springframework.stereotype.Service;

@Service
public class CoinConfigServiceImpl extends ServiceImpl<CoinConfigDao, CoinConfigEntity> implements CoinConfigService {


}