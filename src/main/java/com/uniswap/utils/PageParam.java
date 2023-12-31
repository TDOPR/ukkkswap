package com.uniswap.utils;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PageParam<T,C> {
    /**
     * 分页对象
     *
     * @ignore
     */
    private Page<T> page;
    
    /**
     * 当前页 默认值为1
     */
    private Integer currentPage = 1;
    
    /**
     * 每页显示的数量 默认值为10
     */
    private Integer pageSize = 10;
    
    /**
     * 查询条件
     */
    private C searchParam;
    
    public Page<T> getPage() {
        this.page = new Page<>(this.currentPage, this.pageSize);
        return page;
    }
}
