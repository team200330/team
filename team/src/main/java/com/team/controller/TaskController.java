package com.team.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.service.LogService;
import com.team.service.TaskService;
import com.team.service.TimelineService;
import com.team.ui.TimelineTable;
import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.ProjectMember;
import com.team.vo.Task;
import com.team.vo.TaskList;

@Controller
@RequestMapping(path = {"/task"})
public class TaskController {
	@Autowired
	@Qualifier("taskService")
	private TaskService taskService;

	@Autowired
	@Qualifier("logService")
	private LogService logService;
	
	@GetMapping(path = {"/main"})
	public String showTaskMain(Model model, HttpSession session) {
		//model.getAttribute("projectNo");
		//System.out.println((int) session.getAttribute("projectNo"));
		int projectNo = ((Project) session.getAttribute("projectByNo")).getProjectNo();
		//System.out.println("넘어온값:"+projectNo);
		//model.addAttribute("projectNo",projectNo);
		model.addAttribute("taskLists",taskService.searchTaskList(projectNo));
		model.addAttribute("tasks",taskService.searchTask());
		
		// 프로젝트 선택시 읽지않은 로그개수 가져오기 (탑바)
		HashMap<String, Object> params = new HashMap<>();
		params.put("projectNo", ((Project) session.getAttribute("projectByNo")).getProjectNo()); 
		session.setAttribute("logCount", logService.uncheckedLogCount(params));
		session.setAttribute("latestLogDate", logService.findLatestWriteDate(params));
		
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
	public String showanalyticsMain(Model model, HttpSession session, ProjectMember projectmember) {

		
		projectmember.setProjectNo(((Project) session.getAttribute("projectByNo")).getProjectNo());
		//프로젝트 세션에 있는 프로젝트넘버값을 셋한다.
		projectmember.setEmail(((Member) session.getAttribute("loginuser")).getEmail());
		
		int CountFinishTaskList = taskService.finishTaskListByProjectMember(projectmember);
		model.addAttribute("CountFinishTaskList",CountFinishTaskList);
		
		int CountnotFinishTaskList = taskService.notfinishTaskListByProjectMember(projectmember);
		model.addAttribute("CountnotFinishTaskList",CountnotFinishTaskList);
		
		int CountallTaskList = taskService.allTaskListByProjectMember(projectmember);
		model.addAttribute("CountallTaskList",CountallTaskList);
				
		int CountendDateNullTaskList = taskService.endDateNullTaskListByProjectMember(projectmember);
		model.addAttribute("CountendDateNullTaskList",CountendDateNullTaskList);
		
		double finishTaskPercent = (double)((double)CountFinishTaskList / (double)CountallTaskList * 100 );		
		model.addAttribute("finishTaskPercent",finishTaskPercent);		
		
		double notfinishTaskPercent = (double)((double)CountnotFinishTaskList / (double)CountallTaskList * 100 );		
		model.addAttribute("notfinishTaskPercent",notfinishTaskPercent);	
		
		double endDateNullTaskPercent = (double)((double)CountendDateNullTaskList / (double)CountallTaskList * 100 );		
		model.addAttribute("endDateNullTaskPercent",endDateNullTaskPercent);	
		
		List <Task> tasks = taskService.TaskListByProjectMember(projectmember);
		model.addAttribute("tasks",tasks);
		
		return "task/analyticsmain";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	///////////////////////////////////////////
	// timeline
	@Autowired
	@Qualifier("timelineService")
	private TimelineService timelineService;
	
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
	// calendar
	@GetMapping("/calendar")
	public String calender(Model model, HttpSession s) throws JsonProcessingException {
		HashMap<String, Object> params = new HashMap<>();
		params.put("searchType", "A");
		params.put("projectNo", ((Project) s.getAttribute("projectByNo")).getProjectNo());
		
		// json 타입으로 뷰에 전송시 날짜 이상하게 나오기때문에 simpledateformat 으로 고침
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		
		List<Task> tasks = new ArrayList<>();
		for (TaskList l : timelineService.searchTasks(params)) {
			System.out.println(l.toString());
			
			for (Task t : l.getTasks()) { 
				System.out.println("startdate : " + t.getStartDate());
				System.out.println("enddate : " + t.getEndDate());
				
				if (t.getStartDate() != null) t.setS_startDate(f.format(t.getStartDate()));
				if (t.getEndDate() != null) t.setS_endDate(f.format(t.getEndDate()));
				if (t.getCompletedDate() != null) t.setS_completedDate(f.format(t.getCompletedDate()));
				
				System.out.println("s_startDate : " + t.getS_startDate());
				System.out.println("s_endDate : " + t.getS_endDate());
				
				System.out.println(t.toString());
				tasks.add(t);
			}
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString(tasks);
		model.addAttribute( "tasks", jsonText );
		return "/task/calendar-main";
	}
	
	@GetMapping("/loadCalendar")
	public String loadCalendar() {
		return "/task/modules/calendar";
	}
	
	@GetMapping("/getTaskLists")
	@ResponseBody
	public String getTaskList(HttpSession s) {
		s.setAttribute("calTaskLists",taskService.searchTaskList(((Project) s.getAttribute("projectByNo")).getProjectNo()));
		return "success";
	}
	
	@GetMapping("/loadCalendarModal")
	public String loadCalendarModal(HttpSession s) {
		return "/task/modules/calendar-modals";
	}
	

	@PostMapping(path = {"/addtaskSetStartDate"})
	public String addTask2(Task task, HttpSession s, Model model) throws JsonProcessingException {
		s.setAttribute("task", task);
		s.removeAttribute("calTaskLists");
		
		taskService.addTask2(task);
		return "redirect:/task/calendar";
	}

	
	
	
	
	
	
	
	
}
