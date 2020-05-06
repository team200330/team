package com.team.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping({"/", "/home"})
	public String home(Model model, HttpSession session) {
		
		
		return "home";
	}
	
	
	@GetMapping("/home2")
	public String home2() {
		return "home2";
	}
	
}
