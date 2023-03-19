package com.ezen.jhc.web.admin.dto.home;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class NewMemberCountDTO {
	
	Integer monthly;
	Integer yesterday;
	
	public Integer getMonthly() {
		
		if (this.monthly == null) return 0;
		
		return this.monthly;
	}
	
	public Integer getYesterday() {
		if (this.yesterday == null) return 0;
		
		return this.yesterday;
	}
}
