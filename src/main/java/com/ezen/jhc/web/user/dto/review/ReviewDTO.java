package com.ezen.jhc.web.user.dto.review;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
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
	Integer mem_num;
	String mem_name;

	Integer p_num;
	String p_name;
	String sm_img_path;

	
	

	public String getUser_name() {
		String user_name = mem_name.replace(mem_name.charAt(1), '*');

		 if (mem_name.length() > 4) {
			user_name = user_name.replace(mem_name.charAt(2), '*');
		}
		return user_name;
	}
	
}
