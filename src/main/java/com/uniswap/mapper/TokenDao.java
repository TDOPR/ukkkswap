package com.uniswap.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.uniswap.entity.EvmEventEntity;
import com.uniswap.entity.Token;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TokenDao extends BaseMapper<Token> {
    
    int getInformByAddress(@Param("address") String address);
    
    List<Token> getTokenList();
    
    List<Token> getDepositTokenList(List<String> baseAddress);
    
}