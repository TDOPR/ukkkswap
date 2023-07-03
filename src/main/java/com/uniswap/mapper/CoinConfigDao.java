package com.uniswap.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.uniswap.entity.CoinConfigEntity;
import org.apache.ibatis.annotations.Param;

import java.math.BigInteger;

public interface CoinConfigDao extends BaseMapper<CoinConfigEntity> {
    CoinConfigEntity getScanDataConfig(@Param("chianId") Integer chainId);
    
    CoinConfigEntity getBscScanDataConfig(@Param("chianId") Integer chainId);
    
    CoinConfigEntity getEthDepositScanDataConfig(@Param("chianId") Integer chainId);
    
    CoinConfigEntity getBscDepositScanDataConfig(@Param("chianId") Integer chainId);
    
    int updateActionSeqById(@Param("id") Integer id, @Param("blockNo") BigInteger blockNo);
}
