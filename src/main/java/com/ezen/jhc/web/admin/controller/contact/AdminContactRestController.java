package com.ezen.jhc.web.admin.controller.contact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.jhc.web.admin.dto.contact.ContactDTO;
import com.ezen.jhc.web.admin.service.contact.AdminContactServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class AdminContactRestController {
	
	@Autowired
	AdminContactServiceImpl csService;
	
	@Autowired(required = false)
	ContactDTO csDTO;
	
	@PostMapping(value = "/admin/contact/reply/modify", consumes = "application/json")
	public ResponseEntity<String> modifyReply(@RequestBody ContactDTO csDTO) {
		
		log.info(csDTO.getContact_num());
		
		int result = csService.updateReply(csDTO.getContact_num(), csDTO.getAdmin_reply());
		
		log.info("result : " + result);
		
		ResponseEntity<String> rs = result == 1 ? new ResponseEntity<String>("success",HttpStatus.OK):new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		
		log.info(rs);
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
}
