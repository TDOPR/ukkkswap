//package com.uniswap.utils;
//
//import com.uniswap.entity.dto.HeaderInfo;
//import com.uniswap.manager.ThreadLocalManager;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Component;
//
//import javax.servlet.*;
//import javax.servlet.http.HttpServletRequest;
//import java.io.IOException;
//
//@Component
//@Slf4j
//public class HttpFilter implements Filter {
//    @Override
//    public void init(FilterConfig filterConfig) {
//    }
//
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest request = (HttpServletRequest) servletRequest;
//        HeaderInfo headerInfo = new HeaderInfo();
//        headerInfo.setChianId(new Integer(request.getHeader(SystemConstants.CHAIN_ID)));
//        headerInfo.setUserAddress(request.getHeader(SystemConstants.USER_ADDRESS));
//        //log.info("language={},token={},local={}", headerInfo.getLanguage(), headerInfo.getToken(),new Locale(headerInfo.getLanguage()));
//        //在ThreadLocal中添加当前线程的id
//        ThreadLocalManager.add(headerInfo);
//        filterChain.doFilter(servletRequest, servletResponse);
//    }
//
//    @Override
//    public void destroy() {
//    }
//}
