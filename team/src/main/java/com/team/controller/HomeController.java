package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.service.WorkspaceService;
import com.team.vo.Member;
import com.team.vo.Workspace;
import com.team.vo.WorkspaceMember;

@Controller
public class HomeController {

	@Autowired
	private WorkspaceService workspaceService;

	@GetMapping({"/", "/home"})
	public String home(Model model, HttpSession session) {
				
		if (session.getAttribute("loginuser") != null) {
			Member member = (Member)session.getAttribute("loginuser");
			String email = member.getEmail();
			
			//loginuser안에 멤버테이블에 있는 email을 꺼내온다.
			
			WorkspaceMember workspaceMember = workspaceService.selectWorkspaceByEmail(email);
			
			if (workspaceMember != null) {
				
				model.addAttribute("workspaceMember",workspaceMember);
				
				int workspaceNo = (int)workspaceMember.getWorkspaceNo();
				//workspaceNo는 실제 테이블에 workspace_no이기 때문에
				//resultmap에서 작업을 하거나 결과값으로 workspace_no workspaceNo를 작성한다.
				
				Workspace workspace = workspaceService.selectWorkspaceByWorkspaceNo(workspaceNo);
				model.addAttribute("workspace",workspace);
				
				//List <Workspace> workspaces = workspaceService.selectWorkspacesByWorkspaceNo(workspaceNo);
				//model.addAttribute("workspaces",workspaces);
				
				List<Workspace> workspaces = workspaceService.selectWorkspaceNameByEmail(email);
				model.addAttribute("workspaces",workspaces);
			} 
		}
		
		return "home";
	}
	
	
	@GetMapping("/home2")
	public String home2() {
		return "home2";
	}
	
}
