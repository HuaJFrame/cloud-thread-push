package com.huajframe.common.enums;

import lombok.Getter;

/**
 * @author Hua JFarmer
 */
@Getter
public enum PushFlagEnum {
    /**
     * 推送失败
     */
    FAIL(0),
    /**
     * 推送成功
     */
    SUCCESS(1);

    private int code;

    PushFlagEnum(int code){
        this.code = code;
    }
}
