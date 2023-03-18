package com.ezen.jhc.web.user.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.mapper.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public Integer checkMemByEmail(String mem_email) {
		
		
		return memberMapper.checkMem(mem_email);

		
	}

	@Override
	public MemberDTO getMemByEmail(String mem_email) {
		
		return memberMapper.getMember(mem_email);
	}

	@Override
	public void join(MemberDTO dto) {
		
		memberMapper.join(dto);
		
	}

	@Override
	public Integer checkEmailPW(String mem_email, String mem_pw) {
	
		return memberMapper.checkEmailPw(mem_email, mem_pw);
	}

	@Override
	public void changePw(String mem_pw, String mem_email) {
	
		memberMapper.changePassword(mem_pw, mem_email);
		
	}

	@Override
	public void deleteAccount(int mem_num) {
		memberMapper.deleteAccount(mem_num);
		
	}

	@Override
	public void changeMyInfo(int mem_num, String mem_birth, String mem_phone) {
		memberMapper.updateMyInfo(mem_num, mem_birth, mem_phone);
		
	}
	
	
	
	

}
