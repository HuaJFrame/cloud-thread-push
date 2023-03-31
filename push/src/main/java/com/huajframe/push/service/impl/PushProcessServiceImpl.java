package com.huajframe.push.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huajframe.common.enums.PushFlagEnum;
import com.huajframe.common.enums.PushStateEnum;
import com.huajframe.common.util.Result;
import com.huajframe.push.dao.PushProcessMapper;
import com.huajframe.push.entity.PushProcess;
import com.huajframe.push.factory.PushMessageThreadFactory;
import com.huajframe.push.feign.ReceiveFeignService;
import com.huajframe.push.service.IPushProcessService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Hua JFrame
 * @since 2023-03-30
 */
@Service
@Slf4j
public class PushProcessServiceImpl extends ServiceImpl<PushProcessMapper, PushProcess> implements IPushProcessService {

    @Autowired
    private ReceiveFeignService receiveFeignService;

    @Autowired
    private PushProcessMapper pushProcessMapper;

    /**
     * 每个线程每次查询消息条数
     */
    private static final Integer LIMIT = 20;
    /**
     * 核心线程数量
     */
    private static final Integer CORE_POOL_SIZE = 2;
    /**
     * 最大线程数量
     */
    private static final Integer MAXIMUM_POOl_SIZE = 10;

    ThreadPoolExecutor pool = new ThreadPoolExecutor(CORE_POOL_SIZE,
            MAXIMUM_POOl_SIZE,
            3,
            TimeUnit.SECONDS,
            new LinkedBlockingQueue<>(100),
            new PushMessageThreadFactory("推送消息"));

    /**
     * 跨服务推送消息
     *
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void pushData() throws ExecutionException, InterruptedException {
        //计数器，需要保证线程安全
        int count = 0;
        //未推送数据总数
        Long total = pushProcessMapper.selectCount(
                new QueryWrapper<PushProcess>().eq("push_state", PushStateEnum.UN_PUSH.getCode())
        );
        log.info("未推送数据条数：{}", total);
        //计算需要多少轮
        long num = total / ((long)LIMIT * CORE_POOL_SIZE) + 1;
        log.info("要经过的轮数:{}", num);
        //统计总共推送成功的数据条数
        long totalSuccessCount = 0;
        for (int i = 0; i < num; i++) {
            //接收线程返回结果
            List<Future<Long>> futureList = new ArrayList<>(32);
            //起CORE_POOL_SIZE个线程并行查询更新库，加锁
            for (int j = 0; j < CORE_POOL_SIZE; j++) {
                synchronized (PushProcessServiceImpl.class) {
                    int start = count * LIMIT;
                    count++;
                    //提交线程，用数据起始位置标识线程
                    Future<Long> future = pool.submit(new PushDataTask(start, LIMIT));
                    //先不取值，防止阻塞,放进集合
                    futureList.add(future);
                }
            }
            //统计本轮推送成功数据
            for (Future f : futureList) {
                totalSuccessCount += (long)f.get();
            }
        }
        //关闭线程池
        pool.shutdown();
        //更新推送标志
        pushProcessMapper.update(null, new UpdateWrapper<PushProcess>().set("push_state", PushStateEnum.PUSHED.getCode()));
        log.info("推送数据完成，需推送数据:{},推送成功：{}", total, totalSuccessCount);
    }

    /**
     * 推送数据线程类
     */
    class PushDataTask implements Callable<Long> {
        long start;
        int limit;

        PushDataTask(int start, int limit) {
            this.start = start;
            this.limit = limit;
        }

        @Override
        public Long call() throws Exception {
            //设置线程名字
            Thread.currentThread().setName("Message" + start);
            long count = 0;
            //推送的数据
            List<PushProcess> pushProcessList = pushProcessMapper.selectList(
                    new QueryWrapper<PushProcess>()
                            .eq("push_state", PushStateEnum.UN_PUSH.getCode())
                            .last("limit " + start + "," + limit)
            );
            if (CollectionUtils.isEmpty(pushProcessList)) {
                return count;
            }
            log.info("推送区间：[{},{}]数据", start, start + limit);
            for (PushProcess process : pushProcessList) {
                Result result = receiveFeignService.sendMessage(process);
                if (result.getCode().equals(0)) {   //推送成功
                    //更新推送标识
                    update(
                            new UpdateWrapper<PushProcess>()
                                    .set("push_flag", PushFlagEnum.SUCCESS.getCode())
                                    .eq("id", process.getId())
                    );
                    count++;
                } else {  //推送失败
                    update(
                            new UpdateWrapper<PushProcess>()
                                    .set("push_flag", PushFlagEnum.FAIL.getCode())
                                    .eq("id", process.getId())
                    );
                }
            }
            log.info("推送区间[{},{}]数据,推送成功{}条！", start, start + limit, count);
            return count;
        }
    }
}
