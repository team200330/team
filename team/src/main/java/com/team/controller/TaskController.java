package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.TaskService;
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
	public String addTask(Task task) {
		taskService.addTask(task);
		return "success";
	}
	
	@GetMapping(path = {"/loadtask.action"})
	public String loadTask(Model model) {
		model.addAttribute("taskLists",taskService.searchTaskList());
		model.addAttribute("tasks",taskService.searchTask());
		return "task/modules/task-list";
	}
	
	@PostMapping(path = {"/deletelist.action"})
	@ResponseBody
	public String deleteList(int listNo) {
		taskService.deleteTaskList(listNo);
		return "success";
	}
}
