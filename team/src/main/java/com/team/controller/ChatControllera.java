package com.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatControllera {
	
	@GetMapping("/chat")
	public String toRegister() {
		
		return "chatting/chat";
	}
	
}
