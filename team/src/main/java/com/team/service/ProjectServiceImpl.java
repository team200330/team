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
	public void writeProject (Project project , String[] email ) {
		projectMapper.insertProject(project);
		
		int projectNo = project.getProjectNo();
		for(String s : email) {
			ProjectMember m = new ProjectMember(projectNo, s);
			projectMapper.insertProjectMember(m);
		}
	}


	@Override
	public List<Project> findProject(HashMap<String, Object> params) {
		return projectMapper.selectProject(params);
	}

	@Override
	public List<Project> findProject2(HashMap<String, Object> params) {
		return projectMapper.selectProject2(params);
	}
	
	@Override
	public void updateProjectNo(Map<String, String> arrMap) {
		projectMapper.updateProjectNo(arrMap);
		
	}
	

	@Override
	public void updateProjectDeleted(Map<String, Object> arrMap) {
		projectMapper.updateProjectDeleted(arrMap);
		
	}

	@Override
	public List<Project> findPageing(HashMap<String, Object> params) {
		return projectMapper.selectPageing(params);
	}

	@Override
	public int projectListCount(HashMap<String, Object> params) {
		return projectMapper.selectProjectListCount(params);
	}

	@Override
	public Project searchProjectByNo(int projectNo) {
		return projectMapper.selectProjectByNo(projectNo);
	}

	@Override
	public Project selectDetail(int projectNo) {
		Project p = projectMapper.selectDetail(projectNo);
		
		List<Member> m = new ArrayList<>();
		
		for (ProjectMember pm : p.getProjectMembers()) {
			m.add(memberMapper.selectMemberByEmail(pm.getEmail()));
			}
		p.setMember(m);
	
		return p;
	}

	@Override
	public void updateProject(Project project) {
		projectMapper.updateProject(project);
	}

	@Override
	public List<Member> loginuserProjectMember(HashMap<String, Object> params) {
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
