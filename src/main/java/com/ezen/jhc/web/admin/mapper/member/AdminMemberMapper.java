package com.ezen.jhc.web.admin.mapper.member;

import java.util.List;

import com.ezen.jhc.web.admin.dto.member.MemberDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;

public interface AdminMemberMapper {
	
	public List<MemberDTO> getMembers();
	
	public MemberDTO getMember(Integer mem_num);
	
	Integer deleteMember(Integer mem_num);
	
}
