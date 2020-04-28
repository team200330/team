package com.team.vo;

import java.util.List;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;
	private String chatName; // 채팅방 이름
	
	List<Message> messages;  // 메세지 리스트
	List<ChatMember> members;// 채팅방 멤버 리스트
	
}
