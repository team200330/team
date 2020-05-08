package com.team.service;

import java.util.List;

import com.team.mapper.ChatMapper;
import com.team.vo.Chat;
import com.team.vo.Message;

import lombok.Setter;

public class ChatServiceImpl implements ChatService {
	
	@Setter
	private ChatMapper chatMapper;

	@Override
	public void createChatting(Chat chat) {
		chatMapper.createChat(chat);
		
	}

	@Override
	public void sendMessage(Message message) {
		
		chatMapper.insertMessage(message);
		
	}

	@Override
	public List<Message> readMessage() {
		
		return chatMapper.selectMessage();
	}

	
	

}
