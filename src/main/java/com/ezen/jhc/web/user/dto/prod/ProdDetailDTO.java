package com.ezen.jhc.web.user.dto.prod;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ProdDetailDTO {

	Integer pd_num;
	ProdDTO prodDTO;
	ProdColorDTO pcDTO;
	ProdSizeDTO psDTO;
	ProdImageDTO piDTO;
	Integer pd_stock;
	
}
