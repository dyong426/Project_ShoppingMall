<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>

<link rel="stylesheet" href="assets/user/order/css/order.css" />


<div id="outer">
	<div id="mainTitle">주문서 작성</div>

	<div class="box">
		<div class="subTitle">주문자 정보</div>
		<div id="ordererInformation" class="rowGrid">
			<div id="ordererName" class="columnGrid">
				<div>이름</div>
				<input type="text" id="ordererName" name="ordererName" placeholder="이름을 입력해주세요."/>
			</div>
			<div id="ordererPhone" class="columnGrid">
				<div>연락처</div>
				<input type="text" id="ordererPhone" name="ordererPhone" placeholder="- 없이 00000000000"/>
			</div>
			<div id="ordererEmail" class="columnGrid">
				<div>이메일</div>
				<input type="text" name="ordererEmail" placeholder="이메일을 입력해주세요."/>
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
			<div id="recipient" class="columnGrid">
				<div>수취인</div>
				<input type="text" placeholder="이름을 입력해주세요." />
			</div>
			<div id="recipientPhone" class="columnGrid">
				<div>연락처</div>
				<input type="text" placeholder="- 없이 00000000000" />
			</div>
			<div id="destination" class="columnGrid">
				<div>배송지</div>
				<div>
					<input type="text" placeholder="우편번호" readonly />
					<button onclick="searchPostNumber()" class="buttons">우편번호 검색</button>
				</div>
				<div>
					<input type="text" placeholder="주소" readonly />
					<input type="text" placeholder="상세 주소를 입력해주세요." />
				</div>
			</div>
		</div>
	</div>
	
	<div class="box">
		<div class="subTitle">포인트 사용</div>
		<div id="point" class="columnGrid">
			<div>포인트</div>
			<div class="flex-between">
				<input type="number" placeholder="0" max="10000" min="0" />
				<button id="useAll" class="buttons">전액 사용</button>
			</div>
			<div>보유 포인트 : </div> <%-- ${포인트} --%>
		</div>
	</div>
	<div class="box">
		<div class="subTitle">총 결제 금액</div>
		<div id="summary" class="rowGrid">
			<div id="totalQty" class="columnGrid">
				<div>총 수량</div>
				<div><b>총 수량개<%-- ${총 수량}개 --%></b></div>
			</div>
			<div id="totalPrice" class="columnGrid">
				<div>총 상품 금액</div>
				<div><b>총 상품 금액원<%-- ${총 금액}원 --%></b></div>
			</div>
			<div id="shippingFare" class="columnGrid">
				<div>배송비</div>
				<div><b>				
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
				<div><h5><b>총 결제 금액원<%-- ${총 금액 + 배송비} --%></b></h5></div>
			</div>
		</div>
	</div>
	
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function searchPostNumber() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
					// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				}
			}).open();
		}
	</script>
</div>

<script src="assets/user/order/js/order.js"></script>


<%@ include file="../common/footer.jsp"%>