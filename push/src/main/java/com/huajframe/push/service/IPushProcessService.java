package com.huajframe.push.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huajframe.push.entity.PushProcess;

import java.util.concurrent.ExecutionException;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Hua JFrame
 * @since 2023-03-30
 */
public interface IPushProcessService extends IService<PushProcess> {

    /**
     * 跨服务推送消息
     * @return
     */
    void pushData() throws ExecutionException, InterruptedException;
}
