package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.team.mapper.FeedbackMapper;
import com.team.mapper.WorkspaceMapper;
import com.team.vo.Feedback;
import com.team.vo.WorkspaceMember;

@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService {

	@Autowired
	@Qualifier("feedbackMapper")
	private FeedbackMapper feedbackMapper;
	
	@Autowired
	@Qualifier("workspaceMapper")
	private WorkspaceMapper workspaceMapper;
	
	@Override
	public void writeFeedback(Feedback feedback) {
		// TODO Auto-generated method stub

	}

	
	////////////////////////////////////////////////////////////
	
	
	@Override
	public List<WorkspaceMember> findWorkspaceMembers(int workspaceNo) {
		return workspaceMapper.selectWorkspaceMembers(workspaceNo);
	}

}
