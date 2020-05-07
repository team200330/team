package com.team.service;

import com.team.common.Util;
import com.team.mapper.MemberMapper;
import com.team.vo.Member;

import lombok.Setter;

public class MemberServiceImpl implements MemberService {
	
	@Setter
	private MemberMapper memberMapper;

	@Override
	public void registerMember(Member member) {

		String plainPassword = member.getPassword();
		String hashedPassword = Util.getHashedString(plainPassword, "SHA-256");
		member.setPassword(hashedPassword);
		
		memberMapper.insertMember(member);
		
		
	}

	@Override
	public Member findMemberByEmailAndPassword(Member member) {
		
		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		
		Member member2 = memberMapper.selectMemberByEmailAndPassword(member);
		return member2;
	}

	@Override
	public Member findMemberByEmail(String email) {
		return memberMapper.selectMemberByEmail(email);
	}

	@Override
	public void updatePassword(Member member) {
		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		memberMapper.updatePassword(member);
	}

	@Override
	public void updateImg(Member member) {
		memberMapper.updateImg(member);
	}

	@Override
	public void updateMember(Member member) {
		memberMapper.updateMember(member);
	}

	

}
