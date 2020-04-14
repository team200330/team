package com.team.service;

import com.team.vo.Member;

public interface MemberService {

	void registerMember(Member member);

	Member findMemberByEmailAndPassword(Member member);


}
