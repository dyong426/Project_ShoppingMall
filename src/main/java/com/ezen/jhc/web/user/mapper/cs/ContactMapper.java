package com.ezen.jhc.web.user.mapper.cs;

import com.ezen.jhc.web.user.dto.contact.ContactDTO;

public interface ContactMapper {

	ContactDTO insert_contact(Integer mem_num, 
			Integer contact_ctgr, String contact_title,
			String contact_content, String contact_image_path,
			String contact_regdate);
	
}
