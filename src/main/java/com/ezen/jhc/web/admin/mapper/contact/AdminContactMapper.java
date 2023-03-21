package com.ezen.jhc.web.admin.mapper.contact;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.admin.dto.contact.ContactDTO;
import com.ezen.jhc.web.admin.dto.contact.ContactImageDTO;

public interface AdminContactMapper {
	
	public List<ContactDTO> getContactContents();
	
	public ContactDTO getContactContent(@Param("contact_num")Integer contact_num);
	
	public Integer updateReply(@Param("contact_num") Integer contact_num, @Param("admin_reply") String admin_reply);
	
	public Integer deleteReply(Integer contact_num);
	
	List<ContactDTO> csSearchName(@Param("mem_name")String mem_name);
	
	List<ContactDTO> csSearchNull(@Param("mem_name")String mem_name);
	
	List<ContactDTO> csSearchNotNull(@Param("mem_name")String mem_name);
	
	List<ContactImageDTO> contentImages(@Param("contact_num")Integer contact_num);
}