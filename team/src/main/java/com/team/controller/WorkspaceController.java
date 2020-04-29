package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		//workspaceService.insertWorkspace(workspace);
		
		//int workspaceNo = (int)workspace.getWorkspaceNo();
		//model.addAttribute("workspaceNo", workspaceNo);
		//int code = (int)(Math.random()*1000+1);
		//model.addAttribute("code", code);
		//email = member.getEmail();
		//model.addAttribute("email", email);
		
	return "workspace/create-workspace"; 
	}
	
	@PostMapping(path = { "/create-workspace" })
	public String docreateworkspace(Workspace workspace, WorkspaceMember workspaceMember) {
		
		int code = (int)(Math.random()*1000+1);
		workspace.setCode(String.valueOf(code));
		workspaceService.insertWorkspace(workspace);		
		
		int workspaceNo = (int)workspace.getWorkspaceNo();
		workspaceMember.setWorkspaceNo(workspaceNo);
		
		//워크스페이스 생성시 워크스페이스멤버에도 추가되는걸로 체크 updateWorkspace는 작업중
		System.out.println(workspace);
		workspaceService.insertWorkspaceMember(workspaceMember);
		
		return "redirect:/";
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
	public String settingworkspaceform(int workspaceNo,Model model) {
		Workspace workspace = workspaceService.selectWorkspaceByWorkspaceNo(workspaceNo);
		model.addAttribute("workspace",workspace);
		
		return "workspace/setting-workspace";
	}
	
	@PostMapping(path = { "/setting-workspace" })
	public String Dosettingworkspace(Workspace workspace) {
		workspaceService.updateWorkspaceName(workspace);
	return "workspace/setting-workspace"; 
	}
	
	@PostMapping(path = { "/delete-workspace" })
	public String Dodeleteworkspace(Workspace workspace) {
		workspaceService.deleteWorkspace(workspace);
	return "workspace/create-workspace"; //임시
	}
	
	@GetMapping(path = { "/workspace-member" })
	public String workspacemember(WorkspaceMember workspaceMember,Model model) {
		List <Member> members = workspaceService.selectMembersByWorkspaceNo(workspaceMember);
		model.addAttribute("members",members);
		Member member = workspaceService.selectMemberTypeNo1ByWorkspaceNo(workspaceMember);
		model.addAttribute("member",member);
		//java.lang.ClassCastException: com.team.vo.WorkspaceMember cannot be cast to com.team.vo.Member
		//작업중에있음
		System.out.println(workspaceMember);
	return "workspace/workspace-member"; 
	}
	
	@PostMapping(path = { "/WorkspaceMemberNameAndDepartmentSearch" })
	public String Searchworkspacemember(Member member,Model model) {
		List <Member> members = workspaceService.WorkspaceMemberNameAndDepartmentSearch(member);
		model.addAttribute("members",members);
	return "redirect:workspace/workspace-member"; 
	}
	
	
	@GetMapping(path = { "/changeworkspacemembertype" })
	public String changeworkspacemembertype(WorkspaceMember workspaceMember,Model model) {
		
		//Member member = workspaceService.sd(workspaceMember);
		//model.addAttribute("member",member);
		
	return "workspace/workspace-member"; 
	}
}
