package com.shoppingmall.belleaf.chatting.vo;

public enum ChatMessageState {
	STATE_ERROR("에러", -1),
	STATE_BOT("봇", 1),
	STATE_USER("사용자", 2);
	
	public String ChatMessageStateName;
	public int Index;

    ChatMessageState(String _ChatMessageStateName, int _Index) {
	    this.ChatMessageStateName = _ChatMessageStateName;
	    this.Index = _Index;
	}
	
	public static ChatMessageState IndexToChatMessageState(int index) {
		switch (index) {
		case 1: return STATE_BOT;
		case 2: return STATE_USER;
		default: return STATE_ERROR;
		}
	}
}
