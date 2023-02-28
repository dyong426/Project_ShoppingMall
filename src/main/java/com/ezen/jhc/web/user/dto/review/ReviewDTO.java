package com.ezen.jhc.web.user.dto.review;

import java.util.Date;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ReviewDTO {
	
<<<<<<< HEAD
	// reviews
	Integer	review_num;
	Integer p_num;
	Integer mem_num;
	// 테이블 조인 : members
	String	mem_name;
	String	review_content;
	String	review_image_path;
	Integer	review_star;
	Date	review_regdate;
	
=======
	Integer review_num;
	ProdDTO prodDTO;
	MemberDTO memberDTO;
	String review_content;
	String review_image_path;
	Integer review_star;
	Date review_regdate;
	String mem_name;
	Integer p_num;
	String p_name;
>>>>>>> refs/heads/je
}
