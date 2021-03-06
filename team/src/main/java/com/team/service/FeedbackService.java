package com.team.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.team.vo.Comments;
import com.team.vo.Feedback;
import com.team.vo.Member;
import com.team.vo.Project;

public interface FeedbackService {
	
	public void writeFeedback(Feedback feedback, String[] email);
	public void writeComment(Comments comment);
	
	public List<Feedback> searchFeedback(HashMap<String, Object> params);
	
	public int uncheckedFeedbackCount(HashMap<String, Object> params);
	public Date findLatestWritedate(HashMap<String, Object> params);
	
	public void deleteFeedback(HashMap<String, Object> params);
	public void checkFeedback(HashMap<String, Object> params);
	
	
	////////////////////////////////////////////////////
	
	public List<Member> findWorkspaceMembers(int workspaceNo);
	public List<Project> findTasksByWorkspaceNo(int workspaceNo);
}
