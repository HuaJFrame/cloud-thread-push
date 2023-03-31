package com.huajframe.push.factory;


import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author Hua JFarmer
 */
public class PushMessageThreadFactory implements ThreadFactory {

    private final String namePrefix;
    private final AtomicInteger nextId = new AtomicInteger(1);


    public PushMessageThreadFactory(String message) {
        namePrefix = "From PushMessageThreadFactory " + message + "-Worker-";
    }

    @Override
    public Thread newThread(Runnable task) {
        String name = namePrefix + nextId.getAndIncrement();
        Thread thread = new Thread(task, name);
        System.out.println(thread.getName());
        return thread;
    }
}
