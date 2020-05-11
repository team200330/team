package com.team.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.WorkspaceService;
import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.Workspace;
import com.team.vo.WorkspaceMember;

@Controller
@RequestMapping(path = {"/workspace"})
public class WorkspaceController {
	
	@Autowired
	@Qualifier("workspaceService")
	private WorkspaceService workspaceService;
		
	@GetMapping(path = { "/create-workspace" })
	public String showcreateworkspaceform() {	
		
	return "workspace/create-workspace"; 
	}
	
	@PostMapping(path = { "/create-workspace" })
	public String docreateworkspace(Workspace workspace, WorkspaceMember workspaceMember, HttpSession session) {
		
		int code = (int)(Math.random()*(9999999 - 1000000) + 1000000);		
		workspace.setCode(String.valueOf(code));
		//코드값을 workspace안에 set 넣는다.
		workspaceService.insertWorkspace(workspace);		
		
		int workspaceNo = (int)workspace.getWorkspaceNo();
		workspaceMember.setWorkspaceNo(workspaceNo);
		//만들어진 workspace에서 workspaceNo를 꺼내서 workspacemember안에 set 넣는다.
		
		workspaceService.insertWorkspaceMember(workspaceMember);
		//코드와 워크스페이스 네임을 중복되지않게 작업 해야한다.
		
		List<Workspace> workspaces = workspaceService.selectWorkspacesByEmail(workspaceMember.getEmail());
		session.setAttribute("workspaces",workspaces);	
		session.setAttribute("workspaceNo",workspaceNo);	
		
		System.out.println(workspaceNo);
		
		return "redirect:/project/prlist";
	}
	
	@GetMapping(path = { "/invite-workspace" })
	public String inviteworkspaceform(int workspaceNo,Model model) {		
		List<Project> Projects = workspaceService.selectProjectByWorkspaceNo(workspaceNo);
		model.addAttribute("Projects",Projects);
		Workspace workspace = workspaceService.selectWorkspaceByWorkspaceNo(workspaceNo);
		model.addAttribute("workspace",workspace);	
	return "workspace/invite-workspace"; 
	}
	
	@GetMapping(path = { "/setting-workspace" })
	public String settingworkspaceform(int workspaceNo,Model model,HttpSession session) {
		Workspace workspace = workspaceService.selectWorkspaceByWorkspaceNo(workspaceNo);
		model.addAttribute("workspace",workspace);
		
		session.removeAttribute("workspaceNo");
		session.setAttribute("workspaceNo",workspace.getWorkspaceNo());
		
		return "workspace/setting-workspace";
	}
	
	@PostMapping(path = { "/setting-workspace" })
	public String Dosettingworkspace(Workspace workspace, HttpSession session) {
		workspaceService.updateWorkspaceName(workspace);
		List<Workspace> workspaces = (List<Workspace>)session.getAttribute("workspaces");
		if (workspaces != null && workspaces.size() > 0) {
			for (Workspace ws: workspaces) {
				if (ws.getWorkspaceNo() == workspace.getWorkspaceNo()) {
					ws.setWorkspaceName(workspace.getWorkspaceName());
				}
			}
		}
		
		return "workspace/setting-workspace"; 
	}
	
	@PostMapping(path = { "/delete-workspace" })
	public String Dodeleteworkspace(Workspace workspace, HttpSession session) {
		workspaceService.deleteWorkspace(workspace);
		List<Workspace> workspaces = (List<Workspace>)session.getAttribute("workspaces");
		if (workspaces != null && workspaces.size() > 0) {
			for (int idx = workspaces.size() - 1; idx >= 0; idx--) {
				Workspace ws = workspaces.get(idx);
				if (ws.getWorkspaceNo() == workspace.getWorkspaceNo()) {
					workspaces.remove(ws);
				}
			}
		}
	return "workspace/create-workspace"; //임시
	}
	
	@GetMapping(path = { "/workspace-member" })
	public String workspacemember(WorkspaceMember workspaceMember,Model model,int workspaceNo) {
		
		model.addAttribute("workspaceNo",workspaceMember.getWorkspaceNo());
		
		System.out.println(workspaceMember.getWorkspaceNo());
		List <Member> members = workspaceService.selectMembersByWorkspaceNo(workspaceMember);
		model.addAttribute("members",members);
		
		Member member = workspaceService.selectMemberTypeNo1ByWorkspaceNo(workspaceMember);
		model.addAttribute("member",member);
		
		int ALLCountWorkspaceMember = workspaceService.selectCountMemberByWorkspaceMember(workspaceMember.getWorkspaceNo());
		model.addAttribute("ALLCountWorkspaceMember",ALLCountWorkspaceMember);
		
		//java.lang.ClassCastException: com.team.vo.WorkspaceMember cannot be cast to com.team.vo.Member
		//작업중에있음
		
	return "workspace/workspace-member"; 
	}
	
