package com.uniswap.init;

import com.uniswap.config.BaseTokenConfig;
import com.uniswap.config.TokenConfig;
import com.uniswap.entity.PairBscEntity;
import com.uniswap.entity.PairEntity;
import com.uniswap.service.PairBscService;
import com.uniswap.service.PairService;
import com.uniswap.utils.GraphDataMapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author Dominick Li
 * @Description 初始化
 * @CreateTime 2023/2/21 16:05
 **/
@Component
public class InitListen implements CommandLineRunner {

    @Autowired
    PairService pairService;
    
    @Autowired
    PairBscService pairBscService;

    @Autowired
    TokenConfig tokenConfig;

    @Autowired
    BaseTokenConfig baseTokenConfig;

    @Override
    public void run(String... args) throws Exception {
        //查询可用的token关系对
        GraphDataMapUtils.intBaseToken(baseTokenConfig);
        List<PairEntity> tokenList = pairService.list();
        List<PairBscEntity> tokenBscList = pairBscService.list();
        GraphDataMapUtils.buildDigraph(tokenList);
        GraphDataMapUtils.buildBscDigraph(tokenBscList);
    }
}
