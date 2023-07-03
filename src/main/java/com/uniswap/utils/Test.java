//package com.uniswap.utils;
//
//import org.web3j.crypto.Credentials;
//import org.web3j.crypto.WalletUtils;
//import org.web3j.protocol.Web3j;
//import org.web3j.protocol.core.methods.response.TransactionReceipt;
//import org.web3j.protocol.http.HttpService;
//
//public class Test {
//
//    public void PancakeTransactionTest() throws Exception{
//
//        Web3j web3jObj = Web3j.build(new HttpService("http://链上地址/"));
//        Credentials wallet = WalletUtils.loadJsonCredentials("自己的密码", "json文");
//
//        PancakeSwapTransaction pancakeSwapTransaction = new PancakeSwapTransaction(web3jObj, wallet, chainId);
//        TransactionReceipt buy = pancakeSwapTransaction.buy("0x地址", "2");
//
//
//    }
//
//}
