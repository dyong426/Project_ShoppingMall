package com.ezen.jhc.web.admin.service.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.member.MemberDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.admin.dto.order.OrderListDTO;

@Service
public interface AdminMemberService {
	
	List<MemberDTO> getMemberList();
	
	List<MemberDTO> getMemberByName(String mem_name);
	
	MemberDTO getMemberInfo(Integer mem_num);
	
	List<OrderListDTO> getMemberRecentOrderList(Integer mem_num);
	
	Integer deleteMember(Integer mem_num);
}
