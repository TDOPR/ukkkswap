package com.uniswap.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.uniswap.entity.DepositWithdrawBscEntity;
import com.uniswap.entity.DepositWithdrawEntity;
import com.uniswap.mapper.DepositWithdrawBscDao;
import com.uniswap.mapper.DepositWithdrawDao;
import com.uniswap.service.DepositWithdrawBscService;
import com.uniswap.service.DepositWithdrawService;
import org.springframework.stereotype.Service;

@Service
public class DepositWithdrawServiceBscImpl extends ServiceImpl<DepositWithdrawBscDao, DepositWithdrawBscEntity> implements DepositWithdrawBscService {
}
