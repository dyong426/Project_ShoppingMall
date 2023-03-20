<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />

<title>juhee custom -</title>
<link rel="stylesheet" href="assets/user/cart/css/basket.css">
<link rel="stylesheet" href="assets/user/cart/css/option_popup.css">
<link rel="stylesheet" href="assets/user/cart/css/color_popup.css">
<c:set value="${sessionScope.member}" var="member"></c:set>

<!-- main -->
<div class="main_body">
	<div class="cart_body">
		<div class="basket_top">
			<span id="my_basket">내 장바구니</span>
			<div class="basket_process">
				<span id="pocket">장바구니</span> <span class="other">&gt;</span> <span
					class="other">주문서작성</span> <span class="other">&gt;</span> <span
					class="other">주문완료</span>
			</div>
		</div>
		<c:choose>
			<c:when test="${not empty carts}">
				<div class="basket_middle">
					<span>상품정보</span> <span>사이즈</span> <span>수량</span> <span>가격</span>
					<span>편집</span>
				</div>
				<div class="basket">
					<c:forEach items="${carts}" var="cart" varStatus="cartStatus">
						<c:choose>
							<c:when test="${empty pre_p_num || pre_p_num == cart.p_num}">
								<div class="basket_bottom">
									<div class="list">
										<div class="list_top">
											<span>20230213-5015022</span>
										</div>
										<div class="basket_body">
											<div class="product_info">
												<div class="name">
													<img class="img" src="${cart.mem_cstm_path}" alt="상품 이미지">
													<div class="prodDetail" data-pd_num="${cart.pd_num}" data-cart_num="${cart.cart_num}">
														${cart.p_name}
														<div class="prodColor">
															색상 : <span>${cart.pc_name}</span>
														</div>
													</div>
												</div>
												<div class="size">
													<span>${cart.ps_name}</span>
												</div>
												<div class="initQuantity">
													<table class="quantityTable">
														<tr>
															<td class="minus" data-action="decrement"></td>
															<td class="val">${cart.cart_quantity}</td>
															<td class="plus" data-action="increment"></td>
														</tr>
													</table>
												</div>
												<div class="price" data-p_price="${cart.p_price}">${cart.cart_amount}원</div>
												<div class="btn_box">
													<button class="btn delete">삭제</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<c:if test="${not empty pre_p_num && (carts[cartStatus.index + 1].p_num != cart.p_num || empty carts[cartStatus.index + 1].p_num)}">
								<br />
								<%--
									<div class="add_btn">
										<div class="add_color">색상추가+</div>
									</div>
								--%>
								</c:if>
							</c:when>
							<c:otherwise>
								<div class="basket">
									<div class="basket_bottom">
										<div class="list">
											<div class="list_top">
												<span>20230213-5015022</span>
											</div>
											<div class="basket_body">
												<div class="product_info">
													<div class="name">
														<img class="img" src="${cart.mem_cstm_path}" alt="상품 이미지">
														<div class="prodDetail" data-pd_num="${cart.pd_num}" data-cart_num="${cart.cart_num}">
															${cart.p_name}
															<div class="prodColor">
																색상 : <span>${cart.pc_name}</span>
															</div>
														</div>
													</div>
													<div class="size">
														${cart.ps_name}
													</div>
													<div class="initQuantity">
														<table class="quantityTable">
															<tr>
																<td class="minus" data-action="decrement"></td>
																<td class="val">${cart.cart_quantity}</td>
																<td class="plus" data-action="increment"></td>
															</tr>
														</table>
													</div>
													<div class="price" data-p_price="${cart.p_price}">${cart.cart_amount}원</div>
													<div class="btn_box">
														<button class="btn delete">삭제</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						<c:set value="${cart.p_num}" var="pre_p_num"></c:set>
					</c:forEach>
				</div>

				<div class="summary">
					<div>
						<span class="sm">총 수량</span> <span class="total_quantity"></span>
					</div>
					<div>
						<span class="sm">가격</span> <span class="all_price"></span>
					</div>
					<div>
						<span class="sm">배송비</span> <span class="delivery_charge"></span>
					</div>
					<div>
						<span class="sm" id="total">합계</span> <span class="total_price"></span>
					</div>
					<div class="border_bar"></div>
					<div class="math_symbol">
						<div></div>
						<div class="sm_plus">+</div>
						<div class="equal">=</div>
					</div>
				</div>

				<form action="<%=request.getContextPath()%>/order/fromCart" method="POST">
					<input type="submit" id="checkout_btn" value="주문서 작성"/>
				</form>
			</c:when>

			<c:otherwise>
				<div id="emptyNotice">
					<span class="material-symbols-outlined">add_shopping_cart</span>
					<div class="subTitle">장바구니가 비어있습니다. 상품을 추가해주세요!</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<%--
<!-- 색상 추가 팝업 창-->
<div class="cl_modal">
	<div class="cl_modal-content">
		<button class="cl_close-button"></button>
		<div class="cl_title">다른 색상</div>
		<div class="colors_container"
			_sel="user_products->(#9489628)->_->product_color->_->base_product->_->base_product_colors">
			<div _id="24405" _sel="./(#24405)" class="color_item"
				color_code="#ffc824">
				<div class="code_wrap">
					<div class="code non-click" style="background-color: #ffc824"></div>
				</div>
				<div class="name">노랑</div>
			</div>
		</div>
		<button class="done" type="button" done_type="Add">상품 추가</button>
	</div>
</div>
--%>

<%--
<!-- 사이즈 옵션 팝업 창-->
<div class="main">
	<div class="modal">
		<div class="modal-content">
			<div class="or_picture_box">
				<div class="or_picture">
					<img id="sizePopUpImg" src="assets/common/cstm_img/products/clothes/특양면 베이직 후드.png"
						alt="" style="width: 450px; height: 450px;">
				</div>
			</div>
			<div class="option_box">
				<span class="close-button">&times;</span>
				<div class="title">수량을 선택해주세요</div>
				<div class="pd_main_box">
					<div class="sub"></div>
				</div>
				<div class="modal_footer">
					<div class="tt_check_box">
						<div class="sub_title"></div>
						<div class="sb_tt_price">0원</div>
					</div>
					<div class="buttons">
						<button class="submit">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
--%>
 
<!-- 사이즈 옵션 카운트 js -->
<script>
	const mem_num = '${member.mem_num}';
</script>


<script type="text/javascript"
	src="assets/user/cart/js/size_count.js?ver=1"></script>
<script type="text/javascript"
	src="assets/user/cart/js/size_popup.js?ver=1"></script>
<%--
<script type="text/javascript"
	src="assets/user/cart/js/color_popup.js?ver=1"></script>
<script type="text/javascript"
	src="assets/user/cart/js/color_select.js?ver=1"></script>
--%>

<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</footer>