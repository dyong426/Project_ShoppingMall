package com.ezen.jhc.web.user.mapper.cs;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.user.dto.contact.AttachImageDTO;
import com.ezen.jhc.web.user.dto.contact.ContactDTO;

public interface ContactMapper {

	void insert_contact(@Param("mem_num") Integer mem_num,
			@Param("contact_ctgr") Integer contact_ctgr, @Param("contact_title") String contact_title,
			@Param("contact_content") String contact_content);

	List<ContactDTO> getContactList(Integer mem_num);
	
	List<ContactDTO> getContactById(Integer contact_num);
	
	String insert_contact_img(AttachImageDTO img); 

	
}
