package com.team.controller;

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

import com.team.service.ProjectService;
import com.team.vo.Member;
import com.team.vo.Project;

@Controller
@RequestMapping(path = {"/project"})
public class ProjectController {
	
	@Autowired
	@Qualifier("projectService")
	private ProjectService projectService;
	
	// 워크스페이스 멤버 리스트
	private List<Member> workspaceMembers = null;
	
	// 임시 워크스페이스번호
	// 워크스페이스 번호 세션에 저장되면 바꿀거 : feedbackList, searchFeedback, writeFeedback
	static final int workspaceNo = 6;

	
	@SuppressWarnings("unused")
	@GetMapping(path = { "/prlist" })
//	public String showProjectList(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(required = false) String searchType, 
//												@RequestParam(required = false) String searchKey , HttpServletRequest req,Model model,
//												 HttpSession session) {
	public String showProjectList( Model model, HttpServletRequest request) {		
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
        
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
	public String write(Project project, String proPublic) {
		project.setProPublic(proPublic.equals("true") ? true : false);
		projectService.writeProject(project);
		
		return "success";
		
	}
	
	@GetMapping(path = {"/list"})
	public String list(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
        
        // 임시 워크스페이스 번호 // 워크스페이스 속해있는 멤버 불러오기
 		if ( workspaceMembers == null ) workspaceMembers = projectService.findWorkspaceMembers(workspaceNo);
 		model.addAttribute("workspaceMembers", workspaceMembers);
        
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		params.put("workspaceNo", workspaceNo);
		model.addAllAttributes(params);
		
		List<Project> projectList = projectService.findProject(params);
		model.addAttribute("project", projectList);
		
		return "project/list";
	}
	
	@GetMapping(path = {"/list2"})
	public String list2(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.getAttribute("loginuser");
        
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
	
	
	@PostMapping(path = {"/detailUpdate"})
	@ResponseBody	
	public String detailUpdate(Project project, String proPublic, String projectNo) {
		project.setProPublic(proPublic.equals("true") ? true : false);
		projectService.updateProject(project);
		return "success";
	}
	
	@SuppressWarnings("unused")
	@PostMapping(value="/projectByproNo")
	@ResponseBody
	public String projectNoByProNo (String projectNo, String proNo) {
		String keyArr[] = {projectNo, proNo};
		
		Map< String, String > arrMap = new HashMap<>();
		arrMap.put("projectNo", projectNo);
		arrMap.put("proNo", proNo);

		projectService.updateProjectNo(arrMap);
		
		return "success";
		
	}
	
	@GetMapping(path = {"/detail"})
	@ResponseBody	
	//public String write(int projectNo) {
	public Project write(int projectNo, Model model) {
		
		Project projectDetail = projectService.selectDetail(projectNo);
		model.addAttribute("projectDetail", projectDetail);
		
		System.out.println(projectDetail);

		return projectDetail;
		//return "success";
		//return "project/detail";
		
	}

	/*
	 * 현재 워크스페이스 번호 가져와야함 워크스페이스의 멤버를 가져와야함 워크스페이스릐 멤버만 나오도록 해야함 워크스페이스의 번호에 따라
	 * 프로젝트가 보여야함
	 */

	
}
