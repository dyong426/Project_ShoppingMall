<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="assets/user/cart/css/basket.css">


<!-- main -->
<div class="cart_body" data-bs-ride="carousel">
	<div class="basket_top">
		<div class="basket_title">
			<span id="my_basket">내 장바구니</span>
		</div>
		<div class="basket_process">
			<span>장바구니</span> <span class="other">&gt;</span> <span class="other">주문서작성</span>
			<span class="other">&gt;</span> <span class="other">주문완료</span>
		</div>
	</div>
	
	<div class="basket">
		<div class="basket_middle">
			<span>상품정보</span> <span>사이즈</span> <span>수량</span> <span>가격</span> <span>편집</span>
		</div>
		<div class="basket_bottom">
			<div class="list">
				<div class="list_top">
					<span>2023-02-13 12:04</span><span> | No. 9471967</span>
				</div>
				<div class="basket_body">
					<div id="prodInfo">
						<img id="img"
							src="<%=request.getContextPath()%>/assets/common/cstm_img/착샷.jpg"
							alt="상품 이미지">
						<div id="prodDetail">
							<div>후드집업(남여공용)[블루]</div>
							<span id="printing">인쇄 : </span>
							<span>없음</span>
						</div>
					</div>
					<div class="">
						<div class="">L</div>
					</div>
					<div class="">
						<span class="">1</span>
					</div>
					<div class="">29,200원</div>
					<div id="btns">
						<button type='button' class='btn edit'>옵션 변경</button>
						<button type='button' class='btn save_heart'>나중에 구매</button>
						<button type='button' class='btn delete'>삭제</button>
					</div>
				</div>
			</div>
			<div class="add_btn">
				<div class="add_color">색상추가+</div>
			</div>
		</div>
	</div>

	<div class="summary">
		<div>
			<span class="sm">총 수량</span> <span class='total_quantity'>1</span>
		</div>
		<div>
			<span class="sm">가격</span> <span class="all_price">29,200</span>
		</div>
		<div>
			<span class="sm">배송비</span> <span class="delivery_charge">3000</span>
		</div>
		<div>
			<span class="sm" id="total">합계</span> <span class="total_price">32,200</span>
		</div>
		<div class="border_bar"></div>
		<div class="math_symbol">
			<div></div>
			<div class="plus">+</div>
			<div class="equal">=</div>
		</div>

	</div>

	<div class="checkout_btn">
		<span>주문서 작성</span>
	</div>
</div>

<script src="assets/user/cart/js/color_popup.js"></script>
<script src="assets/user/cart/js/color_select.js"></script>
<script src="assets/user/cart/js/size_popup.js"></script>
<script src="assets/user/cart/js/size_count.js"></script>

<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</footer>