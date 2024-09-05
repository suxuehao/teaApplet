package com.tea.common.socket;


/**
 * WebSocket消息实体
 *
 * @author remote
 */
public class MessageVo {

	/** 房间号 */
	private String roomId;

	/** 用户Id */
	private String userId;

	/** 消息内容 */
	private String message;

	/** 消息类型 */
	private String type;


	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
