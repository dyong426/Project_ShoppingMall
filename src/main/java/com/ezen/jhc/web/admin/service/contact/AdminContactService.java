package com.ezen.jhc.web.admin.service.contact;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.contact.ContactDTO;
import com.ezen.jhc.web.admin.dto.contact.ContactImageDTO;

@Service
public interface AdminContactService {
	
	List<ContactDTO> getContactContentList();
	
	ContactDTO getContactContent(Integer contact_num);
	
	Integer updateReply(Integer contact_num, String admin_reply);
	
	Integer deleteReply(Integer contact_num);
	
	List<ContactDTO> csSearchName(String mem_name);
	
	List<ContactDTO> csSearchNull(String mem_name);
	
	List<ContactDTO> csSearchNotNull(String mem_name);
	
	List<ContactImageDTO> contentImages(Integer contact_num);
}
