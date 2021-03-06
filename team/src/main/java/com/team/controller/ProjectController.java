package com.team.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.common.ConvertJsontoCSV;
import com.team.common.DownloadView;
import com.team.service.FeedbackService;
import com.team.service.ProjectService;
import com.team.service.TaskService;
import com.team.service.TimelineService;
import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.ProjectMember;
import com.team.vo.Task;
import com.team.vo.TaskList;

@Controller
@RequestMapping(path = {"/project"})
public class ProjectController {
	
	@Autowired
	@Qualifier("projectService")
	private ProjectService projectService;
	
	@Autowired
	@Qualifier("feedbackService")
	private FeedbackService feedbackService;
	
	@Autowired
	@Qualifier("taskService")
	private TaskService taskService;
	
	
	// 워크스페이스 멤버 리스트
	private List<Member> workspaceMembers = null;
	
	// 임시 워크스페이스번호
	// 워크스페이스 번호 세션에 저장되면 바꿀거 : feedbackList, searchFeedback, writeFeedback
	//static final int workspaceNo = 6;
	private int workspaceNo;

	//로그인 페이지 이동
	@GetMapping(path = {"/task.action"})
	public String toTask( HttpSession session, int projectNo) {
		System.out.println("프로젝트번호:"+projectNo);
		session.setAttribute("projectByNo", projectService.searchProjectByNo(projectNo));
		return "redirect:/task/main";
	}
	
	
	@SuppressWarnings("unused")
	@GetMapping(path = { "/prlist" })
//	public String showProjectList(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(required = false) String searchType, 
//												@RequestParam(required = false) String searchKey , HttpServletRequest req,Model model,
//												 HttpSession session) {
	public String showProjectList( Model model, HttpServletRequest request) {		
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
        workspaceNo = (int) session.getAttribute("workspaceNo");
        System.out.println(workspaceNo);
        // 임시 워크스페이스 번호 // 워크스페이스 속해있는 멤버 불러오기
 		if ( workspaceMembers == null ) workspaceMembers = projectService.findWorkspaceMembers(workspaceNo);
 		model.addAttribute("workspaceMembers", workspaceMembers);
        
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		params.put("workspaceNo", workspaceNo);
		model.addAllAttributes(params);
		System.out.println(params);
		
		List<Project> projectList = projectService.findProject(params);
		model.addAttribute("project", projectList);
		
		List<Project> projectList2 = projectService.findProject2(params);
		model.addAttribute("project2", projectList2);
		
		List<Project> projectCount = new ArrayList<>();
		for(Project p : projectList) {
			p.getProjectNo();
			int taskCount = taskService.taskCount(p.getProjectNo());
			int taskCompletedCount = taskService.taskCompletedCount(p.getProjectNo());
			
			p.setProbability((double)taskCompletedCount / taskCount * 100);
			projectCount.add(p);
			System.out.println(p.getProbability());
			System.out.println(taskCount);
			System.out.println(taskCompletedCount);
			
		}
		model.addAttribute("projectCount", projectCount);
		
		
//		int pageSize = 2;	// 전체게시글수
//		int pagerSize = 8;  // 한페이지에 나올 갯수
//		HashMap<String, Object> params = new HashMap<>();
//		int beginningPageNo = (pageNo - 1) * pageSize + 1;
//		params.put("beginningPageNo", beginningPageNo);
//		params.put("end", beginningPageNo + pageSize);
//		params.put("searchType", searchType);
//		params.put("searchKey", searchKey);
//		
//		//projectList = projectService.findPageing(params);
//		int projectListCount = projectService.projectListCount(params);
		
		//ThePager pager = new ThePager(projectListCount, pageNo, pageSize, pagerSize, "prlist.action", req.getQueryString() );
//		ThePager pager = new ThePager(projectListCount, pageNo, pageSize, pagerSize, "prlist.action", req.getQueryString() );
//		model.addAttribute("pager", pager);
		
		
		return "project/prlist";
		
	}
	
	@PostMapping(path = {"/write"})
	@ResponseBody	
	public String write(Project project, String proPublic, String[] email, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
 
		String managerEmail = ((Member) session.getAttribute("loginuser")).getEmail();
		project.setManagerEmail(managerEmail);
		project.setProPublic(proPublic.equals("true") ? true : false); 
		project.setWorkspaceNo(workspaceNo); 

		projectService.writeProject(project, email);


		return "success";
		
	}
	
