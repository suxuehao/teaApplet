package com.tea.WebSocket;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.tea.WebSocket.Vo.SocketUser;
import com.tea.common.socket.Enum.MessageEnum;
import com.tea.common.socket.MessageVo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.Session;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.CopyOnWriteArraySet;


public class WebSocketUtils {
    //concurrent包的线程安全Set用户集
    public static final CopyOnWriteArraySet<SocketUser> socketUserVos = new CopyOnWriteArraySet<>();
    static Logger log = LoggerFactory.getLogger(WebSocketUtils.class);
    /**
     * 建立连接
     */

    public  synchronized  static  void addSession(Session session, String userId){
        //将传递进来的数据转换成对象
        SocketUser bean = new SocketUser();
        bean.setUserId(userId);
        bean.setSession(session);
        socketUserVos.add(bean);
    }

    /**
     * 根据websocket session获取用户对象
     */
    public static SocketUser getSocketUser(Session session) {
        return socketUserVos.stream().filter(socketUser -> session == socketUser.getSession()).findFirst().orElse(new SocketUser());
    }

    /**
     * 根据userSign获取用户对象
     */
    public static SocketUser getSocketUser(String userId) {
        return socketUserVos.stream().filter(socketUserVo -> userId.equals(socketUserVo.getUserId())).findFirst().orElse(new SocketUser());
    }

    /**
     * 移除用户
     */
    public synchronized static void rmSession(Session session) {
        socketUserVos.removeIf(socketUser -> session == socketUser.getSession());
    }

    /**
     * 移除用户
     */
    public synchronized static void rmSession(String userId) {
        socketUserVos.removeIf(rhSocketUserVo -> userId.equals(rhSocketUserVo.getUserId()));
    }

    /**
     * 验证心跳
     */
    public synchronized static void addHeartbeat(Session session) {
        SocketUser socketUserVo = getSocketUser(session);
        Date heartTime = socketUserVo.getHeartTime();
        Date nowTime = new Date();
        socketUserVo.setHeartTime(nowTime);
        // 因延迟可能会出现大于30000的问题
        if (heartTime != null && (nowTime.getTime() - heartTime.getTime()) > 32000) {
            log.info("----------WebSocket心跳接收时间大于30秒,用户ID:{},具体时差:{}----------", socketUserVo.getUserId(), nowTime.getTime() - heartTime.getTime());
        }
    }

    /**
     * 发送心跳
     */
    public static void sendHeartbeat(Session session) {
        MessageVo messageVo = new MessageVo();
        messageVo.setType(MessageEnum.heartbeat.name());
        try {
            session.getBasicRemote().sendText(JSON.toJSONString(messageVo));
        }catch(Exception e){
            log.error("发送心跳异常",e.getMessage());
        }

    }

    /**
     * 发送消息给用户
     */
    public static void sendMessage(MessageVo messageVo) {
        try {
            if (StringUtils.isNotEmpty(messageVo.getRoomId())) {
                log.info("----------WebSocket消息发送,房间号:{},数据格式{}----------", messageVo.getRoomId(), JSON.toJSONString(messageVo));
            } else {
                SocketUser socketUserVo = getSocketUser(messageVo.getUserId());
                if (StringUtils.isNotEmpty(socketUserVo.getUserId())){
                    log.info("----------WebSocket消息发送,用户ID:{},用户ID:{},数据格式{}----------", socketUserVo.getUserId(),socketUserVo.getUserRole(), JSON.toJSONString(messageVo));
                }else {
                    log.info("----------WebSocket找不到该用户标识Id:{}----------", messageVo.getUserId());
                    return;
                }
            }
            //如果messageVo参数有房间号则发送给该房间所有用户，没有房间号则发送给具体用户
            socketUserVos.stream()
                    .filter(vo -> StringUtils.isNotEmpty(messageVo.getRoomId())
                            ? messageVo.getRoomId().equals(vo.getRoomId())
                            : messageVo.getUserId().equals(vo.getUserId()))
                    .forEach(vo -> {
                        try {
                            vo.getSession().getBasicRemote().sendText(JSON.toJSONString(messageVo));
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                    });
        } catch (Exception e) {
            e.printStackTrace();
            log.error("发送消息异常",e.getMessage());
        }
    }

}

