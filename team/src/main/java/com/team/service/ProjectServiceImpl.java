package com.team.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.team.mapper.MemberMapper;
import com.team.mapper.ProjectMapper;
import com.team.mapper.TaskMapper;
import com.team.mapper.WorkspaceMapper;
import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.ProjectMember;
import com.team.vo.TaskList;
import com.team.vo.WorkspaceMember;

import lombok.Setter;

public class ProjectServiceImpl implements ProjectService {

	@Setter
	private ProjectMapper projectMapper;
	
	@Autowired
	@Qualifier("workspaceMapper")
	private WorkspaceMapper workspaceMapper;
	
	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;
	
	@Autowired
	@Qualifier("taskMapper")
	private TaskMapper taskMapper;
	
	@Override
	public void writeProject (Project project , String[] email) {
		
		projectMapper.insertProject(project);
		int key = project.getProjectNo();
		
		List<ProjectMember> projectMember = new ArrayList<>();
		for (String s : email) projectMember.add(new ProjectMember(key, s));
		projectMapper.insertProjectMember(projectMember);
	}

	@Override
	public List<Project> findProject(HashMap<String, Object> params) {
		
		return projectMapper.selectProject(params);
	}

	@Override
	public List<Project> findProject2(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return projectMapper.selectProject2(params);
	}
	
	@Override
	public void updateProjectNo(Map<String, String> arrMap) {

		projectMapper.updateProjectNo(arrMap);
		
	}

	@Override
	public List<Project> findPageing(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return projectMapper.selectPageing(params);
	}

	@Override
	public int projectListCount(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return projectMapper.selectProjectListCount(params);
	}

	@Override
	public Project searchProjectByNo(int projectNo) {
		// TODO Auto-generated method stub
		return projectMapper.selectProjectByNo(projectNo);
	}

	@Override
	public Project selectDetail(int projectNo) {
		// TODO Auto-generated method stub
		return projectMapper.selectDetail(projectNo);
	}

	@Override
	public void updateProject(Project project) {
		projectMapper.updateProject(project);
	}

	@Override
	public List<Member> loginuserProjectMember(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return projectMapper.selectLoginuserProjectMember(params);
	}

	@Override
	public List<Member> findWorkspaceMembers(int workspaceNo) {
		List<WorkspaceMember> workspaceMembers = workspaceMapper.selectWorkspaceMembers(workspaceNo);
		List<Member> members = new ArrayList<>();
			
		for (WorkspaceMember m : workspaceMembers) 
			members.add(memberMapper.selectMemberByEmail(m.getEmail()));
		
			
		return members;
	}

	@Override
	public void insertProjectMember(ProjectMember projectMember) {
		// TODO Auto-generated method stub
		
	}

	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////
	
	@Override
	public List<Project> findProjectAndTasklist(int workspaceNo) {
		List<Project> projects = projectMapper.selectProjectByWorkspaceNo(workspaceNo);
		
		// tasklist project번호로 가져오기 기능 생겨야 할수있음
		for(Project p : projects) {
			
		}
		
		return projects;
	}






	
	
	
}
