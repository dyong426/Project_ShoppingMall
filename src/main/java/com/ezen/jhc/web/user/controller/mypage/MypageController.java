package com.ezen.jhc.web.user.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.common.util.Jwt;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.mypage.MyPageMapper;
import com.ezen.jhc.web.user.service.mypage.WriteReviewService;


/**@author 김주희
 * @author SUJEONG
 * 
 * **/
@Controller
public class MypageController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	MyPageMapper mm_mapper;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	WriteReviewService wr_service;
	
	
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String mpInfo() {

		return "user/mypage/personal_information/my_info";
	}
	
	@RequestMapping(value ="/writeable_reviews", method = RequestMethod.GET)
	public String mpWriteReviewCheck(Integer mem_num, String ord_status, Model model) {
		
	List<OrderDetailDTO> rv_dto = mm_mapper.buyProds(mem_num, ord_status);
	model.addAttribute("rv_list", rv_dto);
		
		return "user/mypage/myreview/writeable_reviews";
	}
	
	@RequestMapping(value ="/writing_review", method = RequestMethod.GET)
	public String mpWriteReview(@RequestParam("p_num")Integer p_num, @RequestParam("pc_num")Integer pc_num, @RequestParam("ps_num")Integer ps_num, Model model) {
		
		List<OrderDetailDTO> od_dto = mm_mapper.getAll(p_num, pc_num, ps_num);
		model.addAttribute("review_pd", od_dto);
		System.out.println("내가 원하는 정보 : " + od_dto);
		
		return "user/mypage/myreview/writing_review";
	}
	
	@RequestMapping(value ="/wrote_review", method = RequestMethod.GET)
	public String mpWriteReview2(ReviewDTO rv_dto, HttpSession session) {
		
//		MemberDTO member = (MemberDTO)session.getAttribute("mem_num");
//		rv_dto.setMem_num(member.getMem_num());
//		
//		mm_mapper.add(rv_dto);

		return "user/mypage/myreview/wrote_review";
	}

	@RequestMapping(value ="/cancel", method = RequestMethod.GET)
	public String orderCancel() {
		
		return "user/mypage/purchase/cancel";
	}

	@GetMapping("/password/change")
	public String showPasswordChangeForm() {

		return "user/mypage/personal_information/passwordChangeForm";
	}

	@PostMapping("/password/change")
	public String processPasswordChange(HttpServletRequest request,
			HttpSession session) {
			
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String mem_email = member.getMem_email();
	
		String changePasswordLink = request.getRequestURL().toString().replace("change", "reset") + "?mem_email="
				+mem_email  + "&token=" + Jwt.generateToken((MemberDTO)session.getAttribute("member"));

	
		// 이메일 본문 생성
		String emailBody = "안녕하세요, juhee custom입니다. 다음 링크를 클릭하여 비밀번호를 변경하세요: " + changePasswordLink;
		
		
		// 이메일 전송
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setTo(mem_email);
	    mailMessage.setSubject("[juhee custom] 비밀번호 변경 링크");
	    mailMessage.setText(emailBody);
	    mailSender.send(mailMessage);
	

    return "user/mypage/personal_information/mail";
	}
	
	// 메일 전송 완료 메세지
	@GetMapping("/password/mail")
	public String mailSent() {
		
		
		return "user/mypage/personal_information/mail";
		
		
	}
	
	
	// 비밀번호 변경 폼
	@GetMapping("/password/reset")
	public String showResetPasswordFrom(HttpSession session, Model model, @RequestParam("token")String token, @RequestParam("mem_email")String mem_email) {
		if(!Jwt.verifyToken(token, mem_email)) {
			
			// jsp 출력용
			model.addAttribute("mem_email", mem_email);
			
			return "user/mypage/personal_information/passwordChangeForm";
		}
		
		model.addAttribute("mem_email", mem_email);	
		return "user/mypage/personal_information/passwordChangeForm";
	}
	

}
