package com.team.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.LogService;
import com.team.vo.Log;
import com.team.vo.Member;

@Controller
@RequestMapping("/log")
public class LogController {
	
	@Autowired
	@Qualifier("logService")
	private LogService logService;
	
	// 임시 프로젝트 번호
	static final int projectNo = 1;
	
	@GetMapping("/list")
	public String logList(Model model, HttpSession session) {
		
		if (session.getAttribute("loginuser") == null) return "redirect:/account/login.action";
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("projectNo", projectNo);
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		
		List<Log> log = logService.findLogByProjectNo(params);
		Map<String, List<Log>> logs = new HashMap<>();
		
		// 같은 날짜끼리 map 에 저장
		for (int i = 0; i < log.size() - 1; i++) {
			int j = 0;
			List<Log> tmp = new ArrayList<>();
			String s = log.get(i).getWritedate().toString().split(":")[0];
			tmp.add(log.get(i));

			for (j = i + 1; j < log.size(); j++) {
				String s2 = log.get(j).getWritedate().toString().split(":")[0];
				
				if (s.substring(0, s.length() - 2).equals(s2.substring(0, s2.length() - 2)) == false) break;
				
				tmp.add(log.get(j));	
			}
			
			logs.put(s.substring(0, s.length() - 2), tmp);
			i = j;
		}
		
		Object[] mapkey = logs.keySet().toArray();
		Arrays.sort(mapkey, Collections.reverseOrder()); // 키 내림차순 정렬
		
		model.addAttribute("keys", mapkey);
		model.addAttribute("logs", logs);
		
		return "/log/list";
	}
	
}
