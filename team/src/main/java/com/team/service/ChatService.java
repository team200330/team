package com.team.service;

import java.util.List;

import com.team.vo.Chat;
import com.team.vo.Message;

public interface ChatService {


	void createChatting(Chat chat);

	void sendMessage(Message message);

	List<Message> readMessage();
	

}
