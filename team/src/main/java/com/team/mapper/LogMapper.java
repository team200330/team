package com.team.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.vo.Log;
import com.team.vo.LogReceiver;
import com.team.vo.ProjectMember;

@Mapper
public interface LogMapper {

	public void insertLog(Log log);
	public void insertLogReceiver(LogReceiver receiver);
	
	public List<Log> selectLogByProjectNo(HashMap<String, Object> params);
	
	public void updateCheckedByReceiver(HashMap<String, Object> params);
	
	public void deleteLogByReceiver(HashMap<String, Object> params);
	
	public int countLog(HashMap<String, Object> params);
	
	public Date selectLatestWritedate(HashMap<String, Object> params);
	
}
