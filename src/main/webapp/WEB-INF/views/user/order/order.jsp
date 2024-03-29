<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../common/header.jsp"%>

<link rel="stylesheet"
	href="${contextPath}/assets/user/order/css/order.css" />

<title>juhee custom - 주문서 작성</title>

<c:set value="${sessionScope.member}" var="member" />

<div class="basket_top">
	<span id="my_basket">주문서 작성</span>
	<div class="basket_process">
		<span class="other">장바구니</span> <span class="other">&gt;</span> <span>주문서작성</span>
		<span class="other">&gt;</span> <span class="other">주문완료</span>
	</div>
</div>

<div id="outer">
	<div id="leftOuter">
		<div class="box">
			<div class="subTitle">주문자 정보</div>
			<div id="ordererInformation" class="rowGrid">
				<div class="columnGrid">
					<div>이름</div>
					<input type="text" class="emptyCheck" id="ordererName" value="${member.mem_name}"
						name="ordererName" placeholder="이름을 입력해주세요."/>
				</div>
				<div class="columnGrid">
					<div>연락처</div>
					<input type="tel" class="emptyCheck" id="ordererPhone" value="${member.phoneWithOnlyNum}"
						name="ordererPhone" placeholder="- 없이 00000000000"
						pattern="0[0-9]{10}" />
				</div>
				<div class="columnGrid">
					<div>이메일</div>
					<input type="text" class="emptyCheck" id="ordererEmail" value="${member.mem_email}"
						name="ordererEmail" placeholder="이메일을 입력해주세요." />
				</div>
			</div>
		</div>

		<div class="box">
			<div class="columnGrid">
				<div class="subTitle">배송지 정보</div>
				<div id="checkBoxGrid">
					<input type="checkbox" id="sameWithOrderer"/>
					<label for="sameWithOrderer">주문자와 동일</label>
					<input type="checkbox" id="saveDestination" name="addr_save" form="orderCompleted"/>
					<label for="saveDestination">배송지 저장</label>
				</div>
			</div>
			<div id="shipping" class="rowGrid">
				<div class="columnGrid">
					<div>수취인</div>
					<input type="text" class="emptyCheck" name="receiver_name" id="recipient"
						placeholder="이름을 입력해주세요." form="orderCompleted"/>
				</div>
				<div class="columnGrid">
					<div>연락처</div>
					<input type="text" class="emptyCheck" pattern="01[012679][0-9]{7,8}" name="receiver_phone" id="recipientPhone"
						placeholder="- 없이 00000000000" form="orderCompleted"/>
				</div>
				<div id="destination" class="columnGrid">
					<div>배송지</div>
					<div>
						<input type="text" class="emptyCheck" name="ord_zipCode" id="zipCode"
							placeholder="우편번호" readonly form="orderCompleted"/>
						<button onclick="searchPostNumber()" class="buttons">우편번호 검색</button>
					</div>
					<div>
						<input type="text" class="emptyCheck" name="ord_addr1" id="addr1" placeholder="주소"
							readonly form="orderCompleted"/>
						<input type="text" name="ord_addr2" id="addr2"
							placeholder="상세 주소를 입력해주세요." form="orderCompleted"/>
					</div>
				</div>
			</div>
		</div>

		<div class="box">
			<div class="subTitle">포인트 사용</div>
			<div class="rowGrid">
				<div id="point" class="columnGrid">
					<div>포인트</div>
					<div class="flex-between">
						<input type="number" form="orderCompleted" id="pointInput" name="mem_point"
							placeholder="0" min="0"/>
						<button id="useAllPoint" class="buttons">전액 사용</button>
					</div>
					<div>
						보유 포인트 : <span id="pointSpan">${member.mem_point}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="box">
			<div class="subTitle">주문 요청사항</div>
			<div class="rowGrid">
				<textarea rows="5" placeholder="요청사항을 입력해주세요." name="ord_request"
					id="ord_request" form="orderCompleted"></textarea>
			</div>
		</div>

		<div class="box">
			<div class="subTitle">총 결제 금액</div>
			<div id="summary" class="rowGrid">
				<div class="columnGrid">
					<div>총 수량</div>
					<div class="rightAlign">
						<b id="total_quantity">${totalQuantity}개</b>
					</div>
				</div>
				<div class="columnGrid">
					<div>총 상품 금액</div>
					<div class="rightAlign">
						<b id="total_amount" data-totalPrice="${totalPrice}">${totalPrice}</b>
					</div>
				</div>
				<div class="columnGrid">
					<div>배송비</div>
					<div class="rightAlign">
						<b id="shipping_price">3000원</b>
					</div>
				</div>
				<div class="columnGrid">
					<div>포인트 할인</div>
					<div class="rightAlign">
						<b id="discount">0원</b>
					</div>
				</div>
				<div id="total" class="columnGrid">
					<div class="subTitle">총 결제 금액</div>
					<div class="rightAlign">
						<h5>
							<b id="total_price"></b>
						</h5>
					</div>
				</div>
			</div>
		</div>

		<div class="box">
			<div class="subTitle">결제 방식</div>
			<div class="rowGrid">
				<div id="payment" data-orderid="${orderId}">
					<%-- 결제 API 넣어야함 --%>
					<input type="submit" id="" class="payButtons" value="무통장 입금" form="orderCompleted" />
					<input type="submit" id="samsungPay" class="payButtons" value="삼성 페이" form="orderCompleted" />
					<input type="submit" id="naverPay" class="payButtons" value="네이버 페이" form="orderCompleted" />
					<input type="submit" id="tossPay" class="payButtons" value="토스 페이" form="orderCompleted" />
				</div>
			</div>
		</div>
	</div>

	<div id="rightOuter">
		<div class="box">
			<div class="columnGrid">
				<div class="subTitle">주문 정보</div>
				<div class="rightAlign" id="total_price2"></div>
			</div>
			<hr />
			<c:set value="true" var="forBreak"></c:set>
			<c:forEach items="${carts}" var="cart" varStatus="cartStatus"
				begin="0">
				<c:if test="${forBreak}">
					<c:choose>
						<c:when test="${cartStatus.index < 5}">
							<div class="orderList">
								<div class="rowSpan">
									<img class="cstmImg" src="<%=request.getContextPath() %>/display/image?fileName=${cart.mem_cstm_path}"
										alt="주문 상품 이미지" />
								</div>
								<div class="orderProd">
									<div>
										<b class="p_name">${cart.p_name}</b>
									</div>
									<div>
										색상&emsp;&emsp;:&emsp;<span class="pc_name">${cart.pc_name}</span>
									</div>
									<div>
										사이즈&emsp;:&emsp;<span>${cart.ps_name}</span>
									</div>
									<div>
										수량&emsp;&emsp;:&emsp;<span>${cart.cart_quantity}</span>
									</div>
									<div>
										가격&emsp;&emsp;:&emsp;<span class="p_price">${cart.cart_quantity * cart.p_price}</span>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div id="tooMuch">외 ${fn:length(carts) - cartStatus.index}개</div>
							<c:set value="false" var="forBreak"></c:set>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>

<form action="<%=request.getContextPath()%>/order/completed" method="POST" id="orderCompleted">
	<input type="hidden" name="total_amount" id="total_amount_input"/>
	<input type="hidden" name="payment_num" id="payment_num"/>
	<input type="hidden" name="cart_num" id="cart_num" value="${cart_num}"/>
</form>

<script>
	const mem_name = '${member.mem_name}';
	const memberAddress = {
		mem_zipcode : '${memberAddress.mem_zipcode}',
		mem_addr1 : '${memberAddress.mem_addr1}',
		mem_addr2 : '${memberAddress.mem_addr2}',
		addr_save : '${memberAddress.addr_save}',
	};
</script>


<%-- 토스 페이 API 참조 스크립트 --%>
<script src="https://js.tosspayments.com/v1/payment"></script>

<%-- 다음 주소 API 참조 스크립트 --%>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%-- 네이버페이 API 참조 스크립트 --%>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

<script	src="<%=request.getContextPath()%>/assets/user/order/js/order.js"></script>


<%@ include file="../common/footer.jsp"%>
