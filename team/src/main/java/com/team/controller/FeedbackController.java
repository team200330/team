package com.team.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.common.ConvertJsontoCSV;
import com.team.common.DownloadView;
import com.team.service.FeedbackService;
import com.team.service.ProjectService;
import com.team.service.TimelineService;
import com.team.vo.Comments;
import com.team.vo.Feedback;
import com.team.vo.FeedbackReceiver;
import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.Task;
import com.team.vo.TaskList;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {
	
	@Autowired
	@Qualifier("feedbackService")
	private FeedbackService feedbackService;
	
	@Autowired
	@Qualifier("projectService")
	private ProjectService projectService;
	
	@Autowired
	@Qualifier("timelineService")
	private TimelineService timelineService;

	// 프로젝트 리스트 (워크스페이스의 모든 업무 가져오기 위해)
	private List<Project> projects = null;
	
	// 워크스페이스 멤버 리스트
	private List<Member> workspaceMembers = null;
	
	// 임시 워크스페이스번호
	// 워크스페이스 번호 세션에 저장되면 바꿀거 : feedbackList, searchFeedback, writeFeedback
	static final int workspaceNo = 15;
	
	private List<Feedback> feedbacks = null;
	

	@GetMapping("/list")
	public String feedbackList(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 처음 들어올때 워크스페이스 멤버랑 업무들 가져오기
		if ( workspaceMembers == null ) workspaceMembers = feedbackService.findWorkspaceMembers(workspaceNo);
		model.addAttribute("workspaceMembers", workspaceMembers);
		
		if ( projects == null ) projects = feedbackService.findTasksByWorkspaceNo(workspaceNo);
		model.addAttribute("projects", projects);
		///////////////////////////////////
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		params.put("searchType", "M");
		params.put("workspaceNo", workspaceNo);
		
		feedbacks = feedbackService.searchFeedback(params);
		model.addAttribute(feedbacks);

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
	
		feedbacks = feedbackService.searchFeedback(params);
		model.addAttribute("feedbackList", feedbacks);
		
		return "/feedback/modules/feedback-list";
	}
	
	
	
	
	
	
	@GetMapping("/detail")
	@ResponseBody
	public String feedbackDetail(int feedbackNo, HttpSession session) {
		for (Feedback f : feedbacks) 
			if (f.getFeedbackNo() == feedbackNo) {
				session.setAttribute("feedback", f); break;
			}
		return "success";
	}
	
	@GetMapping("/getDetailModal")
	public String feedbackDetailModal() {
		return "/feedback/modules/feedback-detail";
	}
	
	
	
	
	@GetMapping("/count")
	@ResponseBody
	public String uncheckedFeedbackCount(HttpSession session) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		params.put("workspaceNo", workspaceNo);
		
		session.setAttribute("feedbackCount", feedbackService.uncheckedFeedbackCount(params));
		session.setAttribute("latestFeedbackDate", feedbackService.findLatestWritedate(params));
		return "success";
	}
	
	@PostMapping("/write")
	@ResponseBody
	public String writeFeedback(Feedback feedback, String[] email, String isPublic) {
		feedback.setOpened(isPublic.equals("true") ? true : false);
		feedback.setWorkspaceNo(workspaceNo);
		feedbackService.writeFeedback(feedback, email);
	
		return "success";
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public String deleteFeedback(HttpSession session, int feedbackNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("feedbackNo", feedbackNo);
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		
		feedbackService.deleteFeedback(params);
		
		return "success";
	}
	
	@PostMapping("/check")
	@ResponseBody
	public String checkFeedback(HttpSession session, int feedbackNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("feedbackNo", feedbackNo);
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		
		feedbackService.checkFeedback(params);
		
		// 읽음처리 한다음에 탑바 읽지않은 피드백 개수 업데이트
		params.put("workspaceNo", workspaceNo);
		session.setAttribute("feedbackCount", feedbackService.uncheckedFeedbackCount(params));
		// 최신 피드백날짜 업데이트
		session.setAttribute("latestFeedbackDate", feedbackService.findLatestWritedate(params));
		
		return "success";
	}
	
	
	@PostMapping("/comment/write")
	@ResponseBody
	public String writeComment(@ModelAttribute Comments comment) {
		feedbackService.writeComment(comment);
		return "success";
	}
	
	///////////////////////////////////////////////////////////////////////////////
	
	@GetMapping("/getNotifications")
	public String getNotifications(Model model) {
		return "/modules/topbar-notifications";
	}
	
	@GetMapping("/getWorkspaceMembers")
	@ResponseBody
	public String getWorkspaceMembers(String str, String selected, String email) {
		String result = "";
		String selectedMems[] = selected.split(":");
		
		System.out.println(selected);
		
		for (Member m : workspaceMembers) {
			String className = "_mem_icon_default";
			String img = m.getImg() != null ? m.getImg() : "/team/resources/img/profile-default.jpg";
			System.out.println(img);
			
			for (String s : selectedMems) if (s.equals(m.getEmail())) { className = ""; break; }
			
			if ( (m.getEmail().contains(str) || m.getName().contains(str)) && !m.getEmail().equals(email) ) 
				result += 
					"<div class='_mem' data-email='" + m.getEmail() + "' data-name='" + m.getName() + "'>" +
						"<img class='_mem_img img-circle img-bordered-sm' alt='user image' src='" + img + "'>" +
			        	"<div class='_mem_name'> " + m.getEmail() + "<br/>" + m.getName() + "</div>" +
			        	"<div class='_mem_icon "+ className +"' style='text-align:right' >" +
			        		"<i class='fas fa-check'></i>" +
			        	"</div>" +
			        "</div>";
		}
		return result;
	}
	
	@RequestMapping(value = "/getTasks", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getTasks(String str) throws UnsupportedEncodingException {
		//URLDecoder.decode(str, "UTF-8");
		String result = "";
		
		for (Project p : projects) {
			for (TaskList l : p.getTaskLists()) {
				for (Task t : l.getTasks()) {
					if (t.getContent().contains(str) || t.getWriter().contains(str) || p.getProjectName().contains(str)) {
						result += 
							"<div class='task' data-value="+ t.getTaskNo() +">" +
								"<div class='t_t'>" + t.getContent() +"</div>" +
								"<div class='t'>" +
		            				"<div>"+ p.getProjectName() + "&nbsp;</div>" + 
		            				"<div> > "+ t.getWriter() +"</div>" +
		            			"</div>" +
		            		"</div>";
					}
				}
			}
		}
		
		return result;
	}

}
