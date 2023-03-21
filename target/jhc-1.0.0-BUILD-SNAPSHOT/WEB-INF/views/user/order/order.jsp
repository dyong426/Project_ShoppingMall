<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>

<link rel="stylesheet" href="assets/user/order/css/order.css" />

<title>juhee custom - 주문서 작성</title>

<%--
	받아야 하는 정보
	
	 - 장바구니
	 - 상품 정보 (이미지, 제품명, 가격, 색상명, 사이즈명)
--%>

<c:set value="${sessionScope.member}" var="member" />
<c:set value="${sessionScope.memberAddress}" var="memberAddress" />

<div id="mainTitle">주문서 작성</div>

<div id="outer">

	<div id="leftOuter">
		<div class="box">
			<div class="subTitle">주문자 정보</div>
			<div id="ordererInformation" class="rowGrid">
				<div class="columnGrid">
					<div>이름</div>
					<input type="text" id="ordererName" value="${member.mem_name}" name="ordererName" placeholder="이름을 입력해주세요."/>
				</div>
				<div class="columnGrid">
					<div>연락처</div>
					<input type="tel" id="ordererPhone" value="${member.mem_phone}" name="ordererPhone" placeholder="- 없이 00000000000" pattern="0[0-9]{10}"/>
				</div>
				<div class="columnGrid">
					<div>이메일</div>
					<input type="text" id="ordererEmail" value="${member.mem_email}" name="ordererEmail" placeholder="이메일을 입력해주세요."/>
				</div>
			</div>
		</div>
		
		<div class="box">
			<div class="columnGrid">
				<div class="subTitle">배송지 정보</div>
				<div>
					<label for="sameWithOrderer"><input type="checkbox" id="sameWithOrderer" />주문자와 동일</label>
					<label for="saveDestination"><input type="checkbox" id="saveDestination" />배송지 저장</label>
				</div>
			</div>
			<div id="shipping" class="rowGrid">
				<div class="columnGrid">
					<div>수취인</div>
					<input type="text" id="recipient" placeholder="이름을 입력해주세요." />
				</div>
				<div class="columnGrid">
					<div>연락처</div>
					<input type="text" id="recipientPhone" placeholder="- 없이 00000000000" />
				</div>
				<div id="destination" class="columnGrid">
					<div>배송지</div>
					<div>
						<input type="text" id="zoneCode" placeholder="우편번호" readonly />
						<button onclick="searchPostNumber()" class="buttons">우편번호 검색</button>
					</div>
					<div>
						<input type="text" id="addr1" placeholder="주소" readonly />
						<input type="text" id="addr2" placeholder="상세 주소를 입력해주세요." />
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
						<input type="number" id="pointInput" name="pointInput" placeholder="0" min="0" />
						<button id="useAllPoint" class="buttons">전액 사용</button>
					</div>
					<div>보유 포인트 : <span id="pointSpan">${member.mem_point}</span></div>
				</div>
			</div>
		</div>
		
		<div class="box">
			<div class="subTitle">총 결제 금액</div>
			<div id="summary" class="rowGrid">
				<div id="totalQty" class="columnGrid">
					<div>총 수량</div>
					<div class="rightAlign"><b>총 수량개<%-- ${총 수량}개 --%></b></div>
				</div>
				<div id="totalPrice" class="columnGrid">
					<div>총 상품 금액</div>
					<div class="rightAlign"><b>총 상품 금액원<%-- ${총 금액}원 --%></b></div>
				</div>
				<div id="shippingFare" class="columnGrid">
					<div>배송비</div>
					<div class="rightAlign"><b>
					<%--
						<c:choose>
							<c:when test="${${총 금액} > 50000}">
								0원
							</c:when>
							<c:otherwise>
								3000원
							</c:otherwise>
						</c:choose>
					--%>
					3000원
					</b></div>
				</div>
				<div id="total" class="columnGrid">
					<div class="subTitle">총 결제 금액</div>
					<div class="rightAlign"><h5><b>총 결제 금액원<%-- ${총 금액 + 배송비} --%></b></h5></div>
				</div>
			</div>
		</div>
		
		<div class="box">
			<div class="subTitle">결제 방식</div>
			<div class="rowGrid">
				<div id="payment">
				<%-- 결제 API 넣어야함 --%>
					<button id="" class="payButtons">무통장 입금</button>
					<button id="kakaoPay" class="payButtons">카카오 페이</button>
					<button id="naverPay" class="payButtons">네이버 페이</button>
					<button id="tossPay" class="payButtons">토스 페이</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="rightOuter">
		<div class="box">
			<div class="columnGrid">
				<div class="subTitle">주문 정보</div>
				<div class="rightAlign">총 결제 금액</div>
			</div>
			<hr />
			<br />
			<%--
			<c:forEach items="${주문 상품들}" var="prod">
				<div class="orderList">
					<div class="rowSpan">이미지</div>
					<div>제품명${prod.p_name}</div>
					<div>색상 : ${prod.pc_name}</div>
					<div>사이즈 : ${prod.ps_name}</div>
					<div>수량 :</div>
					<div>가격${수량 * ${prod.p_price}}</div>
				</div>
			</c:forEach>
			--%>
		 </div>
	</div>
	
</div>

<script>
	const memberAddress = {
		mem_zipcode: '${memberAddress.mem_zipcode}',
		mem_addr1: '${memberAddress.mem_addr1}',
		mem_addr2: '${memberAddress.mem_addr2}',
		addr_save: '${memberAddress.addr_save}',
	};
</script>

<%-- 다음 주소 API 참조 스크립트 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%-- 네이버페이 API 참조 스크립트 --%>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

<script src="assets/user/order/js/order.js"></script>


<%@ include file="../common/footer.jsp"%>