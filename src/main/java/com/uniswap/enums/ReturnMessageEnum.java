package com.uniswap.enums;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public enum ReturnMessageEnum {

    TOKEN_CAST_ERROR("token_cast_error", "货币换算异常"),
    CHAIN_ID_ERROR("chain_id_error", "不支持该CHAINID"),
    PARAM_IS_NULL("param_not_filled", "参数未填");

    private String code;

    private String desc;

    public String getCode() {
        return code;
    }

}
