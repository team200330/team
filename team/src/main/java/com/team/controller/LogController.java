package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.LogService;
import com.team.vo.Log;

@Controller
@RequestMapping("/log")
public class LogController {
	
	@Autowired
	@Qualifier("logService")
	private LogService logService;
	
	// 임시 프로젝트 번호
	static final int projectNo = 1;
	
	@GetMapping("/list")
	public String logList() {
		
		List<Log> logs = logService.findLogByProjectNo(projectNo);
		
		for (Log l : logs) {
			System.out.println(l.toString());
			
		}
		
		return "/log/list";
	}
	
}
