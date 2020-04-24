package com.team.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.vo.Log;

@Mapper
public interface LogMapper {

	public List<Log> selectLogByProjectNo(HashMap<String, Object> params);
	
	public void updateCheckedByReceiver(HashMap<String, Object> params);
	
	public void deleteLogByReceiver(HashMap<String, Object> params);
	
}
