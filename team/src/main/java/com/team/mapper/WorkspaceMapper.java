package com.team.mapper;

import java.util.List;

import com.team.vo.Workspace;
import com.team.vo.WorkspaceMember;

public interface WorkspaceMapper {

	void insertWorkspace(Workspace workspace);
	
	List<WorkspaceMember> selectWorkspaceMembers(int workspaceNo);
	
}
