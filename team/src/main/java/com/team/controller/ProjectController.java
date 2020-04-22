package com.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.service.ProjectService;
import com.team.vo.Project;

@Controller
@RequestMapping(path = {"/project"})
public class ProjectController {
	
	@Autowired
	@Qualifier("projectService")
	private ProjectService projectService;
	
	@GetMapping(path = { "/prlist" })
	public String showProjectList(Model model) {
		
		List<Project> projectList = projectService.findProject();
		model.addAttribute("project", projectList);
		List<Project> projectList2 = projectService.findProject2();
		model.addAttribute("project2", projectList2);
		
		return "project/prlist";
	}
	
	/*
	 * // 최근 4건만 가져오는 것
	 * 
	 * @GetMapping(path = { "/prlist2" }) public String showProjectList2(Model
	 * model) {
	 * 
	 * List<Project> projectList = projectService.findProject2();
	 * model.addAttribute("project2", projectList);
	 * 
	 * return "project/prlist"; }
	 */
	
	@PostMapping(path = {"/write.action"})
	public String write(Project project) {
		
		projectService.writeProject(project);
		
		return "redirect:prlist.action";
		
	}

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
	

	
}
