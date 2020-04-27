package com.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.ProjectService;
import com.team.ui.ThePager;
import com.team.vo.Project;

@Controller
@RequestMapping(path = {"/project"})
public class ProjectController {
	
	@Autowired
	@Qualifier("projectService")
	private ProjectService projectService;

	@GetMapping(path = { "/prlist2" })
	public String showProjectList(Model model) {
		
		List<Project> projectList = projectService.findProject();
		model.addAttribute("project", projectList);
		List<Project> projectList2 = projectService.findProject2();
		model.addAttribute("project2", projectList2);
		
		return "project/prlist";
	}
	
	@SuppressWarnings("unused")
	@GetMapping(path = { "/prlist" })
	public String showProjectList(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(required = false) String searchType, 
												@RequestParam(required = false) String searchKey , HttpServletRequest req,Model model) {
		
		List<Project> projectList = projectService.findProject();
		model.addAttribute("project", projectList);
		
		List<Project> projectList2 = projectService.findProject2();
		model.addAttribute("project2", projectList2);
		
		int pageSize = 2;	// 전체게시글수
		int pagerSize = 8;  // 한페이지에 나올 갯수
		HashMap<String, Object> params = new HashMap<>();
		int beginningPageNo = (pageNo - 1) * pageSize + 1;
		params.put("beginningPageNo", beginningPageNo);
		params.put("end", beginningPageNo + pageSize);
		params.put("searchType", searchType);
		params.put("searchKey", searchKey);
		
		//projectList = projectService.findPageing(params);
		int projectListCount = projectService.projectListCount(params);
		
		//ThePager pager = new ThePager(projectListCount, pageNo, pageSize, pagerSize, "prlist.action", req.getQueryString() );
		ThePager pager = new ThePager(projectListCount, pageNo, pageSize, pagerSize, "prlist.action", req.getQueryString() );
		model.addAttribute("pager", pager);
		
		System.out.println(pager);
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
	public String list(Model model) {
		
		List<Project> projectList = projectService.findProject();
		model.addAttribute("project", projectList);
		
		return "project/list";
	}
	
	@GetMapping(path = {"/list2"})
	public String list2(Model model) {
		
		List<Project> projectList2 = projectService.findProject2();
		model.addAttribute("project2", projectList2);
		
		return "project/list2";
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
	public String write(int projectNo) {
		
		Project project = projectService.searchProjectByNo(projectNo);
		
		return "success";
		
	}
	/*
	 * @GetMapping(path = {"/detail"}, produces = "application/json;charset=utf-8")
	 * 
	 * @ResponseBody public Project searchProject(int projectNo) { Project project =
	 * projectService.searchProjectByNo(projectNo); if (project == null) { throw new
	 * RuntimeException("이동 실패"); } else { return project; } }
	 */
	

	
}
