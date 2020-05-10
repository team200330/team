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
import com.team.vo.Project;
import com.team.vo.Workspace;

@Controller
@RequestMapping(path = { "/account/" })
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

	// 회원가입 페이지 이동
	@GetMapping("/register")
	public String toRegister() {

		return "account/register";
	}

	// 회원가입
	@PostMapping("/register")
	public String register(@RequestParam("img2") MultipartFile file, HttpServletRequest req, Member member,
			RedirectAttributes attr) {

		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/img/profile");
		String fileName = file.getOriginalFilename();

		try {
			File f = new File(path, fileName);
			file.transferTo(f); // 파일 저장
			member.setImg(fileName);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		memberService.registerMember(member);
		System.out.println(member.toString());
		attr.addFlashAttribute("newEmail", member.getEmail());

		return "account/login";
	}

	// 로그인 페이지 이동
	@GetMapping("/login")
	public String toLogin() {
		return "account/login";
	}

	// 로그인
	@PostMapping("/login")
	public String login(Member member, HttpSession session, Model model) {

		Member member2 = memberService.findMemberByEmailAndPassword(member);
		if (member2 == null) {
			return "redirect:/account/login";
		} else {
			session.setAttribute("loginuser", member2);
			model.addAttribute("member", member2);

			// 로그인시 해당 유저의 이메일로 워크스페이스 목록 가져오기(탑바)
			List<Workspace> workspaces = workspaceService.selectWorkspacesByEmail(member2.getEmail());
			session.setAttribute("workspaces", workspaces);
			// Workspace workspace;
			// Workspace workspace =
			// workspaceService.selectAscWorkspaceByEmail(member2.getEmail());

			// 워크스페이스가 없을때 만드는 화면으로
			if (workspaces == null || workspaces.isEmpty()) {

				return "redirect:/workspace/create-workspace";

			} else {
				Workspace workspace = workspaces.get(0);
				System.out.println(workspace);

				session.setAttribute("workspaceNo", workspace.getWorkspaceNo());

				// 로그인시 읽지않은 피드백개수 가져오기 (탑바)
				HashMap<String, Object> params = new HashMap<>();
				params.put("email", member2.getEmail());
				params.put("workspaceNo", session.getAttribute("workspaceNo"));
				session.setAttribute("feedbackCount", feedbackService.uncheckedFeedbackCount(params));
				session.setAttribute("latestFeedbackDate", feedbackService.findLatestWritedate(params));

			}

			return "redirect:/project/prlist";

		}
	}

	// 이메일 중복체크
	@GetMapping("/checkEmail")
	@ResponseBody
	public String checkEmail(String email) {
		Member member = memberService.findMemberByEmail(email);
		if (member == null)
			return "success";
		else
			return "error";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate(); // 세션 초기화
		return "redirect:/";
	}

	////////////////////////////////////////////////////////
	@GetMapping("/mypage")
	public String mypage(HttpSession session) {
		session.setAttribute("mypage_workspaces", workspaceService
				.selectWorkspaceByManagerEmail(((Member) session.getAttribute("loginuser")).getEmail()));

		return "/account/mypage";
	}

	@GetMapping("/checkPw")
	@ResponseBody
	public String checkPw(Member member) {
		if (memberService.findMemberByEmailAndPassword(member) != null)
			return "success";
		else
			return "error";
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
		session.setAttribute("loginuser", memberService.findMemberByEmail(email));
		return "/account/modules/mypage-content";
	}

	@PostMapping("/updateImg")
	@ResponseBody
	public String updateImg(@RequestParam("img") MultipartFile file, HttpServletRequest req, String email) {
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/img/profile");
		String fileName = file.getOriginalFilename();

		try {
			File f = new File(path, fileName);
			file.transferTo(f); // 파일 저장
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		Member member = new Member();
		member.setEmail(email);
		member.setImg(fileName);
		memberService.updateImg(member);

		return "redirect:/account/mypage";
	}

	@RequestMapping(value = "/getWorkspaceMembers", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getWorkspaceMembers(int workspaceNo, String email, String str) {

		System.out.println(str);

		String result = "";
		for (Member m : feedbackService.findWorkspaceMembers(workspaceNo)) {

			String img = m.getImg() != null ? "/team/resources/img/profile/" + m.getImg()
					: "/team/resources/img/profile-default.jpg";

			if (!email.equals(m.getEmail()))
				result += "<div class='_mem' data-email='" + m.getEmail() + "' data-img='" + img
						+ "' data-workspaceNo='" + workspaceNo + "'>"
						+ "<img class='_mem_img img-circle img-bordered-sm' alt='user image' src='" + img + "'>"
						+ "<div class='_mem_name'> " + m.getEmail() + "<br/>" + m.getName() + "</div>" + "</div>";
		}
		if (result.length() == 0)
			result = "<div class='_mem_none'>소유권을 이전할 수 있는 멤버가 없습니다.</div>";

		return result;
	}

	@PostMapping("/updateWorkspaceMananger")
	@ResponseBody
	public String updateWorkspaceManager(String email, String managerEmail, int workspaceNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", email);
		params.put("typeNo", 2);
		params.put("workspaceNo", workspaceNo);

		workspaceService.updateWorkspaceManager(params); // 기존매니저 일반유저로 바꾸고

		params.put("email", managerEmail);
		params.put("typeNo", 1);

		workspaceService.updateWorkspaceManager(params); // 매니저 다른유저로 바꾸기

		return "success";
	}

	@PostMapping("/deleteMember")
	public String deleteMember(String email, HttpSession session) {
		memberService.deleteMember(email);
		session.invalidate();
		return "redirect:/home2";
	}

}
