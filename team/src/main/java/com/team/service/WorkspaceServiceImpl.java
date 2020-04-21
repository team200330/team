package com.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.team.mapper.ProjectMapper;
import com.team.mapper.WorkspaceMapper;
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
	public List<WorkspaceMember> selectWorkspaceMembersByWorkspaceNo(int workspaceNo) {
		List<WorkspaceMember> workspaceMembers = workspaceMapper.selectWorkspaceMembers(workspaceNo);
		return workspaceMembers;
	}

	@Override
	public List<Project> selectProjectByWorkspaceNo(int workspaceNo) {
		List<Project> Projects = projectMapper.selectProjectByWorkspaceNo(workspaceNo);
		return Projects;
	}

	@Override
	public Workspace selectWorkspaceByWorkspaceNo(int workspaceNo) {
		return workspaceMapper.selectWorkspaceByWorkspaceNo(workspaceNo);
	}

	@Override
	public void updateWorkspaceName(Workspace workspace) {
		workspaceMapper.updateWorkspaceName(workspace);
		
	}

	@Override
	public void deleteWorkspace(Workspace workspace) {
		workspaceMapper.deleteWorkspace(workspace);
		
	}
	
}
