package com.team.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.team.mapper.FeedbackMapper;
import com.team.mapper.MemberMapper;
import com.team.mapper.ProjectMapper;
import com.team.mapper.TaskMapper;
import com.team.mapper.TimelineMapper;
import com.team.mapper.WorkspaceMapper;
import com.team.vo.Comments;
import com.team.vo.Feedback;
import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.TaskList;
import com.team.vo.FeedbackReceiver;
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
	
	@Autowired
	@Qualifier("timelineMapper")
	private TimelineMapper timelineMapper;
	
	@Autowired
	@Qualifier("projectMapper")
	private ProjectMapper projectMapper;
	
	@Autowired
	@Qualifier("taskMapper")
	private TaskMapper taskMapper;
	
	@Override
	public void writeFeedback(Feedback feedback, String[] email) {
		// insert feedback
		feedbackMapper.insertFeedback(feedback);
		int key = feedback.getFeedbackNo();
		
		// insert receivers
		List<FeedbackReceiver> receivers = new ArrayList<>();
		for (String s : email) receivers.add(new FeedbackReceiver(key, s));
		feedbackMapper.insertFeedbackReceivers(receivers);
	}
	
	@Override
	public void writeComment(Comments comment) {
		feedbackMapper.insertComment(comment);
	}

	@Override
	public List<Feedback> searchFeedback(HashMap<String, Object> params) {
		List<Feedback> feedbacks = feedbackMapper.selectFeedback(params);
		for (Feedback f : feedbacks) {
			List<FeedbackReceiver> rl = new ArrayList<>();
			
			for (FeedbackReceiver r : f.getReceivers()) { // 피드백 리시버 가져오기
				r.setMember(memberMapper.selectMemberByEmail(r.getEmail()));
				rl.add(r);
			}
			
			f.setReceivers(rl);
			f.setComments(feedbackMapper.selectComments(f.getFeedbackNo())); // 피드백 코멘트 가져오기
			f.setFeedbackSender(memberMapper.selectMemberByEmail(f.getSender())); // 피드백 보낸사람 가져오기
			if (f.getTaskNo() != null) f.setTask(taskMapper.selectTaskByTaskNo(f.getTaskNo()));
		}
		
		return feedbacks;
	}
	
	@Override
	public int uncheckedFeedbackCount(HashMap<String, Object> params) {
		return feedbackMapper.countFeedback(params);
	}
	
	@Override
	public Date findLatestWritedate(HashMap<String, Object> params) {
		return feedbackMapper.selectLatestWritedate(params);
	}
	
	@Override
	public void deleteFeedback(HashMap<String, Object> params) {
		feedbackMapper.deleteFeedback(params);
	}
	
	@Override
	public void checkFeedback(HashMap<String, Object> params) {
		feedbackMapper.checkFeedback(params);
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

	@Override
	public List<Project> findTasksByWorkspaceNo(int workspaceNo) {
		List<Project> projects = new ArrayList<>();
		HashMap<String, Object> params = new HashMap<>();
		params.put("searchType", "A");
		params.put("email", "none");
		
		for (Project p : projectMapper.selectProjectByWorkspaceNo(workspaceNo)) {
			params.put("projectNo", p.getProjectNo());
			p.setTaskLists(timelineMapper.searchTasks(params));
			projects.add(p);
		}
		return projects;
	}

	



	











	


	


	

}
