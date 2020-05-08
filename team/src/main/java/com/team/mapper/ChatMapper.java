package com.team.mapper;

import java.util.List;

import com.team.vo.Chat;
import com.team.vo.Message;

public interface ChatMapper {

	void insertMessage(Message message);

	void createChat(Chat chat);

	List<Message> selectMessage();
	
	 
	
	
	


}
