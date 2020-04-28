package com.team.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.team.mapper.LogMapper;
import com.team.mapper.ProjectMapper;
import com.team.mapper.TaskMapper;
import com.team.service.LogService;
import com.team.vo.Log;
import com.team.vo.LogReceiver;
import com.team.vo.Project;
import com.team.vo.ProjectMember;

@Service("logService")
public class LogServiceImpl implements LogService {
	
	@Autowired
	@Qualifier("logMapper")
	private LogMapper logMapper;
	
	@Autowired
	@Qualifier("projectMapper")
	private ProjectMapper projectMapper;
	
	@Autowired
	@Qualifier("taskMapper")
	private TaskMapper taskMapper;

	@Override
	public void writeLog(Log log) {
		logMapper.insertLog(log);

		// 같은 프로젝트 멤버에게 로그 전송
		for (ProjectMember member : projectMapper.selectMemberByProjectNo(log.getProjectNo())) 
			logMapper.insertLogReceiver(new LogReceiver(log.getLogNo(), member.getEmail()));
		
	}
	
	@Override
	public List<Log> findLogByProjectNo(HashMap<String, Object> params) {
		List<Log> logs = new ArrayList<>();
		
		for (Log log : logMapper.selectLogByProjectNo(params)) {
			log.setTask(taskMapper.selectTaskByTaskNo(log.getTaskNo()));
			logs.add(log);
		}
		
		return logs;
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
