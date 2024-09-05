package com.tea.WebSocket.Vo;

import javax.websocket.Session;
import java.util.Date;

public class SocketUser {


    /**用户id*/
    private String userId;
    /**用户名*/
    private String userName;

    /** 用户角色 */
    private String userRole;

    /** 房间号 */
    private String roomId;
    /** websocket session对象 */
    private Session session;
    /** 消息类型 */
    private String type;
    /** 检测心跳时间 */
    private Date heartTime;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getHeartTime() {
        return heartTime;
    }

    public void setHeartTime(Date heartTime) {
        this.heartTime = heartTime;
    }
}
