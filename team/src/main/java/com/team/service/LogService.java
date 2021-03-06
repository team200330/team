package com.team.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.team.vo.Log;

public interface LogService {

	public void writeLog(Log log);
	
	public List<Log> findLogByProjectNo(HashMap<String, Object> params);
	
	public void logCheckByReceiver(HashMap<String, Object> params);
	
	public void logDeleteByReceiver(HashMap<String, Object> params);
	
	public int uncheckedLogCount(HashMap<String, Object> params);
	
	public Date findLatestWriteDate(HashMap<String, Object> params);
	
}
