package com.ezen.jhc.web.user.dto.contact;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ContactDTO {

	// 테이블 : contact
	Integer contact_num;
	Integer mem_num;
	Integer contact_ctgr;
	String contact_title;
	String contact_content;
	String contact_image_path;
<<<<<<< HEAD
	Date contact_regdate;
	
	// 테이블 조인 : members
	String mem_email;
	String mem_name;

=======
	String contact_regdate;
>>>>>>> refs/heads/je
	String admin_reply;
}
