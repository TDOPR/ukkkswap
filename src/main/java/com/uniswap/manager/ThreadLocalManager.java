package com.uniswap.manager;

import com.uniswap.entity.dto.HeaderInfo;

public class ThreadLocalManager {
    /**
     * 存储请求头信息
     */
    private final static ThreadLocal<HeaderInfo> headerInfoThreadLocal = new ThreadLocal<>();
    
    public static void add(HeaderInfo headerInfo) {
        headerInfoThreadLocal.set(headerInfo);
    }
    
    public static Integer getChainId() {
        return headerInfoThreadLocal.get().getChianId();
    }
    
    public static String getUserAddress() {
        return headerInfoThreadLocal.get().getUserAddress();
    }
    
//    public static String getHeaderInfo() {
//        return headerInfoThreadLocal.get().getLanguage();
//    }
    
    /**
     * 释放资源
     */
    public static void remove() {
        headerInfoThreadLocal.remove();
    }
}
