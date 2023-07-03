package com.uniswap.entity.dto;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

@Data
public class PageDTO {
    /**
     * 当前页
     */
    private Integer currentPage = 1;
    
    /**
     * 每页显示的数据
     */
    private Integer pageSize = 10;
    
    /**
     * 链id
     */
    private String chainIdX;
    
    /**
     * 用户地址
     */
    private String userAddress;
    
    /**
     * 是否第一次加载
     */
    private boolean init = true;
    
    public Page getPage() {
        return new Page(currentPage, pageSize);
    }
}
