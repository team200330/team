package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.WorkspaceService;
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
	public String showcreateworkspaceform(Model model) {		
		int code = (int)(Math.random()*1000+1);
		model.addAttribute("code", code);
		
	return "workspace/create-workspace"; 
	}
	
	@PostMapping(path = { "/create-workspace" })
	public String docreateworkspace(Workspace workspace) {		
		   workspaceService.insertWorkspace(workspace);		   
	return "workspace/setting-workspace"; //임시
	}
	
	@GetMapping(path = { "/invite-workspace" })
	public String inviteworkspaceform(int workspaceNo,Model model) {		
	List<Project> Projects = workspaceService.selectProjectByWorkspaceNo(workspaceNo);
	model.addAttribute("Projects",Projects);
	return "workspace/invite-workspace"; 
	}
	
	@GetMapping(path = { "/setting-workspace" })
	public String settingworkspaceform() {
	return "workspace/setting-workspace"; 
	}
	
	@GetMapping(path = { "/workspace-member" })
	public String workspacemember(int workspaceNo,Model model) {
	List <WorkspaceMember> workspaceMembers	= workspaceService.selectWorkspaceMembersByWorkspaceNo(workspaceNo);
	model.addAttribute("workspaceMembers",workspaceMembers);
	
	
	
	return "workspace/workspace-member"; 
	}

}
