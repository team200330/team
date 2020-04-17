package com.team.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.team.mapper.FeedbackMapper;
import com.team.mapper.MemberMapper;
import com.team.mapper.WorkspaceMapper;
import com.team.vo.Feedback;
import com.team.vo.Member;
import com.team.vo.WorkspaceMember;

@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService {

	@Autowired
	@Qualifier("feedbackMapper")
	private FeedbackMapper feedbackMapper;
	
	@Autowired
	@Qualifier("workspaceMapper")
	private WorkspaceMapper workspaceMapper;
	
	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public void writeFeedback(Feedback feedback) {
		// TODO Auto-generated method stub

	}

	
	////////////////////////////////////////////////////////////
	
	
	@Override
	public List<Member> findWorkspaceMembers(int workspaceNo) {
		List<WorkspaceMember> workspaceMembers = workspaceMapper.selectWorkspaceMembers(workspaceNo);
		List<Member> members = new ArrayList<>();
			
		for (WorkspaceMember m : workspaceMembers) 
			members.add(memberMapper.selectMemberByEmail(m.getEmail()));
		
			
		return members;
	}

}
