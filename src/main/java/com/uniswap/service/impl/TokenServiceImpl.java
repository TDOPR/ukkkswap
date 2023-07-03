package com.uniswap.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.uniswap.entity.Token;
import com.uniswap.mapper.TokenMapper;
import com.uniswap.service.TokenService;
import org.springframework.stereotype.Service;

/**
 * @author Dominick Li
 * @Description
 * @CreateTime 2023/3/21 16:29
 **/
@Service
public class TokenServiceImpl  extends ServiceImpl<TokenMapper, Token> implements TokenService {
}
