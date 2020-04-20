package com.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.vo.Feedback;
import com.team.vo.Receiver;

@Mapper
public interface FeedbackMapper {
	
	public int insertFeedback(Feedback feedback);
	public void insertReceivers(List<Receiver> receivers);
	
}
