package com.uniswap.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.uniswap.entity.DepositWithdrawEntity;
import com.uniswap.entity.PairEntity;
import com.uniswap.entity.vo.DepositWithdrawBscVO;
import com.uniswap.entity.vo.DepositWithdrawVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepositWithdrawDao extends BaseMapper<DepositWithdrawEntity> {
    Page<DepositWithdrawVO> getDepositWithdrawInfo(Page page, @Param("userAddress") String userAddress);
    Page<DepositWithdrawVO> getDepositWithdrawInfoBsc(Page page, @Param("userAddress") String userAddress);
    
}
