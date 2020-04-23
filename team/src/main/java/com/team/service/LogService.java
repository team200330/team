package com.team.service;

import java.util.List;

import com.team.vo.Log;

public interface LogService {

	public List<Log> findLogByProjectNo(int projectNo);
	
}
