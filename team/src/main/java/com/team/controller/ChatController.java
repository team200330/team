package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.ChatService;
import com.team.vo.Chat;
import com.team.vo.ChatMember;
import com.team.vo.Message;

@Controller
@RequestMapping(path = {"/chatting"})
public class ChatController {
	
	@Autowired
	@Qualifier("chatService")
	private ChatService chatService;
	
	private List<Message> messages = null;

	
	@GetMapping("/chat")
	public String toChat(int chatNo, Model model, Message message, HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
		
        List<Message> messages = chatService.readMessage();
		model.addAttribute("messages", messages);
		return String.format("redirect:chat?chatNo=%d", chatNo);
	}
	
	@PostMapping("/create")
	public String create(Chat chat) {
		chatService.createChatting(chat);
		
		return "/";
	}
	
	@PostMapping("/send")
	@ResponseBody
	public String send(Message message) {
		
	   chatService.sendMessage(message);
		
		return "success";
	}
	
}
