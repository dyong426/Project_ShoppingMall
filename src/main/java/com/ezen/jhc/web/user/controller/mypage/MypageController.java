package com.ezen.jhc.web.user.controller.mypage;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jhc.common.util.Jwt;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.mapper.mypage.MyPageMapper;
import com.ezen.jhc.web.user.service.member.MemberService;


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
	MemberService memberService;
	
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String mpInfo(HttpSession session) {

		if (session.getAttribute("member") == null) {
			return "user/common/loginPlease";
		}
		return "user/mypage/personal_information/my_info";
	}

	@RequestMapping(value = "/writeable_reviews", method = RequestMethod.GET)
	public String mpWriteReviewCheck(HttpSession session) {
		if (session.getAttribute("member") == null) {
			return "user/common/loginPlease";
		}
		return "user/mypage/myreview/writeable_reviews";
	}

	@RequestMapping(value = "/watching_review", method = RequestMethod.GET)
	public String mpWatchReview(HttpSession session) {
		if (session.getAttribute("member") == null) {
			return "user/common/loginPlease";
		}
		return "user/mypage/myreview/wrote_review";
	}

	@RequestMapping(value = "/writing_review", method = RequestMethod.GET)
	public String mpWriteReview(HttpSession session, Model model) {

		if (session.getAttribute("member") == null) {
			return "user/common/loginPlease";
		}
		OrderDetailDTO od_dto = mm_mapper.getAll(7, 42, 41);
		model.addAttribute("review_pd", od_dto);

		return "user/mypage/myreview/writing_review";
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
	
	// 나의 정보 변경
	@PostMapping("/myInfo/change")
	public @ResponseBody String changeMyInfo(HttpSession session, @RequestParam("myInfo_birth")String myInfo_birth, @RequestParam("myInfo_phone")String myInfo_phone) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		System.out.println("멤버버노: "+ member.getMem_num());

		
		memberService.changeMyInfo(member.getMem_num(), myInfo_birth, myInfo_phone);
		
		return "success";
		
	}
	
	

	
	
	



}
