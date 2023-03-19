package com.ezen.jhc.web.user.dto.review;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ReviewImageDTO {
	
	Integer review_num;
	String review_origin_img_path;
	String review_thumb_img_path;
	String review_lg_img_path;
	String review_uploadpath;
	String review_uuid;
	String review_filename;
	

	/* 이미지 정보 */
	private List<ReviewImageDTO> imageList;
	
	public void setReview_origin_img_path(String review_uploadpath, String review_uuid, String review_filename) {
		this.review_origin_img_path = review_uploadpath + review_uuid + review_filename;
	}
	
	public void setReview_thumb_img_path(String review_uploadpath, String review_uuid, String review_filename) {
		this.review_thumb_img_path = review_uploadpath + "s_" + review_uuid + review_filename;
	}
	
	public void setReview_lg_img_path(String review_uploadpath, String review_uuid, String review_filename) {
		this.review_lg_img_path = review_uploadpath + "lg_" + review_uuid + review_filename;
	}

	


}