	@GetMapping(path = {"/list"})
	public String list(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
        workspaceNo = (int) session.getAttribute("workspaceNo");
        System.out.println(workspaceNo);
        
        // 임시 워크스페이스 번호 // 워크스페이스 속해있는 멤버 불러오기
 		if ( workspaceMembers == null ) workspaceMembers = projectService.findWorkspaceMembers(workspaceNo);
 		model.addAttribute("workspaceMembers", workspaceMembers);
        
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		params.put("workspaceNo", workspaceNo);
		model.addAllAttributes(params);
		
		List<Project> projectList = projectService.findProject(params);
		model.addAttribute("project", projectList);
		
		List<Project> projectCount = new ArrayList<>();
		for(Project p : projectList) {
			p.getProjectNo();
			int taskCount = taskService.taskCount(p.getProjectNo());
			int taskCompletedCount = taskService.taskCompletedCount(p.getProjectNo());
			
			p.setProbability((double)taskCompletedCount / taskCount * 100);
			projectCount.add(p);
			System.out.println(p.getProbability());
			System.out.println(taskCount);
			System.out.println(taskCompletedCount);
			
		}
		model.addAttribute("projectCount", projectCount);
		
		return "project/list";
	}
	
	@GetMapping(path = {"/list2"})
	public String list2(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
        workspaceNo = (int) session.getAttribute("workspaceNo");
        System.out.println(workspaceNo);
        
        // 임시 워크스페이스 번호 // 워크스페이스 속해있는 멤버 불러오기
 		if ( workspaceMembers == null ) workspaceMembers = projectService.findWorkspaceMembers(workspaceNo);
 		model.addAttribute("workspaceMembers", workspaceMembers);
        
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		params.put("workspaceNo", workspaceNo);
		model.addAllAttributes(params);
		
		List<Project> projectList2 = projectService.findProject2(params);
		model.addAttribute("project2", projectList2);
		
		return "project/list2";
	}
	
	@PostMapping(path = {"/addProjectMember"})
	@ResponseBody	
	public String addProjectMember(ProjectMember projectMember, int projectNo, String email) {
		System.out.println(projectNo + email);
		projectMember.setProjectNo(projectNo);
		projectMember.setEmail(email);
		projectService.updateProjectMember(projectMember);
		
		return "success";
		
	}
	
	@PostMapping(path = {"/detailUpdate"})
	@ResponseBody	
	public String detailUpdate(Project project, String proPublic, String projectNo) {
		project.setProPublic(proPublic.equals("true") ? true : false);
		projectService.updateProject(project);
		return "success";
	}
	
	@PostMapping(path = {"/projectByproNo"})
	@ResponseBody
	public String projectNoByProNo (String projectNo, String proNo) {
		String keyArr[] = {projectNo, proNo};
		
		Map< String, String > arrMap = new HashMap<>();
		arrMap.put("projectNo", projectNo);
		arrMap.put("proNo", proNo);

		projectService.updateProjectNo(arrMap);
		
		return "success";
		
	}
	
	@PostMapping(path = {"/projectMemberDeleted"})
	@ResponseBody
	public String projectMemberDeleted (ProjectMember projectMember, int projectNo, String email) {
		
		System.out.println(projectNo + email);
		projectMember.setProjectNo(projectNo);
		projectMember.setEmail(email);
		projectService.projectMemberDeleted(projectMember);
		
		return "success";
		
	}
	
	@PostMapping(path = {"/deleted"})
	@ResponseBody
	public String projectDeleted (String projectNo, String deleted) {
		
		Map< String, Object > arrMap = new HashMap<>();
		arrMap.put("projectNo", projectNo);
		arrMap.put("deleted", deleted);

		projectService.updateProjectDeleted(arrMap);
		System.out.println(deleted);
		
		return "success";
		
	}
	
	
	  @GetMapping(path = {"/detail"})
	  @ResponseBody //public String write(int projectNo) { 
	  public Project write(int projectNo, Model model) {
	  
	  Project projectDetail = projectService.selectDetail(projectNo);
	  model.addAttribute("projectDetail", projectDetail);
	  //System.out.println("detail projectDetail 값" + projectDetail);
	  System.out.println(projectDetail.getMember());
	  System.out.println(projectDetail); 
	  return projectDetail;
	  
	  }


