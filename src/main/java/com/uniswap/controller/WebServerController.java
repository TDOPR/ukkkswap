package com.uniswap.controller;

import cn.hutool.core.date.TimeInterval;
import cn.hutool.core.io.FileUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.uniswap.config.TokenConfig;
import com.uniswap.entity.DepositWithdrawEntity;
import com.uniswap.entity.Token;
import com.uniswap.entity.dto.DepositTokenInfoDto;
import com.uniswap.entity.dto.PageDTO;
import com.uniswap.entity.dto.TokenInfoDTO;
import com.uniswap.entity.vo.*;
import com.uniswap.enums.ReturnMessageEnum;
import com.uniswap.manager.ThreadLocalManager;
import com.uniswap.mapper.DepositWithdrawDao;
import com.uniswap.mapper.TokenDao;
import com.uniswap.service.TokenService;
import com.uniswap.utils.GraphDataMapUtils;
import com.uniswap.utils.PancakeSwapTransaction;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.http.HttpService;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.io.File;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author Dominick Li
 * @Description
 * @CreateTime 2023/2/21 16:36
 **/
@Slf4j
@RestController
public class WebServerController {

    @Autowired
    private TokenConfig tokenConfig;

    @Autowired
    private TokenDao tokenDao;

    @Value(value = "${eth.token_list_path}")
    String TOKEN_LIST_PATH;

    @Autowired
    TokenService tokenService;

    @Resource
    DepositWithdrawDao depositWithdrawDao;
    
    

