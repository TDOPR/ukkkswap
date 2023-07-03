package com.uniswap.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.uniswap.entity.DepositWithdrawEntity;
import com.uniswap.entity.PairEntity;
import com.uniswap.mapper.DepositWithdrawDao;
import com.uniswap.mapper.PairDao;
import com.uniswap.service.DepositWithdrawService;
import com.uniswap.service.PairService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public class DepositWithdrawServiceImpl extends ServiceImpl<DepositWithdrawDao, DepositWithdrawEntity> implements DepositWithdrawService {
}