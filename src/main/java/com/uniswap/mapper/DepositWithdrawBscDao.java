package com.uniswap.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.uniswap.entity.DepositWithdrawBscEntity;
import com.uniswap.entity.DepositWithdrawEntity;

import java.util.List;

public interface DepositWithdrawBscDao extends BaseMapper<DepositWithdrawBscEntity> {
    List<DepositWithdrawEntity> getDepositWithdrawInfo(String userAddress);
    List<DepositWithdrawEntity> getDepositWithdrawInfoBsc(String userAddress);
}
