package com.ezen.jhc.web.user.dto.review;

import java.util.Date;


import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data


public class ReviewDTO {

	Integer review_num;
	String review_content;
	String review_image_path;
	Integer review_star;
	Date review_regdate;
	String mem_name;
	Integer p_num;
	String p_name;


}
