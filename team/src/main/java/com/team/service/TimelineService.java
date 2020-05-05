package com.team.service;

import java.util.HashMap;
import java.util.List;

import com.team.vo.TaskList;

public interface TimelineService {
	
	public List<TaskList> searchTasks(HashMap<String, Object> params);
	public void updateDate(HashMap<String, Object> params);
}
