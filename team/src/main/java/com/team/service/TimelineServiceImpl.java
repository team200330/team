package com.team.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.team.mapper.TimelineMapper;
import com.team.vo.TaskList;

@Service("timelineService")
public class TimelineServiceImpl implements TimelineService {

	@Autowired
	@Qualifier("timelineMapper")
	private TimelineMapper timelineMapper;
	
	@Override
	public List<TaskList> searchTasks(HashMap<String, Object> params) {
		return timelineMapper.searchTasks(params);
	}
	
	@Override
	public void updateDate(HashMap<String, Object> params) {
		timelineMapper.updateDate(params);
	}
}
