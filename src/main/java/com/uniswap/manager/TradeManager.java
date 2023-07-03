package com.uniswap.manager;

import com.uniswap.entity.DepositWithdrawEntity;
import com.uniswap.entity.DepositWithdrawBscEntity;
import com.uniswap.entity.PairBscEntity;
import com.uniswap.entity.PairEntity;
import com.uniswap.enums.ChainTypeEnum;
import com.uniswap.service.DepositWithdrawBscService;
import com.uniswap.service.DepositWithdrawService;
import com.uniswap.service.PairBscService;
import com.uniswap.service.PairService;
import com.uniswap.utils.GraphDataMapUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.Date;

@Slf4j
@Component
public class TradeManager {

    @Resource
    private PairService pairService;
    
    @Autowired
    private DepositWithdrawService depositWithdrawService;
    
    @Autowired
    private DepositWithdrawBscService depositWithdrawBscService;
    
    @Resource
    private PairBscService pairBscService;

    public void creatPair(String token0, String token1, String pair, BigInteger pairLength, Integer chainId) {
        PairEntity pairEntity = PairEntity.builder()
                .token0(token0)
                .token1(token1)
                .pair(pair)
                .chainId(chainId)
                .pairLength(pairLength)
                .build();
        pairService.save(pairEntity);
        GraphDataMapUtils.addEdge(pairEntity);
    }
    
    public void creatBscPair(String token0, String token1, String pair, BigInteger pairLength, Integer chainId) {
        PairBscEntity pairBscEntity = PairBscEntity.builder()
                .token0(token0)
                .token1(token1)
                .pair(pair)
                .chainId(chainId)
                .pairLength(pairLength)
                .build();
        pairBscService.save(pairBscEntity);
        GraphDataMapUtils.addBscEdge(pairBscEntity);
    }
    
    public void creatEthDepositWithdrawEvent(String userAddress, String tokenAddress, String amount, BigInteger decimals, String symbol, Date date, String eventName) {
        DepositWithdrawEntity depositWithdrawEntity = DepositWithdrawEntity.builder()
                .userAddress(userAddress)
                .tokenAddress(tokenAddress)
                .amount(amount)
                .decimals(decimals)
                .symbol(symbol)
                .date(date)
                .eventName(eventName)
                .chainId(ChainTypeEnum.ETH.getChainId())
                .creatTime(new Date())
                .build();
        depositWithdrawService.save(depositWithdrawEntity);
    }
    
    public void creatBscDepositWithdrawEvent(String userAddress, String tokenAddress, String amount, BigInteger decimals, String symbol, Date date, String eventName) {
        DepositWithdrawBscEntity depositWithdrawBscEntity = DepositWithdrawBscEntity.builder()
                .userAddress(userAddress)
                .tokenAddress(tokenAddress)
                .amount(amount)
                .date(date)
                .eventName(eventName)
                .chainId(ChainTypeEnum.BSC.getChainId())
                .creatTime(new Date())
                .build();
        depositWithdrawBscService.save(depositWithdrawBscEntity);
    }

}
