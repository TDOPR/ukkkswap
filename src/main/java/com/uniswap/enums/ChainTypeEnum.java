package com.uniswap.enums;

import com.uniswap.config.TokenConfig;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;


@Getter
@AllArgsConstructor
public enum ChainTypeEnum {
    
    
    
    ETH(1),
    BSC(56);
    

    private int chainId;

    public static ChainTypeEnum chainIdOf(int chainId) {
        for (ChainTypeEnum chainTypeEnum : values()) {
            if (chainTypeEnum.getChainId() == chainId) {
                return chainTypeEnum;
            }
        }
        return null;
    }

}
