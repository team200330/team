package com.team.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.service.MemberService;
import com.team.vo.Member;

@Controller
@RequestMapping(path = {"/account/"})
public class AccountController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	//회원가입 페이지 이동
	@GetMapping(path = {"/register.action"})
	public String toRegister() {
		
		return "account/register";
	}
	
	//회원가입
	@PostMapping(path = {"/register.action"})
	public String register(Member member, RedirectAttributes attr) {
		
		memberService.registerMember(member);
		System.out.println(member.toString());
		attr.addFlashAttribute("newEmail", member.getEmail());
		
		return "redirect:login.action";
	}
	
	//로그인 페이지 이동
	@GetMapping(path = {"/login.action"})
	public String toLogin() {
		return "account/login";
	}
	
	//로그인
	@PostMapping(path = {"login.action"})
	public String login(Member member, HttpSession session, Model model, RedirectAttributes attr) {
	
		Member member2 = memberService.findMemberByEmailAndPassword(member);
		if (member2 == null) {
			attr.addFlashAttribute("loginFalse", member);
			return "redirect:/account/login.action";
		}else {
			session.setAttribute("loginuser", member2);
			model.addAttribute("member", member2);
			return "redirect:/";
		}
	}
	
	//이메일 중복체크
	@GetMapping("/checkEmail.action")
	@ResponseBody
	public String checkEmail(String email) {
		Member member = memberService.findMemberByEmail(email);
		if(member == null) return "success";
		else return "error";
	}
	
	//로그아웃 
	@GetMapping(path = {"/logout.action"})
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		return "redirect:/";
	}

}
