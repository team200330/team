package com.team.service;

import java.util.List;

import com.team.vo.TaskList;

public interface TaskService {

	void addTaskList(TaskList taskList);

	List<TaskList> searchTaskList();
}
