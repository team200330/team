package com.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.vo.Log;

@Mapper
public interface LogMapper {

	public List<Log> selectLogByProjectNo(int projectNo);
	
}
