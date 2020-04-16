package com.team.service;

import java.util.List;

import com.team.vo.Feedback;
import com.team.vo.WorkspaceMember;

public interface FeedbackService {
	
	public void writeFeedback(Feedback feedback);
	
	////////////////////////////////////////////////////
	
	public List<WorkspaceMember> findWorkspaceMembers(int workspaceNo);
}
