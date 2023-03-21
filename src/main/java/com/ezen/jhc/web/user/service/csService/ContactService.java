package com.ezen.jhc.web.user.service.csService;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.contact.AttachImageListDTO;
import com.ezen.jhc.web.user.dto.contact.ContactDTO;

@Service
public interface ContactService {

	
	Integer contactEnroll(ContactDTO contact, AttachImageListDTO images);
}
