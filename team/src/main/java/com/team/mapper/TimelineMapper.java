package com.team.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.vo.TaskList;

@Mapper
public interface TimelineMapper {

	public List<TaskList> searchTasks(HashMap<String, Object> params);
	public void updateDate(HashMap<String, Object> params);
}
