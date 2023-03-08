package com.ezen.jhc.web.user.mapper.cs;

import java.util.List;

import com.ezen.jhc.web.user.dto.contact.ContactDTO;

public interface ContactMapper {

	List<ContactDTO> insert_contact(Integer mem_num, 
			Integer contact_ctgr, String contact_title,
			String contact_content, String contact_image_path,
			String contact_regdate);
	
	
	
}
