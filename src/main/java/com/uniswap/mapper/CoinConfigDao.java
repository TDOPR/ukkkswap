package com.uniswap.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.uniswap.entity.CoinConfigEntity;
import org.apache.ibatis.annotations.Param;

import java.math.BigInteger;

public interface CoinConfigDao extends BaseMapper<CoinConfigEntity> {
    CoinConfigEntity getScanDataConfig();
    CoinConfigEntity getBscScanDataConfig();
    CoinConfigEntity getEthDepositScanDataConfig();
    CoinConfigEntity getBscDepositScanDataConfig();
    int updateActionSeqById(@Param("id") Integer id, @Param("blockNo") BigInteger blockNo);
}
