package com.team.service;

import java.util.HashMap;
import java.util.List;

import com.team.vo.Log;

public interface LogService {

	public List<Log> findLogByProjectNo(HashMap<String, Object> params);
	
}
