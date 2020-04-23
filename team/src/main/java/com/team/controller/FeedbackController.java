package com.team.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.FeedbackService;
import com.team.vo.Comments;
import com.team.vo.Feedback;
import com.team.vo.Member;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {
	
	@Autowired
	@Qualifier("feedbackService")
	private FeedbackService feedbackService;

	// 워크스페이스 멤버 리스트
	private List<Member> workspaceMembers = null;
	
	// 임시 워크스페이스번호
	// 워크스페이스 번호 세션에 저장되면 바꿀거 : feedbackList, searchFeedback, writeFeedback
	static final int workspaceNo = 15;
	

	@GetMapping("/list")
	public String feedbackList(Model model, HttpSession session) {
		// 임시 워크스페이스 번호
		if ( workspaceMembers == null ) workspaceMembers = feedbackService.findWorkspaceMembers(workspaceNo);
		model.addAttribute("workspaceMembers", workspaceMembers);
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		if (loginuser == null) return "redirect:/account/login.action";
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", loginuser.getEmail());
		params.put("searchType", "M");
		params.put("workspaceNo", workspaceNo);
		
		model.addAttribute(feedbackService.searchFeedback(params));
		
		return "/feedback/list";
	}
	
	@GetMapping("/list2")
	public String feedbacklist2() {
		return "/feedback/list";
	}
	
	@GetMapping("/search")
	public String searchFeedback(@RequestParam(defaultValue = "M")String searchType, String email, String key, Model model) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", email);
		params.put("searchType", searchType);
		params.put("workspaceNo", workspaceNo);
		params.put("key", key);
		
		System.out.println(searchType);
		System.out.println(email);

		model.addAttribute("feedbackList", feedbackService.searchFeedback(params));
		
		return "/feedback/modules/feedback-list";
	}
	
	@PostMapping("/write")
	@ResponseBody
	public String writeFeedback(Feedback feedback, String[] email, String isPublic) {
		feedback.setPublic(isPublic.equals("true") ? true : false);
		feedback.setWorkspaceNo(workspaceNo);
		feedbackService.writeFeedback(feedback, email);
	
		return "success";
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public String deleteFeedback(int feedbackNo) {
		feedbackService.deleteFeedback(feedbackNo);
		
		return "success";
	}
	
	
	@PostMapping("/comment/write")
	@ResponseBody
	public String writeComment(@ModelAttribute Comments comment) {
		feedbackService.writeComment(comment);
		return "success";
	}
	
	///////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/getWorkspaceMembers")
	@ResponseBody
	public String getWorkspaceMembers(String str, String selected, String email) {
		String result = "";
		String selectedMems[] = selected.split(":");
		
		System.out.println(selected);
		
		for (Member m : workspaceMembers) {
			String className = "_mem_icon_default";
			for (String s : selectedMems) if (s.equals(m.getEmail())) { className = ""; break; }
			
			if ( m.getEmail().contains(str) || m.getName().contains(str) ) 
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
