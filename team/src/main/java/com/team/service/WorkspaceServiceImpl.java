package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.team.mapper.ProjectMapper;
import com.team.mapper.WorkspaceMapper;
import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.Workspace;
import com.team.vo.WorkspaceMember;

import lombok.Setter;

public class WorkspaceServiceImpl implements WorkspaceService {

	@Setter
	private WorkspaceMapper workspaceMapper;
	
	@Autowired
	@Qualifier("projectMapper")
	private ProjectMapper projectMapper;
	

	@Override
	public void insertWorkspace(Workspace workspace) {
		workspaceMapper.insertWorkspace(workspace);
		
	}

	@Override
	public List<Member> selectMembersByWorkspaceNo(WorkspaceMember workspaceMember) {
		List <Member> members = workspaceMapper.selectMembersByWorkspaceNo(workspaceMember);
		return members;
	}
	
	@Override
	public List<Project> selectProjectByWorkspaceNo(int workspaceNo) {
		List<Project> Projects = projectMapper.selectProjectByWorkspaceNo(workspaceNo);
		return Projects;
	}

	@Override
	public void updateWorkspaceName(Workspace workspace) {
		workspaceMapper.updateWorkspaceName(workspace);
		
	}

	@Override
	public void deleteWorkspace(Workspace workspace) {
		workspaceMapper.deleteWorkspace(workspace);
		
	}

	@Override
	public Member selectMemberTypeNo1ByWorkspaceNo(WorkspaceMember workspaceMember) {
		Member member1 = workspaceMapper.selectMemberTypeNo1ByWorkspaceNo(workspaceMember);
		return member1;
	}

	@Override
	public List<Member> WorkspaceMemberNameAndDepartmentSearch(Member member) {
		List <Member> members = workspaceMapper.WorkspaceMemberNameAndDepartmentSearch(member);
		return members;
	}

	@Override
	public void insertWorkspaceMember(WorkspaceMember workspaceMember) {
		workspaceMapper.insertWorkspaceMember(workspaceMember);
		
	}

	@Override
	public void updateWorkspace(Workspace workspace) {
		workspaceMapper.updateWorkspace(workspace);
		
	}	

	@Override
	public Workspace selectWorkspaceByWorkspaceNo(int workspaceNo) {
		return workspaceMapper.selectWorkspaceByWorkspaceNo(workspaceNo);
	}

	@Override
	public List<Workspace> selectWorkspacesByWorkspaceNo(int workspaceNo) {
		return workspaceMapper.selectWorkspacesByWorkspaceNo(workspaceNo);
	}
	
	@Override
	public WorkspaceMember selectWorkspaceByEmail(String email) {
		WorkspaceMember workspaceMember = workspaceMapper.selectWorkspaceByEmail(email);
		return workspaceMember;
	}

	@Override
	public List<Workspace> selectWorkspaceNameByEmail(String email) {
		return workspaceMapper.selectWorkspaceNameByEmail(email);
	}
	
	@Override
	public List<Workspace> selectWorkspacesByEmail(String email) {
		return workspaceMapper.selectWorkspacesByEmail(email);
	}

	@Override
	public void changeWorkspaceMemberType(WorkspaceMember workspaceMember) {
		workspaceMapper.changeWorkspaceMemberType(workspaceMember);
	}

	@Override
	public WorkspaceMember selectWorkspaceMemberTypeByWorkspaceMember(WorkspaceMember workspaceMember) {
		return workspaceMapper.selectWorkspaceMemberTypeByWorkspaceMember(workspaceMember);
	}

	@Override
	public void changeLoginuserType(WorkspaceMember workspaceMember) {
		workspaceMapper.changeLoginuserType(workspaceMember);
		
	}

	@Override
	public void deleteWorkspaceMemberType(WorkspaceMember workspaceMember) {
		workspaceMapper.deleteWorkspaceMemberType(workspaceMember);		
	}

}
