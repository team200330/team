package com.team.service;

import java.util.List;

import com.team.vo.Member;
import com.team.vo.Project;
import com.team.vo.Workspace;

public interface WorkspaceService {

	void insertWorkspace(Workspace workspace);

	List<Member> selectMembersByWorkspaceNo(int workspaceNo);
	
	List<Project> selectProjectByWorkspaceNo(int workspaceNo);

	Workspace selectWorkspaceByWorkspaceNo(int workspaceNo);

	void updateWorkspaceName(Workspace workspace);

	void deleteWorkspace(Workspace workspace);

	Member selectMemberTypeNo1ByWorkspaceNo(int workspaceNo);

	List<Member> WorkspaceMemberNameAndDepartmentSearch(Member member);
}
