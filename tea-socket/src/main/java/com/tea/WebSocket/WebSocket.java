package com.tea.WebSocket;


import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.tea.common.socket.Enum.MessageEnum;
import com.tea.common.socket.MessageVo;
import org.springframework.stereotype.Component;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

//配置地址
@ServerEndpoint("/webSocket/{userId}")
@Component
public class WebSocket {

    //前端请求时一个websocket时
    @OnOpen
    public void onOpen(Session session, @PathParam("userId") String userId) {
        WebSocketUtils.addSession(session, userId);
        System.out.println("【websocket消息】有新的连接,连接id"+userId);
        System.out.println("【websocket消息】连接总数:"+ WebSocketUtils.socketUserVos.size());
    }

    //前端关闭时一个websocket时
    @OnClose
    public void onClose(@PathParam("userId") String userId) {
        WebSocketUtils.rmSession(userId);
        System.out.println("【websocket消息】连接断开,总数:"+ WebSocketUtils.socketUserVos.size());
    }

    //前端向后端发送消息
    @OnMessage
    public void onMessage(Session session,String message) {
        JSONObject jsonObject = JSON.parseObject(message);
        MessageVo messageVo = JSONUtil.toBean(JSONUtil.toJsonStr(jsonObject), MessageVo.class);
        //验证心跳
        if (MessageEnum.heartbeat.name().equals(jsonObject.getString("type"))){
            WebSocketUtils.addHeartbeat(session);
        }else {
            WebSocketUtils.sendMessage(messageVo);
        }
    }
}
