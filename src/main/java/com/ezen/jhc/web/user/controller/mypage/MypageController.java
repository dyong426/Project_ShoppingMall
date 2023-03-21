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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jhc.common.util.Jwt;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.dto.review.ReviewImageDTO;
import com.ezen.jhc.web.user.mapper.mypage.MyPageMapper;
import com.ezen.jhc.web.user.service.member.MemberService;
import com.ezen.jhc.web.user.service.mypage.HistoryService;
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
	MemberService memberService;
	
	@Autowired
	JavaMailSender mailSender;

	@Autowired
	WriteReviewService wr_service;
	
	@Autowired
	HistoryService historyService;
	
	// 리뷰 쓸 수 있는 페이지
	@RequestMapping(value ="/review/write", method = RequestMethod.GET)
	public String mpWriteReviewCheck(Integer page, HttpSession session, Model model) {
		if (session.getAttribute("member") == null) {
			return "user/common/loginPlease";
		}
		

		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		Integer mem_num = member.getMem_num();
		
		List<OrderDetailDTO> pd_info = mm_mapper.buyProds(mem_num);
		
		
		int list_end = Integer.parseInt(page + "") * 10 - 1;
		
		int list_begin = list_end - 9;
		
		model.addAttribute("end", list_end);
		
		if (list_end >= pd_info.size()) {
			 list_end = pd_info.size() - 1;
		}
		model.addAttribute("pd_info", pd_info);
		model.addAttribute("pd_count", pd_info.size());
		
		model.addAttribute("start", list_begin);
		
		return "user/mypage/myreview/writeable_reviews";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String mpInfo(HttpSession session) {

		if (session.getAttribute("member") == null) {
			return "user/common/loginPlease";
		}
		return "user/mypage/personal_information/my_info";
	}

	
	
	
	// 리뷰 작성 페이지 정보 값
	@RequestMapping(value ="/review/check", method = RequestMethod.GET)
	public String mpWriteReview(
			@RequestParam("p_num")Integer p_num, @RequestParam("pc_num")Integer pc_num, @RequestParam("ps_num")Integer ps_num, 
			@RequestParam("od_num")Integer od_num, Model model, HttpSession session) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		Integer mem_num = member.getMem_num();
		
		List<OrderDetailDTO> od_dto = mm_mapper.mpGetAllReview(p_num, pc_num, ps_num, od_num);


		model.addAttribute("review_pd", od_dto);
		
		return "user/mypage/myreview/writing_review";
	}
	
	
	// 리뷰 추가
	@RequestMapping(value ="/review/add", method = RequestMethod.POST)
	public String mpWriting(
			@RequestParam("p_num")Integer p_num, @RequestParam("review_content")String review_content, 
			@RequestParam("review_image_path")String review_image_path, @RequestParam("review_star")Integer review_star, 
			@RequestParam("od_num")Integer od_num, Model model, @RequestParam("page")Integer page, HttpSession session, ReviewImageDTO ro) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		Integer mem_num = member.getMem_num();
		
		
		mm_mapper.addReview(p_num, mem_num, review_content, review_image_path, review_star, od_num);
		
		
		//mm_mapper.addReviewImage(ro);
		
		
		List<OrderDetailDTO> rv_history = mm_mapper.getOrderHistory(mem_num);
		int list_end = Integer.parseInt(page + "") * 10 - 1;
		
		int list_begin = list_end - 9;

		model.addAttribute("end", list_end);
		
		if (list_end >= rv_history.size()) {
			 list_end = rv_history.size() - 1;
		}
		model.addAttribute("rh_count", rv_history.size());
		
		model.addAttribute("start", list_begin);
		model.addAttribute("rv_history", rv_history);
		
		
		
		return "user/mypage/myreview/wrote_review";
	}
	 
	
	// 작성된 리뷰 리스트
	@RequestMapping(value ="/review/list", method = RequestMethod.GET)
	public String mpWriteReview2(HttpSession session, Model model, @RequestParam("page")Integer page) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		Integer mem_num = member.getMem_num();
		
		List<OrderDetailDTO> rv_history = mm_mapper.getOrderHistory(mem_num);
		
		model.addAttribute("rv_history", rv_history);
		int list_end = Integer.parseInt(page + "") * 10 - 1;
		
		int list_begin = list_end - 9;

		model.addAttribute("end", list_end);
		
		if (list_end >= rv_history.size()) {
			 list_end = rv_history.size() - 1;
		}
		model.addAttribute("rh_count", rv_history.size());
		
		model.addAttribute("start", list_begin);
		
		return "user/mypage/myreview/wrote_review";
	}


	
	
//	@RequestMapping(value ="/review/test", method = RequestMethod.POST)
//	public void imageEnrollTest() {
//		
//		ReviewImageDTO ro = new ReviewImageDTO();
//		
//		ro.setReview_num(20);
//		ro.setReview_filename("test");
//		ro.setReview_origin_img_path("test");
//		ro.setReview_thumb_img_path("test");
//		ro.setReview_lg_img_path("test");
//		ro.setReview_uploadpath("test");
//		ro.setReview_uuid("test");
//		
//		
//		mm_mapper.addReviewImage(ro);
//		
//	}

	/*여기부터 끝까지 작성자 정수정*/

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
		

		
		memberService.changeMyInfo(member.getMem_num(), myInfo_birth, myInfo_phone);
		
		return "success";
		
	}
}
