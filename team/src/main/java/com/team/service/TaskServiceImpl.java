package com.team.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.team.mapper.TaskMapper;
import com.team.vo.ProjectMember;
import com.team.vo.Task;
import com.team.vo.TaskList;

@Service("taskService")
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	@Qualifier("taskMapper")
	private TaskMapper taskMapper;
	
	@Override
	public void addTaskList(TaskList taskList) {
		taskMapper.insertTaskList(taskList);
	}

	@Override
	public List<TaskList> searchTaskList(int projectNo) {
		return taskMapper.selectTaskList(projectNo);
	}

	@Override
	public void deleteTaskList(int listNo) {
		taskMapper.deleteTaskList(listNo);
	}

	@Override
	public void addTask(Task task) {
		taskMapper.insertTask(task);
	}

	@Override
	public List<Task> searchTask() {
		return taskMapper.selectTask();
	}

	@Override
	public void deleteTask(int taskNo) {
		taskMapper.deleteTask(taskNo);
	}

	@Override
	public void updateCompleted(HashMap<String, Object> params) {
		taskMapper.updateCompleted(params);
	}

	@Override
	public int finishTaskListByEmail(String email) {
		int CountFinishTaskList = taskMapper.finishTaskListByEmail(email);
		return CountFinishTaskList;
	}

	@Override
	public int notfinishTaskListByEmail(String email) {
		int CountnotFinishTaskList = taskMapper.notfinishTaskListByEmail(email);
		return CountnotFinishTaskList;
	}

	@Override
	public int finishTaskListByProjectMember(ProjectMember projectmember) {
		int CountFinishTaskList = taskMapper.finishTaskListByProjectMember(projectmember);
		return CountFinishTaskList;
	}

	@Override
	public int notfinishTaskListByProjectMember(ProjectMember projectmember) {
		int CountnotFinishTaskList = taskMapper.notfinishTaskListByProjectMember(projectmember);
		return CountnotFinishTaskList;
	}

	@Override
	public int allTaskListByProjectMember(ProjectMember projectmember) {
		int CountallTaskList = taskMapper.allTaskListByProjectMember(projectmember);
		return CountallTaskList;
	}

	@Override
	public int endDateNullTaskListByProjectMember(ProjectMember projectmember) {
		int CountendDateNullTaskList = taskMapper.endDateNullTaskListByProjectMember(projectmember);
		return CountendDateNullTaskList;
	}

	
	
}
