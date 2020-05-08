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
import com.team.vo.Project;
import com.team.vo.Task;
import com.team.vo.TaskList;

@Controller
@RequestMapping(path = {"/task"})
public class TaskController {
	@Autowired
	@Qualifier("taskService")
	private TaskService taskService;
	
	@GetMapping(path = {"/main"})
	public String showTaskMain(Model model, HttpSession session) {
		//model.getAttribute("projectNo");
		//System.out.println((int) session.getAttribute("projectNo"));
		int projectNo = ((Project) session.getAttribute("projectByNo")).getProjectNo();
		//System.out.println("넘어온값:"+projectNo);
		//model.addAttribute("projectNo",projectNo);
		model.addAttribute("taskLists",taskService.searchTaskList(projectNo));
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
	public String loadTask(Model model, HttpSession session) {
		int projectNo = ((Project) session.getAttribute("projectByNo")).getProjectNo();
		model.addAttribute("taskLists",taskService.searchTaskList(projectNo));
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
	public String updateTaskStatus(int taskNo, int completed, Date completedDate, HttpSession session) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("taskNo", taskNo);
		params.put("completed", completed);
		params.put("completedDate", completedDate);
		System.out.println(taskNo+"//"+completed);
		taskService.updateCompleted(params);
		
		// 로그로 전달
		session.setAttribute("taskNo", taskNo);
		session.setAttribute("completed", completed);
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
	public String deleteTask(int taskNo, HttpSession session) {
		session.setAttribute("taskNo", taskNo);
		
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
		HashMap<String, Object> params = 
			returnParams(((Project) s.getAttribute("projectByNo")).getProjectNo(), null, ((Member)s.getAttribute("loginuser")).getEmail(), 
						(searchType.length() == 0 || searchType == null) ? "A" : searchType, null, null);

		model.addAttribute("table",  // 세션에 프로젝트번호 저장되면 바꾸기 (프로젝트 생성한 달, 프로젝트 마감달)
			new TimelineTable(timelineService.searchTasks(params), 5, 12).toString());
		
		return "task/modules/timeline-table";
	}
	
	@PostMapping("/timeline/dateUpdate")
	@ResponseBody
	public String updateDate(int taskNo, String date, String dateType) {
		Calendar c = Calendar.getInstance();
		HashMap<String, Object> params = returnParams(null, taskNo, null, null, c.get(c.YEAR) + date.split("date")[1], dateType);
		
		timelineService.updateDate(params);
		
		return "success";
	}
	
	@GetMapping(path= {"/timeline"})
	public String showTaskTimeLine(HttpSession s, Model model) {
		HashMap<String, Object> params = returnParams(((Project) s.getAttribute("projectByNo")).getProjectNo(), null, ((Member)s.getAttribute("loginuser")).getEmail(), "A", null, null);

		model.addAttribute("table", new TimelineTable(timelineService.searchTasks(params), 5, 12).toString());
		
		return "task/timeline";
	}
	
	@GetMapping("/timeline2")
	public String showTaskTimeLine() {
		return "task/timeline";
	}
	
	
	
	
	
	
	
	private HashMap<String, Object> returnParams(Object projectNo, Object taskNo, Object email, Object searchType, Object date, Object dateType) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("projectNo", projectNo);
		params.put("taskNo", taskNo);
		params.put("email", email);
		params.put("searchType", searchType);
		params.put("date", date);
		params.put("dateType", dateType);
		
		return params;
	}
	
	
	
	/////////////////////////////////////////////////////////////////
	
//	@GetMapping("/calender")
//	public String calender(Model model) throws JsonProcessingException {
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("searchType", "A");
//		params.put("projectNo", projectNo);
//
//		// json 타입으로 뷰에 전송시 날짜 이상하게 나오기때문에 simpledateformat 으로 고침
//		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
//		
//		List<Task> tasks = new ArrayList<>();
//		for (TaskList l : timelineService.searchTasks(params)) {
//			for (Task t : l.getTasks()) { 
//				if (t.getStartDate() != null) t.setS_startDate(f.format(t.getStartDate()));
//				if (t.getEndDate() != null) t.setS_endDate(f.format(t.getEndDate()));
//				if (t.getCompletedDate() != null) t.setS_completedDate(f.format(t.getCompletedDate()));
//				tasks.add(t);
//			}
//		}
//		
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonText = mapper.writeValueAsString(tasks);
//		model.addAttribute( "tasks", jsonText );
//		return "/calender";
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
