package com.huajframe.common.enums;

import lombok.Getter;

/**
 * @author Hua JFarmer
 */

@Getter
public enum PushStateEnum {

    /**
     * 未推送
     */
    UN_PUSH(0),
    /**
     * 已推送
     */
    PUSHED(1);

    private int code;

    PushStateEnum(int code){
        this.code = code;
    }
}
