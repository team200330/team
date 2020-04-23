package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.team.mapper.LogMapper;
import com.team.service.LogService;
import com.team.vo.Log;

@Service("logService")
public class LogServiceImpl implements LogService {
	
	@Autowired
	@Qualifier("logMapper")
	private LogMapper logMapper;

	@Override
	public List<Log> findLogByProjectNo(int projectNo) {
		return logMapper.selectLogByProjectNo(projectNo);
	}
	
	
}
