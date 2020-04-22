package com.team.service;

import java.util.HashMap;
import java.util.List;

import com.team.vo.Comments;
import com.team.vo.Feedback;
import com.team.vo.Member;

public interface FeedbackService {
	
	public void writeFeedback(Feedback feedback, String[] email);
	public void writeComment(Comments comment);
	
	public List<Feedback> searchFeedback(HashMap<String, Object> params);
	
	public void deleteFeedback(int feedbackNo);
	
	
	////////////////////////////////////////////////////
	
	public List<Member> findWorkspaceMembers(int workspaceNo);
}
