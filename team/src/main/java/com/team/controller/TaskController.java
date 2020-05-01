package com.team.controller;

import java.util.ArrayList;
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

import com.team.service.TaskService;
import com.team.ui.TimelineTable;
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
	@GetMapping(path= {"/timeline"})
	public String showTaskTimeLine(Model model) {
		
		List<TaskList> newList = new ArrayList<>();
		List<TaskList> lists = taskService.searchTaskList();
		List<Task> tasks = taskService.searchTask();
		
		for (TaskList l : lists) {
			List<Task> ts = new ArrayList<>();
			for (Task t : tasks) if (t.getListNo() == l.getListNo()) ts.add(t);

			l.setTasks(ts);
			newList.add(l);
		}
		
		if (lists != null) model.addAttribute("table", new TimelineTable(newList).toString());
		
		
		return "task/timeline";
	}
	
}
