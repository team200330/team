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
	
	/* 6 : 워크스페이스 번호

	template 쓸려면 templateVO에 있는 
	int templateNo;
	String templateName;
	목록을 조회해서

	controller에서 

	템플릭 목록 (리스트 가져오기)
	controller에서 보낼때 템플릿 이름과 프로젝트 정보들을 보냄
	템플릿 이름과 템플릿 목록을 비교해서 이름 똑같은 번호를 
		for(템플릿VO 변수이름 : 템플릿 목록)
			if(변수이름 getTemplatName.equals(가져온 템플릿 이름))
				프로젝트 변수 (setTemplsetNo(번호))

	*/
	
	
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
