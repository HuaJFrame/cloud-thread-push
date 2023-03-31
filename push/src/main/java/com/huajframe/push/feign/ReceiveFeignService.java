package com.huajframe.push.feign;

import com.huajframe.common.util.Result;
import com.huajframe.push.entity.PushProcess;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author Hua JFarmer
 */
@FeignClient("receive")
public interface ReceiveFeignService {

    @PostMapping("/receive/test")
    Result messageReceive();

    @PostMapping("/receive/receive")
    Result sendMessage(@RequestBody PushProcess process);
}
