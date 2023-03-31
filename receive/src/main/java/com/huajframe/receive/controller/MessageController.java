package com.huajframe.receive.controller;


import com.huajframe.common.dto.PushProcess;
import com.huajframe.common.util.Result;
import org.springframework.web.bind.annotation.*;

/**
 * @author Hua JFarmer
 */
@RestController
@RequestMapping("/receive")
public class MessageController {

    @PostMapping("/test")
    public Result messageReceive(){
        System.out.println("收到消息");
        return Result.ok();
    }

    @PostMapping("/receive")
    public Result sendMessage(@RequestBody PushProcess process){
        return Result.ok();
    }
}
