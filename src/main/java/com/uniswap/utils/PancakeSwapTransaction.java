package com.uniswap.utils;

import cn.hutool.extra.spring.SpringUtil;
import com.uniswap.config.TokenConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.util.StringUtils;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.RemoteFunctionCall;
import org.web3j.protocol.core.methods.response.EthBlock;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tx.gas.DefaultGasProvider;
import org.web3j.tx.gas.StaticGasProvider;
import org.web3j.utils.Convert;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PancakeSwapTransaction {
    private final static Logger logger = LoggerFactory.getLogger(PancakeSwapTransaction.class);
    
    private Web3j web3j;
    
    private Credentials walletCredentials;
    
    private static final String defaultNetTokenAddress = "0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c";
    
    private static final String usdtAddress = "0x55d398326f99059fF775485246999027B3197955";
    
    private static final String defaultGasPriceTheBuy = "5000000000";
    private static final String defaultGasLimitTheBuy = "269380";
    
    private static final String defaultGasPriceTheSell = "5000000000";
    private static final String defaultGasLimitTheSell = "516087";
    
    @Autowired
    TokenConfig tokenConfig;
    
    
    private PancakeRouter02 pancakeRouter02;
    
    
    @Deprecated
    public PancakeSwapTransaction() {
    }
    
    
    public PancakeSwapTransaction(Web3j web3j, Credentials walletCredentials, Integer chainId) {
        this.web3j = web3j;
        this.walletCredentials = walletCredentials;
        TokenConfig tokenConfig = SpringUtil.getBean(TokenConfig.class);
        if(chainId.equals(tokenConfig.getChainIdEth())){
            this.pancakeRouter02 = PancakeRouter02.load(tokenConfig.getRouterEthAddress(), web3j, walletCredentials, new DefaultGasProvider());
    
        }else{
            this.pancakeRouter02 = PancakeRouter02.load(tokenConfig.getRouterBscAddress(), web3j, walletCredentials, new DefaultGasProvider());
        }
        
    }
    
    
    public PancakeRouter02 getPancakeRouterInstance() {
        return this.pancakeRouter02;
    }
    
    
    public TransactionReceipt buy(String contractAddress, String usdtAmount) throws Exception {
        return buy(contractAddress, usdtAmount, null, null);
    }
    
    
    public TransactionReceipt buy(String contractAddress, String usdtAmount, String gasPrice, String gasLimit) throws Exception {
        
        BigDecimal amountInput = Convert.toWei(usdtAmount, Convert.Unit.ETHER);
        BigDecimal amountOutput = new BigDecimal("1");
        
        List<String> path = new ArrayList<>();
        path.add(usdtAddress);
        path.add(defaultNetTokenAddress);
        path.add(contractAddress);
        
        EthBlock.Block block = this.web3j.ethGetBlockByNumber(DefaultBlockParameterName.LATEST, false).send().getBlock();
        logger.info("current number:" + block.getNumber());
        BigInteger timestampUnix = block.getTimestamp();
        logger.info("time add Before:" + timestampUnix);
        
        
        timestampUnix = timestampUnix.add(new BigInteger("1000"));
        logger.info("time add After:" + timestampUnix);
        
        
        StaticGasProvider staticGasProvider = new StaticGasProvider(StringUtils.isEmpty(gasPrice) ? new BigInteger(defaultGasPriceTheBuy) : new BigInteger(gasPrice),
                StringUtils.isEmpty(gasLimit) ? new BigInteger(defaultGasLimitTheBuy) : new BigInteger(gasLimit));
        
        this.pancakeRouter02.setGasProvider(staticGasProvider);
        
        RemoteFunctionCall<TransactionReceipt> transactionReceiptRemoteFunctionCall = this.pancakeRouter02.swapExactTokensForTokens(amountInput.toBigInteger(), amountOutput.toBigInteger(), path, walletCredentials.getAddress(), timestampUnix);
        TransactionReceipt buyResult = transactionReceiptRemoteFunctionCall.send();
        return buyResult;
    }
    
    
    public TransactionReceipt sell(String contractAddress, String tokenAmount) throws Exception {
        return sell(contractAddress, tokenAmount, null, null);
    }
    
    public List getAmountsOut(BigInteger amountIn, List<String> path) throws Exception {
        return this.pancakeRouter02.getAmountsOut(amountIn, path).send();
    }
    
    public List getAmountsIn(BigInteger amountIn, List<String> path) throws Exception {
        return this.pancakeRouter02.getAmountsIn(amountIn, path).send();
    }
    
    
    public TransactionReceipt sell(String contractAddress, String tokenAmount, String gasPrice, String gasLimit) throws Exception {
        
        BigDecimal amountInput = new BigDecimal(tokenAmount);
        
        BigDecimal amountOutput = new BigDecimal("1");
        
        List<String> path = new ArrayList<>();
        path.add(contractAddress);
        path.add(defaultNetTokenAddress);
        path.add(usdtAddress);
        
        EthBlock.Block block = this.web3j.ethGetBlockByNumber(DefaultBlockParameterName.LATEST, false).send().getBlock();
        logger.info("current number:" + block.getNumber());
        BigInteger timestampUnix = block.getTimestamp();
        logger.info("time add Before:" + timestampUnix);
        
        
        timestampUnix = timestampUnix.add(new BigInteger("1000"));
        logger.info("time add After:" + timestampUnix);
        
        StaticGasProvider staticGasProvider = new StaticGasProvider(StringUtils.isEmpty(gasPrice) ? new BigInteger(defaultGasPriceTheSell) : new BigInteger(gasPrice),
                StringUtils.isEmpty(gasLimit) ? new BigInteger(defaultGasLimitTheSell) : new BigInteger(gasLimit));
        this.pancakeRouter02.setGasProvider(staticGasProvider);
        
        
        TransactionReceipt sellResult = this.pancakeRouter02.swapExactTokensForTokensSupportingFeeOnTransferTokens(amountInput.toBigInteger(), amountOutput.toBigInteger(), path, walletCredentials.getAddress(), timestampUnix).send();
        return sellResult;
        
    }
}
