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

	// reviews
	Integer review_num;
	String review_content;
	String review_image_path;
	Integer review_star;
	Date review_regdate;
	Integer mem_num;
	String mem_name;
	Integer p_num;
	String p_name;
	

}
