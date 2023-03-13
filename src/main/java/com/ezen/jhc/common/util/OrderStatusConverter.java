package com.ezen.jhc.common.util;

public class OrderStatusConverter {

	public OrderStatusConverter() {

	}

	public String orderStatusToKorean(int status) {
		String orderStatus = "";

		if (status == 0) {
			orderStatus = "입금 전";
		}

		if (status == 1) {
			orderStatus = "배송 준비 중";
		}

		if (status == 2) {
			orderStatus = "배송 중";
		}

		if (status == 3) {
			orderStatus = "배송 완료";
		}

		if (status == 4) {
			orderStatus = "주문 취소";
		}
		
		if (status == 5) {
			orderStatus = "교환";
		}

		if (status == 6) {
			orderStatus = "반품";
		}

		return orderStatus;

	}
}
