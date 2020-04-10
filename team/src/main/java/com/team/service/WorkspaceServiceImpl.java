package com.team.service;

import com.team.mapper.WorkspaceMapper;
import com.team.vo.Workspace;

import lombok.Setter;

public class WorkspaceServiceImpl implements WorkspaceService {

	@Setter
	private WorkspaceMapper workspaceMapper;

	@Override
	public void insertWorkspace(Workspace workspace) {
		workspaceMapper.insertWorkspace(workspace);
		
	}
	
}
