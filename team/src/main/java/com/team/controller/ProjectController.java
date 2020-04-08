package com.team.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(path = {"/project"})
public class ProjectController {

	
	@GetMapping(path = { "/prlist.action" })
	public String showProjectWriteForm() {
		
		return "project/prlist";
	}
	
}
