package com.ezen.jhc.web.admin.mapper.contact;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.admin.dto.contact.ContactDTO;

public interface AdminContactMapper {
	
	public List<ContactDTO> getContactContents();
	
	public ContactDTO getContactContent(Integer contact_num);
	
	public Integer updateReply(@Param("contact_num") Integer contact_num, @Param("admin_reply") String admin_reply);
	
	public Integer deleteReply(Integer contact_num);
}
