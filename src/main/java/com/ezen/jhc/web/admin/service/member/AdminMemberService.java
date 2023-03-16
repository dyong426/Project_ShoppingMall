package com.ezen.jhc.web.admin.service.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.member.MemberDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.admin.dto.order.OrderListDTO;

@Service
public interface AdminMemberService {
	
	public List<MemberDTO> getMemberList();
	
	public MemberDTO getMemberInfo(Integer mem_num);
	
	public List<OrderListDTO> getMemberRecentOrderList(Integer mem_num);
}
