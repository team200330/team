package com.team.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.common.Util;
import com.team.service.FeedbackService;
import com.team.service.LogService;
import com.team.service.MemberService;
import com.team.service.WorkspaceService;
import com.team.vo.Member;
import com.team.vo.Workspace;

@Controller
@RequestMapping(path = {"/account/"})
public class AccountController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("workspaceService")
	private WorkspaceService workspaceService;
	
	@Autowired
	@Qualifier("feedbackService")
	private FeedbackService feedbackService;
	
	@Autowired
	@Qualifier("logService")
	private LogService logService;
	
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
			
			List<Workspace> workspaces = workspaceService.selectWorkspacesByEmail(member2.getEmail());
			session.setAttribute("workspaces",workspaces);
			
			
			// 로그인시 읽지않은 피드백개수 가져오기 (탑바)
			HashMap<String, Object> params = new HashMap<>();
			params.put("email", member2.getEmail());
			params.put("workspaceNo", 15); // 15 == 임시 워크스페이스 번호
			session.setAttribute("feedbackCount", feedbackService.uncheckedFeedbackCount(params));
			session.setAttribute("latestFeedbackDate", feedbackService.findLatestWritedate(params));
			
			// 로그인시 읽지않은 로그개수 가져오기 (탑바)
			params.put("projectNo", 1); // 1 == 임시 프로젝트 번호
			session.setAttribute("logCount", logService.uncheckedLogCount(params));
			session.setAttribute("latestLogDate", logService.findLatestWriteDate(params));
			
			
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////
	@GetMapping("/mypage")
	public String mypage() {
		return "/account/mypage";
	}

	@GetMapping("/checkPw")
	@ResponseBody
	public String checkPw(Member member) {
		if (memberService.findMemberByEmailAndPassword(member) != null) return "success";
		else return "error";
	}
	
	@PostMapping("/updatePw")
	@ResponseBody
	public String updatePw(Member member) {
		memberService.updatePassword(member);
		return "success";
	}
	
	@PostMapping("/updateProfile")
	@ResponseBody
	public String updateProfile(Member member) {
		memberService.updateMember(member);
		return "success";
	}
	
	@GetMapping("/mypageContent")
	public String mypageContentPage(HttpSession session, String email) {
		session.removeAttribute("loginuser");
		session.setAttribute("loginuser", memberService.findMemberByEmail(email));
		return "/account/modules/mypage-content";
	}
	
	@PostMapping("/updateImg")
	@ResponseBody
	public String updateImg(@RequestParam("img")MultipartFile file, HttpServletRequest req, String email) {		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/img/profile");
		String fileName = file.getOriginalFilename();
		
		try {
			File f = new File(path, fileName);
			file.transferTo( f ); //파일 저장
		} 
		catch (Exception ex) { ex.printStackTrace(); }
		
		Member member = new Member();
		member.setEmail(email);
		member.setImg(fileName);
		memberService.updateImg(member);
			
		

		return "redirect:/account/mypage";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
