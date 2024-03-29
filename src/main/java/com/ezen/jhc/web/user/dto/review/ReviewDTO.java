package com.ezen.jhc.web.user.dto.review;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	String sm_img_path;
	String origin_img_path;
	
	String rev_only_date;
	String star;
	String user_name;
	

	public String getStar () {
		if (review_star == 0) {
			return "☆☆☆☆☆";
		} else if (review_star == 1) {
			return "★☆☆☆☆";
		} else if (review_star == 2) {
			return "★★☆☆☆";
		} else if (review_star == 3) {
			return "★★★☆☆";
		} else if (review_star == 4) {
			return "★★★★☆";
		} else if (review_star == 5) {
			return "★★★★★";
		}
	
		return "";
	}

	public String getUser_name() {
		String user_name = mem_name.replace(mem_name.charAt(1), '*');

		 if (mem_name.length() > 4) {
			user_name = user_name.replace(mem_name.charAt(2), '*');
		}
		return user_name;
	}


	public Date getReview_regdate() {
		
		if (this.review_regdate == null) return null;
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String formatTime = dayTime.format(this.review_regdate);
		Date date = null;
		try {
			 date = dayTime.parse(formatTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public String getRev_only_date() {
		
		if (this.review_regdate == null) return null;
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String formatTime = dayTime.format(this.review_regdate);
		return formatTime;
	}

}
