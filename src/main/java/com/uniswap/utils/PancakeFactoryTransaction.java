package com.uniswap.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

public class PancakeFactoryTransaction {
    private final static Logger logger = LoggerFactory.getLogger(PancakeFactoryTransaction.class);
    
    private Web3j web3j;
    
    private Credentials walletCredentials;
    
    //private String pancakeRouterAddress;
    public  static final  String password = "25083XxX";
    
//    public static String PATH = "D:/Request/SuperNode/keystore/UTC--2023-01-30T03-58-55.331000000Z--f80e67d851ac01b5df44a2f88385a6b796051346.json";
    
    private static final String defaultPancakeRouterAddress = "0x10ED43C718714eb63d5aA57B78B54704E256024E";
    
    //private String netTokenAddress;
    
    private static final String defaultNetTokenAddress = "0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c";
    private static final String defaultFactoryAddress = "0xca143ce32fe78f1f7019d7d551a6402fc5350c73";
    
    private static final String usdtAddress = "0x55d398326f99059fF775485246999027B3197955";
    
    private static final String defaultGasPriceTheBuy = "5000000000";
    private static final String defaultGasLimitTheBuy = "269380";
    
    private static final String defaultGasPriceTheSell = "5000000000";
    private static final String defaultGasLimitTheSell = "516087";
    
    public final static List<String> PATH = Arrays.asList("0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c","0x55d398326f99059fF775485246999027B3197955");
    
    
    private PancakeRouter02 pancakeRouter02;
    
    private  UniswapFactory uniswapFactory;
    
    
    
    @Deprecated
    public PancakeFactoryTransaction() {
    }
    
    public PancakeFactoryTransaction(Web3j web3j, Credentials walletCredentials) {
        this.web3j = web3j;
        this.walletCredentials = walletCredentials;
        this.uniswapFactory = UniswapFactory.load(defaultFactoryAddress, web3j, walletCredentials, new DefaultGasProvider());
    }
    
    public PancakeRouter02 getPancakeRouterInstance(){
        return this.pancakeRouter02;
    }
    
    
    public TransactionReceipt buy(String contractAddress, String usdtAmount) throws Exception {
        return buy(contractAddress, usdtAmount, null,null );
    }
    
    
    public TransactionReceipt buy(String contractAddress,String usdtAmount,String gasPrice,String gasLimit) throws Exception {
        
        BigDecimal amountInput = Convert.toWei(usdtAmount, Convert.Unit.ETHER);
        BigDecimal amountOutput = new BigDecimal("1");
        
        List<String> path = new ArrayList<>();
        path.add(usdtAddress);
        path.add(defaultNetTokenAddress);
        path.add(contractAddress);
        
        EthBlock.Block block = this.web3j.ethGetBlockByNumber(DefaultBlockParameterName.LATEST, false).send().getBlock();
        logger.info("current number:"+block.getNumber());
        BigInteger timestampUnix = block.getTimestamp();
        logger.info("time add Before:"+timestampUnix);
        
        
        timestampUnix = timestampUnix.add(new BigInteger("1000"));
        logger.info("time add After:"+timestampUnix);
        
        
        StaticGasProvider staticGasProvider = new StaticGasProvider(StringUtils.isEmpty(gasPrice) ? new BigInteger(defaultGasPriceTheBuy) : new BigInteger(gasPrice) ,
                StringUtils.isEmpty(gasLimit) ? new BigInteger(defaultGasLimitTheBuy) : new BigInteger(gasLimit));
        
        this.pancakeRouter02.setGasProvider(staticGasProvider);
        
        RemoteFunctionCall<TransactionReceipt> transactionReceiptRemoteFunctionCall = this.pancakeRouter02.swapExactTokensForTokens(amountInput.toBigInteger(), amountOutput.toBigInteger(), path, walletCredentials.getAddress(), timestampUnix);
        TransactionReceipt buyResult = transactionReceiptRemoteFunctionCall.send();
        return buyResult;
    }
    
    
    public TransactionReceipt sell(String contractAddress,String tokenAmount) throws Exception {
        return sell(contractAddress, tokenAmount, null,null );
    }
    
    public List getAmountsOut(BigInteger amountIn, List<String> path) throws Exception {
        return this.pancakeRouter02.getAmountsOut(amountIn, path).send();
    }
    
    public List getAmountsIn(BigInteger amountIn, List<String> path) throws Exception {
        return this.pancakeRouter02.getAmountsIn(amountIn, path).send();
    }
    
    public String getPair(String token0, String token1) throws Exception {
        return this.uniswapFactory.getPair(token0, token1).send();
    }
    
    
    
    public TransactionReceipt sell(String contractAddress,String tokenAmount,String gasPrice,String gasLimit) throws Exception{
        
        BigDecimal amountInput = new BigDecimal(tokenAmount);
        
        BigDecimal amountOutput = new BigDecimal("1");
        
        List<String> path = new ArrayList<>();
        path.add(contractAddress);
        path.add(defaultNetTokenAddress);
        path.add(usdtAddress);
        
        EthBlock.Block block = this.web3j.ethGetBlockByNumber(DefaultBlockParameterName.LATEST, false).send().getBlock();
        logger.info("current number:"+block.getNumber());
        BigInteger timestampUnix = block.getTimestamp();
        logger.info("time add Before:"+timestampUnix);
        
        
        timestampUnix = timestampUnix.add(new BigInteger("1000"));
        logger.info("time add After:"+timestampUnix);
        
        StaticGasProvider staticGasProvider = new StaticGasProvider(StringUtils.isEmpty(gasPrice) ? new BigInteger(defaultGasPriceTheSell) : new BigInteger(gasPrice) ,
                StringUtils.isEmpty(gasLimit) ? new BigInteger(defaultGasLimitTheSell) : new BigInteger(gasLimit));
        this.pancakeRouter02.setGasProvider(staticGasProvider);
        
        
        TransactionReceipt sellResult = this.pancakeRouter02.swapExactTokensForTokensSupportingFeeOnTransferTokens(amountInput.toBigInteger(), amountOutput.toBigInteger(), path, walletCredentials.getAddress(), timestampUnix).send();
        return sellResult;
        
    }
}
