package com.uniswap.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.uniswap.entity.PairBscEntity;
import com.uniswap.entity.PairEntity;
import com.uniswap.mapper.PairBscDao;
import com.uniswap.mapper.PairDao;
import com.uniswap.service.PairBscService;
import com.uniswap.service.PairService;
import org.springframework.stereotype.Service;

@Service
public class PairBscServiceImpl extends ServiceImpl<PairBscDao, PairBscEntity> implements PairBscService {
}
