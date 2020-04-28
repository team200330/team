package com.team.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("projectNo", projectNo);
		params.put("email", ((Member) session.getAttribute("loginuser")).getEmail());
		params.put("searchType", "A");
		
		Map<String, List<Log>> logs = writedateSplit(logService.findLogByProjectNo(params));
		
		model.addAttribute("keys", reverseOrderMapkey(logs));
		model.addAttribute("logs", logs);
		
		return "/log/list";
	}
	
	@GetMapping("/list2")
	public String logList2() {
		return "/log/list";
	}
	
	@GetMapping("/search")
	public String searchLog(@RequestParam(defaultValue = "A")String searchType, String email, String key, String date, Model model) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("email", email);
		params.put("searchType", searchType);
		params.put("projectNo", projectNo);
		params.put("key", key);
		params.put("writedate", date);
		
		
		Map<String, List<Log>> logs = writedateSplit(logService.findLogByProjectNo(params));
		
		model.addAttribute("keys", reverseOrderMapkey(logs));
		model.addAttribute("logs", logs);
		 
		return "/log/modules/log-list";
	}
	
	@PostMapping("/check")
	@ResponseBody
	public String checkLog(HttpSession session, int logNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("logNo", logNo);
		params.put("receiver", ((Member)session.getAttribute("loginuser")).getEmail() );
		
		logService.logCheckByReceiver(params);
		return "success";
	}
	
	@PostMapping("/checkLogs")
	@ResponseBody
	public String checkLogs(HttpSession session, String[] logNo) {
		for (String s : logNo) System.out.println(s);

		return "success";
	}
	
	
	@PostMapping("/delete")
	@ResponseBody
	public String deleteLog(HttpSession session, int logNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("logNo", logNo);
		params.put("receiver", ((Member)session.getAttribute("loginuser")).getEmail() );
		
		logService.logDeleteByReceiver(params);
		return "success";
	}
	
	
	
	
	// 날짜를 키로 해서 로그 분류
	public Map<String, List<Log>> writedateSplit(List<Log> log) {
		
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		Map<String, List<Log>> logs = new HashMap<>();

		for (int i = 0; i < log.size(); i++) {
			int j = 0;
			List<Log> tmp = new ArrayList<>(); tmp.add(log.get(i));
			String s = log.get(i).getWritedate().toString().split(":")[0];
			
			for (j = i + 1; j < log.size(); j++) {
				String s2 = log.get(j).getWritedate().toString().split(":")[0];
				if (s.substring(0, s.length() - 2).equals(s2.substring(0, s2.length() - 2)) == false) break;
				
				tmp.add(log.get(j));	
			}
			logs.put(format.format(log.get(i).getWritedate()), tmp);
			i = j - 1;
		}
		
		return logs;
	}
	
	// 맴 키 내림차순 정렬
	public Object[] reverseOrderMapkey(Map<String, List<Log>> logs) {
		Object[] mapkey = logs.keySet().toArray();
		Arrays.sort(mapkey, Collections.reverseOrder()); 
		
		return mapkey;
	}
}
