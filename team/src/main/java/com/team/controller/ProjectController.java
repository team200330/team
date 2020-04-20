package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		return "project/prlist";
	}
	
	@PostMapping(path = {"/write.action"})
	public String write(Project project) {
		
		projectService.writeProject(project);
		
		return "redirect:prlist.action";
		
	}
	
//	@ReaustMapping(value="/project-list/selectProNo")
//	public void selectAjax(HttpServletRequest request, HttpServletResponse response, String param) {
//		
//	} 
	
//	
//	@ RequestMapping ( value = "view_1_typeCnt")
//	 public ModelAndView product_typeCnt ( HttpServletRequest request , HttpServletResponse response , ModelMap model ) throws Exception {
//	  
//	  ParamMap paramMap = parseRequest( request );
//	  
//	     /* Ajax List 리턴을 위해서는 ModelAndView 로 세팅해야함 */
//	     ModelAndView modelAndView = new ModelAndView();
//	  //수량
//	     List < Project > proNo = projectService.projectNo( paramMap, "getprodtypecnt" );
//	     modelAndView.setViewName("jsonView");
//	     modelAndView.addObject("result", proNo);
//	    
//	     return modelAndView;
//	 }

	
}
