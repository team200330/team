package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.team.mapper.TaskMapper;
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
	public List<TaskList> searchTaskList() {
		return taskMapper.selectTaskList();
	}

	@Override
	public void deleteTaskList(int listNo) {
		taskMapper.deleteTaskList(listNo);
	}
	
}
