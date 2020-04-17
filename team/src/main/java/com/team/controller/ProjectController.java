package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.service.ProjectService;
import com.team.vo.Project;

@Controller
@RequestMapping(path = {"/project"})
public class ProjectController {
	
	@Autowired
	@Qualifier("projectService")
	private ProjectService projectService;
	
	@GetMapping(path = { "/prlist" })
	public String showProjectWriteForm() {
		
		return "project/prlist";
	}
	
	@PostMapping(path = {"/write.action"})
	public String write(Project project, RedirectAttributes attr) {
		
		int projectNo = projectService.writeProject(project);
		attr.addFlashAttribute("projectNo", projectNo);		
		return "redirect:prlist.action";
		
	}
	
}
