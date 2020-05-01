package com.team.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.vo.Comments;
import com.team.vo.Feedback;
import com.team.vo.FeedbackReceiver;

@Mapper
public interface FeedbackMapper {
	
	public int insertFeedback(Feedback feedback);
	public void insertFeedbackReceivers(List<FeedbackReceiver> receivers);
	public void insertComment(Comments comment);
	
	public List<Feedback> selectFeedback(HashMap<String, Object> params);
	public List<Comments> selectComments(int feedbackNo);
	public int countFeedback(HashMap<String, Object> params);
	public Date selectLatestWritedate(HashMap<String, Object> params);
	
	public int receivedFeedbackCount(String email);
	
	public void deleteFeedback(HashMap<String, Object> params);
	public void checkFeedback(HashMap<String, Object> params);
	
}
