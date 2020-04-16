package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.FeedbackService;
import com.team.service.WorkspaceService;
import com.team.vo.Feedback;
import com.team.vo.WorkspaceMember;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {
	
	@Autowired
	@Qualifier("feedbackService")
	private FeedbackService feedbackService;

	
	private List<WorkspaceMember> workspaceMembers = null;
	
	@GetMapping("/list")
	public String feedbackList(Model model) {
		if ( workspaceMembers == null ) workspaceMembers = feedbackService.findWorkspaceMembers(3);
		
		model.addAttribute("workspaceMembers", workspaceMembers);

		return "/feedback/list";
	}
	
	@PostMapping("/write")
	public String writeFeedback(Feedback feedback) {
		
		return "redirect:/feedback/list";
	}
}
