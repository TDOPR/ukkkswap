package com.uniswap.config;

import com.uniswap.service.impl.HttpSerivceEx;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.web3j.protocol.Web3jService;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.core.JsonRpc2_0Web3j;

@Configuration
@Slf4j
public class ERC20Config {

//    @Value(value = "${eth.point.url}")
//    String ETH_POINT_URL;
    
    @Autowired
    private TokenConfig tokenConfig;

//    @Value(value = "${eth.swap_token}")
//    String SWAP_TOKEN;

//    @Resource
//    private CoinConfigDao coinConfigDao;

    @Bean
    public Web3jService web3jService() {
        return new HttpSerivceEx(tokenConfig.getWeb3EthServiceUrl());
    }
    
    @Bean
    public Web3jService web3jBscService() {
        return new HttpSerivceEx(tokenConfig.getWeb3BscServiceUrl());
    }

    @Bean
    public Admin admin() {
        return Admin.build(web3jService());
    }
    
    @Bean
    public Admin adminBsc() {
        return Admin.build(web3jBscService());
    }

    @Bean
    public JsonRpc2_0Web3j jsonRpc() {
        return new JsonRpc2_0Web3j(web3jService());
    }
    
    @Bean
    public JsonRpc2_0Web3j jsonBscRpc() {
        return new JsonRpc2_0Web3j(web3jBscService());
    }

//    @Bean
//    @Scope("prototype")
//    @Autowired
//    public EthFilter ethFilter(JsonRpc2_0Web3j jsonRpc) throws IOException {
//        //获取启动时监听的区块
//        CoinConfigEntity scanDataConfig = coinConfigDao.getScanDataConfig();
//        BigInteger oldBlock = scanDataConfig.getBlockNo(); //上次已检索的区块高度
//        BigInteger fromblock = oldBlock.add(BigInteger.ONE);
//        return new EthFilter(DefaultBlockParameter.valueOf(fromblock),
//                DefaultBlockParameterName.LATEST, SWAP_TOKEN);
//    }
}
