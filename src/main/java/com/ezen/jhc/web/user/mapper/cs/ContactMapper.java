package com.ezen.jhc.web.user.mapper.cs;


public interface ContactMapper {

	public int insert_contact(Integer mem_num, 
			Integer contact_ctgr, String contact_title,
			String contact_content, String contact_image_path,
			String contact_regdate);
	
	
	
}
