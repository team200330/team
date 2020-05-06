package com.team.mapper;

import java.util.List;

import com.team.vo.Chat;
import com.team.vo.Message;

public interface ChatMapper {
	
	 void createChat(Chat chat);
	
	 Chat read(int chatNo);
	


}
