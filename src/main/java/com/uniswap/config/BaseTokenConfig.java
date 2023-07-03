package com.uniswap.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

/**
 * @author Dominick Li
 * @Description 重配置文件读取基础token列表
 * @CreateTime 2023/4/26 10:52
 **/
@Data
@Configuration
@ConfigurationProperties(prefix = "token.basetoken")
public class BaseTokenConfig {

    public List<String> eth;

    public List<String> bsc;

}
