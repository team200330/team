package com.team.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.FeedbackService;
import com.team.vo.Feedback;
import com.team.vo.Member;
import com.team.vo.Receiver;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {
	
	@Autowired
	@Qualifier("feedbackService")
	private FeedbackService feedbackService;

	// 워크스페이스 멤버 리스트
	private List<Member> workspaceMembers = null;
	
	@GetMapping("/list")
	public String feedbackList(Model model) {
		if ( workspaceMembers == null ) workspaceMembers = feedbackService.findWorkspaceMembers(3);
		model.addAttribute("workspaceMembers", workspaceMembers);
		
		

		return "/feedback/list";
	}
	
	@PostMapping("/write")
	public String writeFeedback(Feedback feedback,String[] email, String isPublic) {
		feedback.setPublic(isPublic.equals("true") ? true : false);
		
		System.out.println(feedback.toString());
	
		
		feedbackService.writeFeedback(feedback, email);
		
		return "redirect:/feedback/list";
	}
	
	
	
	@GetMapping("/getWorkspaceMembers")
	@ResponseBody
	public String getWorkspaceMembers(String str, String selected) {
		String result = "";
		String selectedMems[] = selected.split(":");
		
		System.out.println(selected);
		
		for (Member m : workspaceMembers) {
			String className = "_mem_icon_default";
			for (String s : selectedMems) if (s.equals(m.getEmail())) { className = ""; break; }
			
			if (m.getEmail().contains(str) || m.getName().contains(str)) 
				result += 
					"<div class='_mem' data-email='" + m.getEmail() + "' data-name='" + m.getName() + "'>" +
						"<img class='_mem_img img-circle img-bordered-sm' src='' alt='user image'>" +
			        	"<div class='_mem_name'> " + m.getEmail() + "<br/>" + m.getName() + "</div>" +
			        	"<div class='_mem_icon "+ className +"' style='text-align:right' >" +
			        		"<i class='fas fa-check'></i>" +
			        	"</div>" +
			        "</div>";
		}
		return result;
	}
}
