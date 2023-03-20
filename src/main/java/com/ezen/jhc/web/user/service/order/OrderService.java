package com.ezen.jhc.web.user.service.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;

public interface OrderService {

	public MemberDTO getMemberByNum(int mem_num);
	
	public MemberAddressDTO getAddressByNum(int mem_num);
	
	public void updateAddr(HttpSession session, HttpServletRequest req);
}
