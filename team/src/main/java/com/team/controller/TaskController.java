package com.team.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
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
		
		Project project = (Project) session.getAttribute("projectByNo");
		model.addAttribute("project", project);

		String email = ((Member) session.getAttribute("loginuser")).getEmail();
		
		/////////////////////////////////////////////////////////////////////////////////////
		Calendar cal = Calendar.getInstance();
		cal.setTime(project.getStartdate());

		// 현재시간 - 해당일자를 1000분의 1초 단위로 구한다음 / 1000 / 24 / 60 / 60 해서 날짜를 구한다.
		// Math.round(double * 100 / 100.0) == 소수점 둘째자리까지 자른다.
		double elapsedTime = (System.currentTimeMillis() - cal.getTimeInMillis()) / 1000 / (24 * 60 * 60);
		model.addAttribute("elapsedTime", Math.round(elapsedTime * 100 / 100.0));  // 프로젝트 시작일로부터 경과시간 (현재시간 - 시작일)
		
		cal.setTime(project.getDeadline());
		double remainingTime = (cal.getTimeInMillis() - System.currentTimeMillis()) / 1000 / (24 * 60 * 60);
		model.addAttribute("remainingTime", project.getDeadline() != null ? Math.round(remainingTime * 100 / 100.0) : "-"); // 마감일까지 남은 시간 (마감일 - 현재시간)
		
		/////////////////////////////////////////////////////////////////////////////////////
		
		
		
//		int CountFinishTaskList = taskService.finishTaskListByProjectMember(projectmember);
//		model.addAttribute("CountFinishTaskList",CountFinishTaskList);
//		
//		int CountnotFinishTaskList = taskService.notfinishTaskListByProjectMember(projectmember);
//		model.addAttribute("CountnotFinishTaskList",CountnotFinishTaskList);
//		
//		int CountallTaskList = taskService.allTaskListByProjectMember(projectmember);
//		model.addAttribute("CountallTaskList",CountallTaskList);
//				
//		int CountendDateNullTaskList = taskService.endDateNullTaskListByProjectMember(projectmember);
//		model.addAttribute("CountendDateNullTaskList",CountendDateNullTaskList);
//		
//		double finishTaskPercent = (double)((double)CountFinishTaskList / (double)CountallTaskList * 100 );		
//		model.addAttribute("finishTaskPercent",finishTaskPercent);		
//		
//		double notfinishTaskPercent = (double)((double)CountnotFinishTaskList / (double)CountallTaskList * 100 );		
//		model.addAttribute("notfinishTaskPercent",notfinishTaskPercent);	
//		
//		double endDateNullTaskPercent = (double)((double)CountendDateNullTaskList / (double)CountallTaskList * 100 );		
//		model.addAttribute("endDateNullTaskPercent",endDateNullTaskPercent);	
//		
//		List <Task> tasks = taskService.TaskListByProjectMember(projectmember);
//		model.addAttribute("tasks",tasks);
		
		
		
		
		
		
		///////////////////////////////////////////////////////////////////
		HashMap<String, Object> params = new HashMap<>();
		params.put("projectNo", project.getProjectNo());

		// 전체업무 데이터 설정
		setModelDatas(model, params);
		
		// 내가 작성한 업무 데이터 설정
		params.put("email", email);
		setModelDatas(model, params);
		
		
		///////////////////////////////////////////////////////////////////
		// 그래프용 데이터 - 프로젝트 생성일부터 1달간 1일 간격으로 생성된 업무 가져오기
		HashMap<String, Object> createdTasks = new HashMap<>();		// 생성된 업무 날짜별 가져오기
		HashMap<String, Object> completedTasks = new HashMap<>();	// 완료된 업무 날짜별 가져오기
		String[] tmp = project.getStartdate().toString().split("-");
		String date = tmp[0] + "-" + tmp[1] + "-";
		
		cal.setTime(project.getStartdate());
		
		for (int i = project.getStartdate().getDate(); i < cal.getActualMaximum(Calendar.DATE); i += 2) {
			// 생성된 업무 날짜별 가져오기
			params.put("startDate", date + i); params.put("endDate", date + (i + 1));
			createdTasks.put(date + i, taskService.countTaskByCreatedDate(params));
			// 완료된 업무 날짜별 가져오기
			params.put("searchType", "completed");
			completedTasks.put(date + i, taskService.countTaskByCreatedDate(params));
			
			params.remove("searchType");
		}
		
		
		// 날짜 오름차순 정렬
		Object[] mapkey = createdTasks.keySet().toArray();
		Arrays.sort(mapkey); 
		
		// javascript 로 Object 배열 하나씩 못꺼내와서 문자열로 바꿈
		String keySet = "";
		for (Object o : mapkey) keySet += (o.toString() + "_"); 

		//for (Object s : mapkey) System.out.println(s + " : " + createdTasks.get(s).toString());
		
		model.addAttribute("createdTasks", createdTasks);
		model.addAttribute("completedTasks", completedTasks);
		model.addAttribute("keySet", keySet);
		
		return "task/analyticsmain";
	}
	
	
	
	void setModelDatas(Model model, HashMap<String, Object> params) {
		String prefix = params.get("email") != null ? "M" : "A";

		// 전체 업무 개수
		model.addAttribute(prefix + "_total", taskService.countCompletedTasks(params));
		
		// 완료된 업무
		params.put("completed", true);
		model.addAttribute(prefix + "_completed", taskService.countCompletedTasks(params));

		// 마감일 지난 업무
		params.put("pastDeadline", true); params.remove("completed");
		model.addAttribute(prefix + "_pastDeadline", taskService.countCompletedTasks(params));

		// 마감일이 있는 업무
		params.put("hasDeadline", true); params.remove("pastDeadline");
		model.addAttribute(prefix + "_hasDeadline", taskService.countCompletedTasks(params));
		
		params.remove("hasDeadline");
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
