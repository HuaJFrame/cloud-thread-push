package com.huajframe.common.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * <p>
 * 
 * </p>
 *
 * @author Hua JFrame
 * @since 2023-03-30
 */
@Data
@TableName("push_process")
public class PushProcess {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 环节名称
     */
    private String processName;

    /**
     * 审核人
     */
    private String auditPerson;

    /**
     * 审核结果
     */
    private String auditResult;

    /**
     * 推送成功标识：0：推送失败  1：推送成功  
     */
    private Byte pushFlag;

    /**
     * 推送标识： 0：未推送    1：已推送
     */
    private Byte pushState;
}
