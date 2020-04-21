package com.team.mapper;

import java.util.List;

import com.team.vo.Member;
import com.team.vo.Workspace;
import com.team.vo.WorkspaceMember;

public interface WorkspaceMapper {

	void insertWorkspace(Workspace workspace);
	
	List<WorkspaceMember> selectWorkspaceMembers(int workspaceNo);

	Workspace selectWorkspaceByWorkspaceNo(int workspaceNo);

	void updateWorkspaceName(Workspace workspace);

	void deleteWorkspace(Workspace workspace);

	List<Member> selectMembersByWorkspaceNo(int workspaceNo);

	Member selectMemberTypeNo1ByWorkspaceNo(int workspaceNo);

	List<Member> WorkspaceMemberNameAndDepartmentSearch(Member member);
	
}
