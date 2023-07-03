package com.uniswap.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;


/**
 * @author Dominick Li
 * @Description
 * @CreateTime 2023/2/21 15:48
 **/
@Data
@Configuration
@ConfigurationProperties(prefix = "token")
public class TokenConfig {
    
    /**
     * ETH Router地址
     */
    
    private String routerEthAddress;
    /**
     * BSC Router地址
     */
    
    private String routerBscAddress;
    /**
     * web3Eth请求地址
     */
    private String web3EthServiceUrl;
    /**
     * web3Bsc请求地址
     */
    private String web3BscServiceUrl;
    
    /**
     * 以太坊链id
     */
    private Integer chainIdEth;
    
    /**
     * BSC链id
     */
    private Integer chainIdBsc;

    /**
     * 钱包账号
     */
    private String web3Wallet;

    /**
     * 获取最短路径
     */
    private String serverUrl;
    
    public Integer getChainIdEth() {
        return chainIdEth;
    }
    
    public Integer getChainIdBsc() {
        return chainIdBsc;
    }

}
