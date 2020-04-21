package com.team.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.vo.Comments;
import com.team.vo.Feedback;
import com.team.vo.Receiver;

@Mapper
public interface FeedbackMapper {
	
	public int insertFeedback(Feedback feedback);
	public void insertReceivers(List<Receiver> receivers);
	public void insertComment(Comments comment);
	
	public List<Feedback> selectFeedback(HashMap<String, Object> params);
	public List<Comments> selectComments(int feedbackNo);
	
	public int receivedFeedbackCount(String email);
	
	public void deleteFeedback(int feedbackNo);
	
}