    /**
     * 根据TokenA和TokenB计算可行的所有路径，返回最优路径和可换算的最大金额
     */
    @PostMapping("/getOptimalPath")
    public JsonResult<OptimalPathVO> getOptimalPath(@Valid @RequestBody TokenInfoDTO tokenInfoDTO) throws Exception {
        Integer chainId = Integer.parseInt(tokenInfoDTO.getChainIdX().substring(2), 16);
        if (chainId.equals(tokenConfig.getChainIdEth())) {
            String tokenA = tokenInfoDTO.getTokenA().toLowerCase();
            String tokenB = tokenInfoDTO.getTokenB().toLowerCase();
            TimeInterval timeInterval = new TimeInterval();
            timeInterval.start();
            List<List<String>> pathsList = GraphDataMapUtils.searchPath(chainId, tokenA, tokenB);
            long search = timeInterval.intervalRestart();
            int len = pathsList.size();
    
            System.out.println("共有" + len + "种方案");
            if (len == 0) {
                pathsList = Arrays.asList(Arrays.asList(tokenA, tokenB));
                len = 1;
            }
            List<BigInteger> result = new ArrayList<>();
            Web3j web3jObj = Web3j.build(new HttpService(tokenConfig.getWeb3EthServiceUrl()));
            web3jObj.ethBlockNumber().send();
            Credentials wallet = Credentials.create(tokenConfig.getWeb3Wallet());
            PancakeSwapTransaction pancakeSwapTransaction = new PancakeSwapTransaction(web3jObj, wallet, chainId);
            Map<BigInteger, List<String>> resultMap = new HashMap<>();
            int threadPoolSize = len < 10 ? len : 10;
    
            ExecutorService theadPool = Executors.newFixedThreadPool(threadPoolSize);
            CountDownLatch countDownLatch = new CountDownLatch(len);
            BigInteger curCmount = tokenInfoDTO.getAmount();
            for (List<String> path : pathsList) {
                theadPool.execute(() -> {
                    try {
                        System.out.println("路径:" + JSONObject.toJSONString(path));
                        List<BigInteger> amountOut = pancakeSwapTransaction.getAmountsOut(curCmount, path);
                        log.info(JSONObject.toJSONString(path) + ",路径换算的金额" + amountOut.get(amountOut.size() - 1));
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
            if (result.size() == 0) {
                return JsonResult.failureResult(ReturnMessageEnum.TOKEN_CAST_ERROR.getCode());
            }
            BigInteger max = result.stream().max(BigInteger::compareTo).get();
            BigDecimal max_bg = new BigDecimal(max);
            BigDecimal amount = new BigDecimal(tokenInfoDTO.getAmount());
            BigDecimal increaseRate = new BigDecimal(max).subtract(amount).multiply(new BigDecimal(100)).divide(amount, 2, BigDecimal.ROUND_FLOOR);
    
            //31927
            log.info("tokenA:{} 换 TokenB:{} 共有{}种路径,有效路径数:{} ,原金额={},最优换算路径换算后的金额={},查找耗时:{}ms,请求耗时:{}ms,总耗时:{}ms", tokenInfoDTO.getTokenA(), tokenInfoDTO.getTokenB(), result.size(), len, tokenInfoDTO.getAmount(), max, search, http, (search + http));
            theadPool.shutdown();
            return JsonResult.successResult(new OptimalPathVO(resultMap.get(max), max_bg.toPlainString(), increaseRate + "%"));
        } else if (chainId.equals(tokenConfig.getChainIdBsc())) {
            String tokenA = tokenInfoDTO.getTokenA().toLowerCase();
            String tokenB = tokenInfoDTO.getTokenB().toLowerCase();
            TimeInterval timeInterval = new TimeInterval();
            timeInterval.start();
            List<List<String>> pathsList = GraphDataMapUtils.searchPath(chainId, tokenA, tokenB);
            long search = timeInterval.intervalRestart();
            int len = pathsList.size();
    
            System.out.println("共有" + len + "种方案");
            if (len == 0) {
                pathsList = Arrays.asList(Arrays.asList(tokenA, tokenB));
                len = 1;
            }
            List<BigInteger> result = new ArrayList<>();
            Web3j web3jObj = Web3j.build(new HttpService(tokenConfig.getWeb3BscServiceUrl()));
            web3jObj.ethBlockNumber().send();
            Credentials wallet = Credentials.create(tokenConfig.getWeb3Wallet());
            PancakeSwapTransaction pancakeSwapTransaction = new PancakeSwapTransaction(web3jObj, wallet, chainId);
            Map<BigInteger, List<String>> resultMap = new HashMap<>();
            int thredPoolSize = len < 10 ? len : 10;
    
            ExecutorService theadPool = Executors.newFixedThreadPool(thredPoolSize);
            CountDownLatch countDownLatch = new CountDownLatch(len);
            BigInteger curCmount = tokenInfoDTO.getAmount();
            for (List<String> path : pathsList) {
                theadPool.execute(() -> {
                    try {
                        System.out.println("路径:" + JSONObject.toJSONString(path));
                        List<BigInteger> amountOut = pancakeSwapTransaction.getAmountsOut(curCmount, path);
                        log.info(JSONObject.toJSONString(path) + ",路径换算的金额" + amountOut.get(amountOut.size() - 1));
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
            if (result.size() == 0) {
                return JsonResult.failureResult(ReturnMessageEnum.TOKEN_CAST_ERROR.getCode());
            }
            BigInteger max = result.stream().max(BigInteger::compareTo).get();
            BigDecimal max_bg = new BigDecimal(max);
            BigDecimal amount = new BigDecimal(tokenInfoDTO.getAmount());
            BigDecimal increaseRate = new BigDecimal(max).subtract(amount).multiply(new BigDecimal(100)).divide(amount, 2, BigDecimal.ROUND_FLOOR);
    
            //31927
            log.info("tokenA:{} 换 TokenB:{} 共有{}种路径,有效路径数:{} ,原金额={},最优换算路径换算后的金额={},查找耗时:{}ms,请求耗时:{}ms,总耗时:{}ms", tokenInfoDTO.getTokenA(), tokenInfoDTO.getTokenB(), result.size(), len, tokenInfoDTO.getAmount(), max, search, http, (search + http));
            theadPool.shutdown();
            return JsonResult.successResult(new OptimalPathVO(resultMap.get(max), max_bg.toPlainString(), increaseRate + "%"));
        } else {
            return JsonResult.failureResult(ReturnMessageEnum.CHAIN_ID_ERROR.getCode());
        }
    }

    /**
     * 根据TokenA和TokenB计算可行的所有路径，返回最优路径和A换B的最小金额
     */
    @PostMapping("/getOptimalPathToB")
    public JsonResult<OptimalPathVO> getOptimalPathToB(@Valid @RequestBody TokenInfoDTO tokenInfoDTO) throws Exception {
        Integer chainId = Integer.parseInt(tokenInfoDTO.getChainIdX().substring(2),16);
        if(chainId.equals(tokenConfig.getChainIdEth())){
            String tokenA = tokenInfoDTO.getTokenA().toLowerCase();
            String tokenB = tokenInfoDTO.getTokenB().toLowerCase();
            TimeInterval timeInterval = new TimeInterval();
            timeInterval.start();
            List<List<String>> pathsList = GraphDataMapUtils.searchPath(chainId,tokenA, tokenB);
            long search = timeInterval.intervalRestart();
            int len = pathsList.size();
    
            System.out.println("共有" + len + "种方案");
            if (len == 0) {
                pathsList = Arrays.asList(Arrays.asList(tokenA, tokenB));
                len = 1;
            }
            List<BigInteger> result = new ArrayList<>();
            Web3j web3jObj = Web3j.build(new HttpService(tokenConfig.getWeb3EthServiceUrl()));
            web3jObj.ethBlockNumber().send();
            Credentials wallet = Credentials.create(tokenConfig.getWeb3Wallet());
            PancakeSwapTransaction pancakeSwapTransaction = new PancakeSwapTransaction(web3jObj, wallet, chainId);
            Map<BigInteger, List<String>> resultMap = new HashMap<>();
            int thredPoolSize = len < 10 ? len : 10;
    
            ExecutorService theadPool = Executors.newFixedThreadPool(thredPoolSize);
            CountDownLatch countDownLatch = new CountDownLatch(len);
            BigInteger curCmount = tokenInfoDTO.getAmount();
            for (List<String> path : pathsList) {
                theadPool.execute(() -> {
                    try {
                        List<BigInteger> amountOut = pancakeSwapTransaction.getAmountsIn(curCmount, path);
                        log.info("{} 路径 换算最小金额={}", JSONObject.toJSONString(path), amountOut.get(0));
                        BigInteger amount = amountOut.get(0);
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
            if (result.size() == 0) {
                return JsonResult.failureResult(ReturnMessageEnum.TOKEN_CAST_ERROR.getCode());
            }
            BigInteger min = result.stream().min(BigInteger::compareTo).get();
            BigDecimal min_bg = new BigDecimal(min);
            BigDecimal amount = new BigDecimal(tokenInfoDTO.getAmount());
            BigDecimal increaseRate = new BigDecimal(min).subtract(amount).multiply(new BigDecimal(100)).divide(amount, 2, BigDecimal.ROUND_FLOOR);
    
            //31927
            log.info("tokenA:{} 换 TokenB:{} 共有{}种路径,有效路径数:{} ,原金额={},最优换算路径最小金额需要={},查找耗时:{}ms,请求耗时:{}ms,总耗时:{}ms", tokenInfoDTO.getTokenA(), tokenInfoDTO.getTokenB(), result.size(), len, tokenInfoDTO.getAmount(), min, search, http, (search + http));
            theadPool.shutdown();
            return JsonResult.successResult(new OptimalPathVO(resultMap.get(min), min_bg.toPlainString(), increaseRate + "%"));
        }else if(chainId.equals(tokenConfig.getChainIdBsc())){
            String tokenA = tokenInfoDTO.getTokenA().toLowerCase();
            String tokenB = tokenInfoDTO.getTokenB().toLowerCase();
            TimeInterval timeInterval = new TimeInterval();
            timeInterval.start();
            List<List<String>> pathsList = GraphDataMapUtils.searchPath(chainId,tokenA, tokenB);
            long search = timeInterval.intervalRestart();
            int len = pathsList.size();
    
            System.out.println("共有" + len + "种方案");
            if (len == 0) {
                pathsList = Arrays.asList(Arrays.asList(tokenA, tokenB));
                len = 1;
            }
            List<BigInteger> result = new ArrayList<>();
            Web3j web3jObj = Web3j.build(new HttpService(tokenConfig.getWeb3BscServiceUrl()));
            web3jObj.ethBlockNumber().send();
            Credentials wallet = Credentials.create(tokenConfig.getWeb3Wallet());
            PancakeSwapTransaction pancakeSwapTransaction = new PancakeSwapTransaction(web3jObj, wallet, chainId);
            Map<BigInteger, List<String>> resultMap = new HashMap<>();
            int thredPoolSize = len < 10 ? len : 10;
    
            ExecutorService theadPool = Executors.newFixedThreadPool(thredPoolSize);
            CountDownLatch countDownLatch = new CountDownLatch(len);
            BigInteger curCmount = tokenInfoDTO.getAmount();
            for (List<String> path : pathsList) {
                theadPool.execute(() -> {
                    try {
                        List<BigInteger> amountOut = pancakeSwapTransaction.getAmountsIn(curCmount, path);
                        log.info("{} 路径 换算最小金额={}", JSONObject.toJSONString(path), amountOut.get(0));
                        BigInteger amount = amountOut.get(0);
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
            if (result.size() == 0) {
                return JsonResult.failureResult(ReturnMessageEnum.TOKEN_CAST_ERROR.getCode());
            }
            BigInteger min = result.stream().min(BigInteger::compareTo).get();
            BigDecimal min_bg = new BigDecimal(min);
            BigDecimal amount = new BigDecimal(tokenInfoDTO.getAmount());
            BigDecimal increaseRate = new BigDecimal(min).subtract(amount).multiply(new BigDecimal(100)).divide(amount, 2, BigDecimal.ROUND_FLOOR);
    
            //31927
            log.info("tokenA:{} 换 TokenB:{} 共有{}种路径,有效路径数:{} ,原金额={},最优换算路径最小金额需要={},查找耗时:{}ms,请求耗时:{}ms,总耗时:{}ms", tokenInfoDTO.getTokenA(), tokenInfoDTO.getTokenB(), result.size(), len, tokenInfoDTO.getAmount(), min, search, http, (search + http));
            theadPool.shutdown();
            return JsonResult.successResult(new OptimalPathVO(resultMap.get(min), min_bg.toPlainString(), increaseRate + "%"));
        }else{
            return JsonResult.failureResult(ReturnMessageEnum.CHAIN_ID_ERROR.getCode());
        }
        
    }

    @GetMapping("/getTokenList")
    public JsonResult<List<Token>> getTokenList() {
        return JsonResult.successResult(tokenDao.getTokenList());
    }

    @GetMapping ("/getInformByAddress/{address}")
    public JsonResult<Integer> getInformByAddress(@PathVariable String address) {
        return JsonResult.successResult(tokenDao.getInformByAddress(address));
    }

    @PostMapping ("/intoTokenListData")
    public void intoTokenListData() {
        String str = FileUtil.readString(new File(TOKEN_LIST_PATH), "utf-8");
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

    @PostMapping("/getDepositWithdrawInfoList")
    public JsonResult<PageVO<DepositWithdrawVO>> getDepositWithdrawInfo(@RequestBody PageDTO pageDTO){
        Integer chainId = Integer.parseInt(pageDTO.getChainIdX().substring(2),16);
//        测试数据
        if(chainId.equals(tokenConfig.getChainIdEth())){
            Page<DepositWithdrawVO> page = depositWithdrawDao.getDepositWithdrawInfo(pageDTO.getPage(), pageDTO.getUserAddress());
            return JsonResult.successResult(new PageVO<>(page));
        }else{
            Page<DepositWithdrawVO> page = depositWithdrawDao.getDepositWithdrawInfoBsc(pageDTO.getPage(), pageDTO.getUserAddress());
            return JsonResult.successResult(new PageVO<>(page));
        }
    }
    
    @PostMapping("/getBaseTokenList")
    public JsonResult<List<Token>> getBaseTokenList(@RequestBody DepositTokenInfoDto depositTokenInfoDto){
        return JsonResult.successResult(tokenDao.getDepositTokenList(depositTokenInfoDto.getBaseAddress()));
    }

}
