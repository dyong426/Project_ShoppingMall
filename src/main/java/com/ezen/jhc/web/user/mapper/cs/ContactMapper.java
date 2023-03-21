package com.ezen.jhc.web.user.mapper.cs;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.user.dto.contact.AttachImageDTO;
import com.ezen.jhc.web.user.dto.contact.ContactDTO;

public interface ContactMapper {

	Integer insert_contact(ContactDTO contact);

	List<ContactDTO> getContactList(Integer mem_num);
	
	List<ContactDTO> getContactById(Integer contact_num);
	
	Integer insert_contact_img(AttachImageDTO img); 

	List<AttachImageDTO> getContactImgByContactNum(Integer contact_num);
}
