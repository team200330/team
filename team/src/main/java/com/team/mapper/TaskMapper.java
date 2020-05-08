package com.team.mapper;

import java.util.HashMap;
import java.util.List;

import com.team.vo.Task;
import com.team.vo.TaskList;

public interface TaskMapper {

	void insertTaskList(TaskList taskList);

	List<TaskList> selectTaskList();

	void deleteTaskList(int listNo);

	void insertTask(Task task);

	List<Task> selectTask();
	
	Task selectTaskByTaskNo(int taskNo);

	void deleteTask(int taskNo);

	void updateCompleted(HashMap<String, Object> params);

	
}
