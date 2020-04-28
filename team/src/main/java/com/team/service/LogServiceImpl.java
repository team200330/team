package com.team.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.team.mapper.LogMapper;
import com.team.mapper.ProjectMapper;
import com.team.service.LogService;
import com.team.vo.Log;
import com.team.vo.Project;

@Service("logService")
public class LogServiceImpl implements LogService {
	
	@Autowired
	@Qualifier("logMapper")
	private LogMapper logMapper;
	
	@Autowired
	@Qualifier("projectMapper")
	private ProjectMapper projectMapper;

	@Override
	public void writeLog(Log log) {
		logMapper.insertLog(log);
	}
	
	@Override
	public List<Log> findLogByProjectNo(HashMap<String, Object> params) {
		return logMapper.selectLogByProjectNo(params);
	}

	@Override
	public void logCheckByReceiver(HashMap<String, Object> params) {
		logMapper.updateCheckedByReceiver(params);
	}

	@Override
	public void logDeleteByReceiver(HashMap<String, Object> params) {
		logMapper.deleteLogByReceiver(params);
	}


	
	
}