	///////////////////
	
	@GetMapping("/getProjectMember")
	@ResponseBody
	public String getWorkspaceMembers(String str, String selected, String email, HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
        workspaceNo = (int) session.getAttribute("workspaceNo");
        System.out.println(workspaceNo);
        
		String result = "";
		String selectedMems[] = selected.split(":");
		
		System.out.println(selected);
		
		for (Member m : feedbackService.findWorkspaceMembers(workspaceNo)) {
			String className = "_mem_icon_default";
			for (String s : selectedMems) if (s.equals(m.getEmail())) { className = ""; break; }
			
			if ( (m.getEmail().contains(str) || m.getName().contains(str)) && !m.getEmail().equals(email) ) 
				result += 
					"<div class='_mem' data-email='" + m.getEmail() + "' data-name='" + m.getName() + "'>" +
						//"<img class='_mem_img img-circle img-bordered-sm' src='' alt='user image'>" +
			        	"<div class='_mem_name'> " + m.getEmail() + "<br/>" + m.getName() + "</div>" +
			        	"<div class='_mem_icon "+ className +"' style='text-align:right' >" +
			        		"<i class='fas fa-check'></i>" +
			        	"</div>" +
			        "</div>";
		}
		return result;
	}
	
	@GetMapping("/getProjectMember2")
	@ResponseBody
	public String getWorkspaceMembers2(String str, String selected, String email, HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
        workspaceNo = (int) session.getAttribute("workspaceNo");
        System.out.println(workspaceNo);
        
		String result = "";
		String selectedMems[] = selected.split(":");
		
		System.out.println(selected);
		
		for (Member m : feedbackService.findWorkspaceMembers(workspaceNo)) {
			String className = "_mem_icon_default2";
			for (String s : selectedMems) if (s.equals(m.getEmail())) { className = ""; break; }
			
			if ( (m.getEmail().contains(str) || m.getName().contains(str)) && !m.getEmail().equals(email) ) 
				result += 
					"<div class='_mem2' data-email='" + m.getEmail() + "' data-name='" + m.getName() + "'>" +
						//"<img class='_mem_img img-circle img-bordered-sm' src='' alt='user image'>" +
			        	"<div class='_mem_name2'> " + m.getEmail() + "<br/>" + m.getName() + "</div>" +
			        	"<div class='_mem_icon2 "+ className +"' style='text-align:right' >" +
			        		"<i class='fas fa-check'></i>" +
			        	"</div>" +
			        "</div>";
		}
		return result;
	}
	

	
	// 프로젝트 CSV 로 내보내기
	@Autowired
	@Qualifier("timelineService")
	private TimelineService timelineService;
	
	private List<TaskList> downloadList;
	
	@GetMapping("/download")
	public View downloadCSV() {
		ConvertJsontoCSV c = new ConvertJsontoCSV();
		List<Task> lists = new ArrayList<>();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		
		for (TaskList l : downloadList) {
			for (Task t : l.getTasks()) { 
				if (t.getStartDate() != null) t.setS_startDate(f.format(t.getStartDate()));
				if (t.getEndDate() != null) t.setS_endDate(f.format(t.getEndDate()));
				if (t.getCompletedDate() != null) t.setS_completedDate(f.format(t.getCompletedDate()));
				lists.add(t);
			}
		}
		
		c.convert(lists);
		
		DownloadView dv = new DownloadView();
		return dv;
	}

	@GetMapping("/download-check")
	@ResponseBody
	public String downloadCheck(int projectNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("searchType", "A");
		params.put("projectNo", projectNo);
		
		List<TaskList> lists = timelineService.searchTasks(params);
		if (lists == null || lists.size() == 0) return "error";
		
		downloadList = lists;
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////
	// 분석페이지에서 프로젝트 마감일, 종료일 업데이트
	@PostMapping("/updateProjectDate")
	@ResponseBody
	public String updateProjectDate(Date date, String dateType, int projectNo) {
		// java.util.date -> java.sql.date
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("dateType", dateType);
		params.put("projectNo", projectNo);
		params.put("date", sqlDate);
		
		projectService.updateProjectDate(params);
		
		return "success";
	}
	
}
