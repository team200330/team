package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.WorkspaceService;
import com.team.vo.Workspace;

@Controller
@RequestMapping(path = {"/workspace"})
public class WorkspaceController {
	
	//@Autowired
	//@Qualifier("WorkspaceService")
	//private WorkspaceService workspaceService;
	
	
	@GetMapping(path = { "/create-workspace" })
	public String showcreateworkspaceform() {

	return "workspace/create-workspace"; 
	}
	
	//@PostMapping(path = { "/create-workspace" })
	//public String docreateworkspace(Workspace workspace) {
	//	   workspaceService.insertWorkspace(workspace);
	//return "workspace/create-workspace"; 
	//}
	
	@GetMapping(path = { "/invite-workspace" })
	public String inviteworkspaceform() {

	return "workspace/invite-workspace"; 
	}
	
	@GetMapping(path = { "/setting-workspace" })
	public String settingworkspaceform() {

	return "workspace/setting-workspace"; 
	}
	
	
}
