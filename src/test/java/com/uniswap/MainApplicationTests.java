package com.uniswap;

import cn.hutool.core.date.TimeInterval;
import cn.hutool.core.io.FileUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.uniswap.config.TokenConfig;
import com.uniswap.entity.PairEntity;
import com.uniswap.entity.Token;
import com.uniswap.service.PairService;
import com.uniswap.service.TokenService;
import com.uniswap.utils.GraphUtils;
import com.uniswap.utils.PancakeFactoryTransaction;
import com.uniswap.utils.PancakeSwapTransaction;
import jnr.ffi.annotations.In;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.http.HttpService;

import javax.annotation.Resource;
import java.io.File;
import java.math.BigInteger;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Slf4j
@SpringBootTest
class MainApplicationTests {

    @Autowired
    PairService pairService;

    @Autowired
    TokenConfig tokenConfig;

    @Resource
    TokenService tokenService;

    @Test
    void contextLoads() throws Exception {
        test2();
//        insertDataToDataBase();
    }

    void test1() throws Exception {
        Web3j web3jObj = Web3j.build(new HttpService("https://bsc-dataseed1.defibit.io"));
        web3jObj.ethBlockNumber().send();
        Credentials wallet = Credentials.create("11f88eb3a9b868670c01a5582652ed69437479133d226f33c6117f9a3f53b180");
        PancakeFactoryTransaction pancakeFactoryTransaction = new PancakeFactoryTransaction(web3jObj, wallet);
//        String pair = pancakeFactoryTransaction.getPair("0x56b6fb708fc5732dec1afc8d8556423a2edccbd6", "0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c");
//        System.out.println(pair);
        List<BigInteger> amountOut = pancakeFactoryTransaction.getAmountsOut(new BigInteger("100000"), Arrays.asList("0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c", "0xb27adaffb9fea1801459a1a81b17218288c097cc"));
        //List<TransactionReceipt> amountOut = pancakeFactoryTransaction.getAmountsOut(new BigInteger("100"), PancakeSwapTransaction.PATH);
//        System.out.println(JSONObject.toJSONString(amountOut.get(amountOut.size() - 1)));
//        TransactionReceipt buy = pancakeSwapTransaction.buy("0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae", "2");
//        System.out.println(buy);
//        String tokenBalance = balanceOf("0x地址", wallet.getAddress());
//        TransactionReceipt sell = pancakeSwapTransaction.sell("0x地址", tokenBalance);
//        System.out.println(sell);
    }

    void test2() throws Exception {
//        System.out.println(JSONObject.toJSONString(tokenConfig.getBaseList()));
        String token0 = "0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c".toLowerCase();
        String token1 = "0x55d398326f99059fF775485246999027B3197955".toLowerCase();
        List<String> data = solution(token0, token1, 56);
        System.out.printf("token0=%s 换成token1=%s 的最佳路径=%s", token0, token1, JSONObject.toJSONString(data));
    }

    /**
     * 根据Token找到换算金额最大的路径
     *
     * @param token0 源Token
     * @param token1 换算的Token
     * @return 最大换算金额路径
     * @throws Exception
     */
    List<String> solution(String token0, String token1, Integer chainId) throws Exception {
        TimeInterval timeInterval = new TimeInterval();
        timeInterval.start();

        List<PairEntity> tokenList = pairService.list();
        GraphUtils.buildDigraph(tokenList);

        long init = timeInterval.intervalRestart();

        List<List<String>> list = GraphUtils.searchPath(token0, token1);
        long search = timeInterval.intervalRestart();
        System.out.println("共有" + list.size() + "种方案");
        List<BigInteger> result = new ArrayList<>();
        Web3j web3jObj = Web3j.build(new HttpService("https://bsc-dataseed1.defibit.io"));
        web3jObj.ethBlockNumber().send();
        Credentials wallet = Credentials.create("11f88eb3a9b868670c01a5582652ed69437479133d226f33c6117f9a3f53b180");
        PancakeSwapTransaction pancakeSwapTransaction = new PancakeSwapTransaction(web3jObj, wallet, chainId);
        Map<BigInteger, List<String>> resultMap = new HashMap<>();
        ExecutorService theadPool = Executors.newFixedThreadPool(10);
        CountDownLatch countDownLatch = new CountDownLatch(list.size());
        BigInteger curCmount = new BigInteger("100");
        for (List<String> path : list) {
            theadPool.execute(() -> {
                try {
                    List<BigInteger> amountOut = pancakeSwapTransaction.getAmountsOut(curCmount, path);
                    System.out.println(JSONObject.toJSONString(path) + "," + amountOut.get(amountOut.size() - 1));
                    BigInteger amount = amountOut.get(amountOut.size() - 1);
                    result.add(amount);
                    resultMap.put(amount, path);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    countDownLatch.countDown();
                }
            });
        }

        countDownLatch.await();
        long http = timeInterval.intervalRestart();
        System.out.println("共有" + result.size() + "种方案");
        System.out.println(JSONObject.toJSONString(result));
        BigInteger max = result.stream().max(BigInteger::compareTo).get();
        //31927
        System.out.println("最大=" + max + "初始化耗时:" + init + "ms,查找耗时:" + search + "ms,请求耗时:" + http + "ms,总耗时:=" + (init + search + http));
        theadPool.shutdown();
        return resultMap.get(max);
    }

    void insertDataToDataBase() {
        String str = FileUtil.readString(new File("C:\\Users\\Administrator\\Desktop\\pancakeswap-top-100.json"), "utf-8");
        JSONObject data = JSONObject.parseObject(str);
        JSONArray array = data.getJSONArray("tokens");
        List<Token> tokens = new ArrayList<>();
        Token token;
        JSONObject object;
        for (int i = 0; i < array.size(); i++) {
            object = array.getJSONObject(i);
            token = Token.builder()
                    .address(object.getString("address"))
                    .symbol(object.getString("symbol"))
                    .name(object.getString("name"))
                    .chainId(object.getLong("chainId"))
                    .decimals(object.getLong("decimals"))
                    .logoUrl(object.getString("logoURI"))
                    .build();
            tokens.add(token);
        }
        tokenService.saveBatch(tokens);
    }
}
