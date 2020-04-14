package com.team.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.service.MemberService;
import com.team.vo.Member;

@Controller
@RequestMapping(path = {"/account/"})
public class AccountController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@GetMapping(path = {"/register.action"})
	public String toRegister() {
		
		return "account/register";
	}
	
	@PostMapping(path = {"/register.action"})
	public String register(Member member, RedirectAttributes attr) {
		
		memberService.registerMember(member);
		
		attr.addFlashAttribute("newId", member.getEmail());
		
		return "redirect:login.action";
	}
	
	@GetMapping(path = {"/login.action"})
	public String toLogin() {
		return "account/login";
	}
	
	@PostMapping(path = {"login.action"})
	public String login(Member member, HttpSession session) {
	
		Member member2 = memberService.findMemberByEmailAndPassword(member);
		if (member2 == null) {
			return "redirect:/account/login.action";
		}else {
			session.setAttribute("loginuser", member2);
			return "redirect:/";
		}
	}
	
	@GetMapping(path = {"/logout.action"})
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		return "redirect:/";
	}

}
