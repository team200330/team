package com.team.service;

import java.util.List;

import com.team.vo.Project;
import com.team.vo.Workspace;
import com.team.vo.WorkspaceMember;

public interface WorkspaceService {

	void insertWorkspace(Workspace workspace);

	List<WorkspaceMember> selectWorkspaceMembersByWorkspaceNo(int workspaceNo);

	List<Project> selectProjectByWorkspaceNo(int workspaceNo);

	Workspace selectWorkspaceByWorkspaceNo(int workspaceNo);

	void updateWorkspaceName(Workspace workspace);

	void deleteWorkspace(Workspace workspace);
}