	@PostMapping(path = { "/WorkspaceMemberNameAndDepartmentSearch" })
	public String Searchworkspacemember(Member member,Model model) {
		List <Member> members = workspaceService.WorkspaceMemberNameAndDepartmentSearch(member);
		model.addAttribute("members",members);
	return "redirect:workspace/workspace-member"; 
	}
	
	
	@GetMapping(path = { "/changeworkspacemembertype" })
	public String changeworkspacemembertype(WorkspaceMember workspaceMember, HttpSession session, Model model) {
		
		//Member member = workspaceService.sd(workspaceMember);
		//model.addAttribute("member",member);
		
		List<Workspace> workspaces = (List<Workspace>)session.getAttribute("workspaces");
		if (workspaces != null && workspaces.size() > 0) {
			for (Workspace ws: workspaces) {
				if (ws.getWorkspaceNo() == workspaceMember.getWorkspaceNo()) {
					List<WorkspaceMember> members = ws.getWorkspaceMembers();
					for (WorkspaceMember member: members) {
						if (member.getEmail().equals(workspaceMember.getEmail())) {
							member.setTypeNo(workspaceMember.getTypeNo());
						}
					}
				}
			}
		}
		
		return "workspace/workspace-member"; 
	}
	
	@PostMapping(path = { "/asc1"})
	@ResponseBody
	public String asc1(int workspaceNo,Model model) {
		System.out.println(workspaceNo);
		List <Member> members = workspaceService.selectMemberAsc1ByWorkspaceNo(workspaceNo);
		model.addAttribute("members",members);
		System.out.println(members);
		if (members == null) {
			return "not success";
		} else {
			return "success";
		}
	}
	
	@PostMapping(path = { "/asc2"})
	@ResponseBody
	public String asc2(int workspaceNo,Model model) {
		System.out.println(workspaceNo);
		List <Member> members = workspaceService.selectMemberAsc2ByWorkspaceNo(workspaceNo);
		model.addAttribute("members",members);
		System.out.println(members);
		if (members == null) {
			return "not success";
		} else {
			return "success";
		}
	}
	
	
	
	
	
	
	///////////////////////////////////////////////
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@GetMapping("/join-workspace")
	public String joinWorkspace() {
		return "/workspace/join-workspace";
	}
	
	@GetMapping("/invite")
	@ResponseBody
	public String sendInviteCode(String email, int workspaceNo) {
		Workspace w = workspaceService.selectWorkspaceByWorkspaceNo(workspaceNo);
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				String content = 
					"<div style='text-align:center;margin-bottom:50px'>" +
						"<h1 style='font-weight: bold;margin-top: 80px;margin-bottom: 50px;'>TeamPlan 의 워크스페이스에 당신을 초대합니다.</h1>" +
						"<div style='color:gray'>" +
							w.getWorkspaceName() + " 워크스페이스에 초대되었습니다. <br>팀플랜에 가입하여 아래의 초대코드를 입력하세요" +
						"</div>" +
						"<div style='font-size:30pt'>"+ w.getCode()+"</div>" +
						"<a href='https://localhost:8081/team/home2'>팀플랜 가입하기</a>" + 
					"</div>";
				
				
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("TeamPlan");
				helper.setTo(email);
				helper.setSubject("TeamPlan 의 워크스페이스에 당신을 초대합니다."); // 제목
				helper.setText(content, true); // 내용
			}
		};
		mailSender.send(preparator);

		return "success";
	}
	
	@GetMapping("/checkJoin")
	@ResponseBody
	public int checkJoin(int code, HttpSession s) {
		String loginuser = ((Member) s.getAttribute("loginuser")).getEmail();
		Workspace workspace = workspaceService.selectWorkspaceByCode(code);
		
		// return -1 : 코드 불일치, -2 : 이미 멤버로 참여되어있음
		if (workspace == null) return -1;
		for (Workspace w : workspaceService.selectWorkspacesByEmail(loginuser)) {
			if (w.getWorkspaceNo() == workspace.getWorkspaceNo()) return -2;
		}
		
		return workspace.getWorkspaceNo();
	}
	
	@PostMapping("/join")
	public String joinWorkspace(int workspaceNo, String email, HttpSession session) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", email);
		params.put("workspaceNo", workspaceNo);
		
		workspaceService.insertWorkspaceMember2(params);
		
		// 세션에 새로 데이터 저장
		session.setAttribute("workspaces", workspaceService.selectWorkspacesByEmail(email));
		session.setAttribute("workspaceNo", workspaceService.selectWorkspaceByWorkspaceNo(workspaceNo).getWorkspaceNo());
		
		return "redirect:/project/prlist";
	}
}
