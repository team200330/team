package com.team.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.TaskService;
import com.team.service.TimelineService;
import com.team.ui.TimelineTable;
import com.team.vo.Member;
import com.team.vo.Task;
import com.team.vo.TaskList;

@Controller
@RequestMapping(path = {"/task"})
public class TaskController {
	@Autowired
	@Qualifier("taskService")
	private TaskService taskService;
	
	@GetMapping(path = {"/main"})
	public String showTaskMain(Model model) {
		model.addAttribute("taskLists",taskService.searchTaskList());
		model.addAttribute("tasks",taskService.searchTask());
		return "task/taskmain";
	}
	
	@PostMapping(path = {"/addlist.action"})
	@ResponseBody
	public String addList(TaskList taskList) {
		taskService.addTaskList(taskList);
		return "success";
	}
	
	@PostMapping(path = {"/addtask.action"})
	@ResponseBody
	public String addTask(Task task, HttpSession session) {
		session.setAttribute("task", task);
		
		taskService.addTask(task);
		return "success";
	}
	
	@GetMapping(path = {"/loadtask.action"})
	public String loadTask(Model model) {
		model.addAttribute("taskLists",taskService.searchTaskList());
		model.addAttribute("tasks",taskService.searchTask());
		return "task/modules/task-list";
	}
	
	
	@GetMapping(path = {"/properties"})
	public String loadProperties(int taskNo, Model model) {
		for(Task task : taskService.searchTask()) {
			if(task.getTaskNo() == taskNo) {
				model.addAttribute("selectedTask", task);
			}
		}
		return "task/modules/task-properties";
	}
	
	@PostMapping(path = {"/chstatus.action"})
	@ResponseBody
	public String updateTaskStatus(int taskNo, int completed, Date completedDate) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("taskNo", taskNo);
		params.put("completed", completed);
		params.put("completedDate", completedDate);
		System.out.println(taskNo+"//"+completed);
		taskService.updateCompleted(params);
		return "success";
	}
	
	@PostMapping(path = {"/deletelist.action"})
	@ResponseBody
	public String deleteList(int listNo) {
		taskService.deleteTaskList(listNo);
		return "success";
	}
	@PostMapping(path = {"/deletetask.action"})
	@ResponseBody
	public String deleteTask(int taskNo) {
		taskService.deleteTask(taskNo);
		return "success";
	}
	
	@GetMapping(path = {"/analyticsmain"})
	public String showanalyticsMain() {
		return "task/analyticsmain";
	}
	
	
	
	
	
	
	
	///////////////////////////////////////////
	@Autowired
	@Qualifier("timelineService")
	private TimelineService timelineService;
	
	static final int projectNo = 1;
	
	@GetMapping("/timeline/getTable")
	public String showTimelineTable(HttpSession s, Model model, String searchType) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("searchType", (searchType.length() == 0 || searchType == null) ? "A" : searchType);
		params.put("email", ((Member)s.getAttribute("loginuser")).getEmail());
		params.put("projectNo", projectNo);
		
		model.addAttribute("table",  // 세션에 프로젝트번호 저장되면 바꾸기 (프로젝트 생성한 달, 프로젝트 마감달)
			new TimelineTable(timelineService.searchTasks(params), 5, 12).toString());
		
		return "task/modules/timeline-table";
	}
	
	@PostMapping("/timeline/dateUpdate")
	@ResponseBody
	public String updateDate(int taskNo, String date, String dateType) {
		Calendar c = Calendar.getInstance();
		HashMap<String, Object> params = new HashMap<>();
		
		params.put("taskNo", taskNo);
		params.put("date", c.get(c.YEAR) + date.split("date")[1]);
		params.put("dateType", dateType);
		timelineService.updateDate(params);
		
		return "success";
	}
	
	@GetMapping(path= {"/timeline"})
	public String showTaskTimeLine(HttpSession s, Model model) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("searchType", "A");
		params.put("email", ((Member)s.getAttribute("loginuser")).getEmail());
		params.put("projectNo", projectNo);
		
		model.addAttribute("table", 
			new TimelineTable(timelineService.searchTasks(params), 5, 12).toString());
		
		return "task/timeline";
	}
	@GetMapping("/timeline2")
	public String showTaskTimeLine() {
		return "task/timeline";
	}
	
}
