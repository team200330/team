package com.team.service;

import java.util.HashMap;
import java.util.List;

import com.team.vo.ProjectMember;
import com.team.vo.Task;
import com.team.vo.TaskList;

public interface TaskService {

	void addTaskList(TaskList taskList);

	List<TaskList> searchTaskList(int projectNo);

	void deleteTaskList(int listNo);

	void addTask(Task task);

	List<Task> searchTask();

	void deleteTask(int taskNo);

	void updateCompleted(HashMap<String, Object> params);

	int finishTaskListByEmail(String email);

	int notfinishTaskListByEmail(String email);

	int finishTaskListByProjectMember(ProjectMember projectmember);

	int notfinishTaskListByProjectMember(ProjectMember projectmember);

	int allTaskListByProjectMember(ProjectMember projectmember);

	int endDateNullTaskListByProjectMember(ProjectMember projectmember);

	List<Task> TaskListByProjectMember(ProjectMember projectmember);
	
	
	void addTask2(Task task);
	
	///////////////////////////////////
	// 업무분석 관련
	int countCompletedTasks(HashMap<String, Object> params);
	int countTaskByCreatedDate(HashMap<String, Object> params);
	Task searchTask(int taskNo);


	int taskCount(int projectNo);

	int taskCompletedCount(int projectNo);

	void updateTaskTimes(HashMap<String, Object> params);


}
