//package com.bootdo.clouddoadmin.task;
//
//import com.bootdo.clouddoadmin.dao.TokenPrinciple;
//import com.bootdo.clouddoadmin.dto.Response;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.messaging.simp.SimpMessagingTemplate;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//@Component
//public class DemoTask {
//    @Autowired
//    SimpMessagingTemplate template;
//
//    private static final Logger logger = LoggerFactory.getLogger(DemoTask.class);
//
//    @Scheduled(cron = "0/4 * * * * ? ")
//    public void TestSocket() {
//        logger.info("-----socket testing!!!");
////        template.convertAndSendToUser(new TokenPrinciple("aaa").toString()
////                , "/queue/notifications", "新消息：" + "给aaa的消息");
//
//        template.convertAndSend("/topic/getResponse", new Response("欢迎体验bootdo,这是一个任务计划，使用了websocket和quzrtz技术，可以在计划列表中取消，欢迎您加入qq群交流学习!"));
//    }
//}
