package com.team.service;

import java.util.List;

import com.team.vo.Feedback;
import com.team.vo.Member;
import com.team.vo.Receiver;
import com.team.vo.WorkspaceMember;

public interface FeedbackService {
	
	public void writeFeedback(Feedback feedback, String[] email);

	////////////////////////////////////////////////////
	
	public List<Member> findWorkspaceMembers(int workspaceNo);
}
