package com.ezen.jhc.web.user.service.csService;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.contact.AttachImageListDTO;

@Service
public interface ContactService {

	
	Integer contactImgEnroll(AttachImageListDTO imgs);
}
