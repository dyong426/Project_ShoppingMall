package com.ezen.jhc.web.user.mapper.member;

import java.util.List;

import com.ezen.jhc.web.user.dto.member.MemberDTO;

public interface MemberMapper {
	
	public List<MemberDTO> getAll(); 
	
	public MemberDTO get(String mem_email);
	
	public Integer join(MemberDTO memberDTO);
}
