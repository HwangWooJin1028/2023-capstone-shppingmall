package com.shoppingmall.belleaf.chatting.vo;

public class ChatVO {
	private String message;
	private ChatMessageState messageState;
	
	public ChatVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ChatVO(String message, ChatMessageState messageState) {
		super();
		this.message = message;
		this.messageState = messageState;
	}


	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public ChatMessageState getMessageState() {
		return messageState;
	}
	public void setMessageState(ChatMessageState messageState) {
		this.messageState = messageState;
	}
	
	@Override
	public String toString() {
		return "ChatVO [message=" + message + ", messageState=" + messageState + "]";
	}
}
