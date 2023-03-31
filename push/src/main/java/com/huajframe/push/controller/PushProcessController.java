package com.huajframe.push.controller;

import com.huajframe.common.util.Result;
import com.huajframe.push.feign.ReceiveFeignService;
import com.huajframe.push.service.IPushProcessService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.ExecutionException;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Hua JFrame
 * @since 2023-03-30
 */
@RestController
@RequestMapping("/push")
@Slf4j
public class PushProcessController {

    @Autowired
    private IPushProcessService pushProcessService;

    // @Autowired
    // private ReceiveFeignService receiveFeignService;
    //
    // /**
    //  * 测试openfeign和gateway
    //  * @return
    //  */
    // @RequestMapping("/test")
    // public Result testGateWay(){
    //     Result result = receiveFeignService.messageReceive();
    //     return result;
    // }

    @GetMapping("/push")
    public Result pushData() throws ExecutionException, InterruptedException {
        pushProcessService.pushData();
        return Result.ok();
    }
}
