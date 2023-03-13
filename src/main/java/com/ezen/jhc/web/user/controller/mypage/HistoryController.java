package com.ezen.jhc.web.user.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.service.mypage.HistoryService;

@Controller
public class HistoryController {

	@Autowired
	HistoryService historyService;
	
	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String mpHistory(HttpSession session, Model model) {
		if (session.getAttribute("member") == null) {
			return "user/common/loginPlease";
		}
		
		MemberDTO member = (MemberDTO) session.getAttribute("member"); 
		
		Integer mem_num = member.getMem_num();
		
		model.addAttribute("history", historyService.getOrderHistory(mem_num)); 
		
		
		return "user/mypage/purchase/history";
	}

	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String mpDetails() {

		return "user/mypage/purchase/details";
	}

	@RequestMapping(value = "/er", method = RequestMethod.GET)
	public String orderER() {

		return "user/mypage/purchase/exchange_refund";
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String orderCancel() {

		return "user/mypage/purchase/cancel";
	}
}
