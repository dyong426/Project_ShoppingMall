<!-- 정수정, 제품 상세 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/header.jsp"%>
<c:set value="<%=request.getContextPath()%>" var="contextPath"></c:set>

<title>juhee custom - ${prod.p_name }</title>
<link rel="stylesheet" href="${contextPath}/assets/user/prod/css/cstm.css" />
<link rel="stylesheet" href="${contextPath}/assets/user/prod/css/product_detail.css" />
<script src="https://unpkg.com/konva@8.4.2/konva.min.js"></script>

<!-- main -->
<div id="main_container">
	<!--canvas-->
		<div id="main_canvas_container">
			<div id="menuBar">
				<label id="imageIcon" for="fileInput"> <span
					class="material-symbols-outlined loginCheck">imagesmode</span> <br /> 이미지 업로드
					<input type="file" multiple="multiple" id="fileInput"
					accept="image/*">
				</label> <label id="textIcon"> <span
					class="material-symbols-outlined loginCheck">format_shapes</span> <br /> 텍스트
				</label> <label id="sampleIcon"> <span
					class="material-symbols-outlined loginCheck">category</span> <br /> 샘플 아이콘
				</label>
			</div>
			<div id="outer">
				<div id="container-top"></div>
		
				<div id="settingPanelOuter">
					<div id="textSettingPanel" class="settingPanel">
						<div>글씨 스타일</div>
						<div>
							<div id="fontFamily">
								<div class="subTitle">글꼴</div>
								<select class="round_border" id="fontFamilyComboBox"
									onchange="changeFontFamily()">
								</select>
							</div>
							<div id="textAlignFontSize">
								<div id="textAlign" class="round_border">
									<span class="material-symbols-outlined">format_align_left</span>
									<span class="material-symbols-outlined">format_align_center</span>
									<span class="material-symbols-outlined">format_align_right</span>
								</div>
								<div id="fontSize" class="round_border">
									<span id="fontUpBtn" class="material-symbols-outlined">text_increase</span>
									<span id="fontDownBtn" class="material-symbols-outlined">text_decrease</span>
								</div>
							</div>
							<div id="textDecoration" class="round_border">
								<div class="textDecoration">
									<b>B</b>
								</div>
								<div class="textDecoration">
									<i>I</i>
								</div>
								<div class="textDecoration">U</div>
								<div class="textDecoration">S</div>
							</div>
						</div>
						<div id="textColorInformation">
							<div class="subTitle">글자색</div>
							<input type="color" id="color" />
						</div>
					</div>
		
					<div id="mainSettingPanel" class="settingPanel">
						<div id="productInformation">
							<div id="productName">${prod.p_name}</div>
							<div id="productPrice">${prod.p_price}</div>
						</div>
						<div id="colorInformation">
							<!-- DB에서 가져온 색들 중 선택된 색의 이름을 색상명에 넣음 -->
							<div>
								<b class="subTitle"> 색상 - <span id="colorName"
									data-imagePath="${color.pc_img_path}">${color.pc_name}</span>
								</b>
							</div>
							<div id="productColors">
								<!-- DB에서 가져온 해당 상품에 존재하는 색들의 값을 backgroundColor로 설정한 div 추가 -->
								<c:forEach items="${colors}" var="color">
									<div id="${color.value.pc_code}"
										data-name="${color.value.pc_name}"
										data-imagePath="${color.value.pc_img_path}"></div>
								</c:forEach>
							</div>
						</div>
						<!-- DB 조회해서 재고가 없으면 품절 표시 -->
						<!-- DB 조회해서 존재하는 사이즈 추가 -->
						<b class="subTitle">사이즈</b>
						<div id="productSizes">
							<c:forEach items="${sizes}" var="size">
								<div class="sizeHover">${size.ps_name}</div>
							</c:forEach>
						</div>
						<b class="subTitle">수량</b>
						<div id="productQuantity">
							<table class="quantityTable">
								<tr>
									<td class="minus" data-action="decrement"></td>
									<td id="quantity">1</td>
									<td class="plus" data-action="increment"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div id="buttons">
					<form action="<%=request.getContextPath()%>/order/directPurchase" method="POST" id="orderForm">
						<input type="submit" class="buttons loginCheck" id="directPurchase" value="바로 구매하기"/>
						<input type="hidden" id="cart_num" name="cart_num"/>
					</form>
					<button class="buttons loginCheck" id="intoCart">장바구니 담기</button>
				</div>
				
				<div id="menu">
					<button id="delete-button">Delete</button>
				</div>
			</div>
		</div>
	
	<div id="sampleIconPopUpBackground">
		<div id="sampleIconPopUp">
			<div id="sampleIconPopUpHeader">
				<div>샘플 아이콘</div>
				<span id="sampleIconPopUpCloseBtn">X</span>
			</div>
			<div id="sampleIcons"></div>
		</div>
	</div>
	<div id="cartPopUp">
		<div class="subTitle"></div>
	</div>
	
	<br> <br> <br> <br> <br>
	<!-- 상품 정보 -->
	
	<!-- 사이즈 정보 -->
	${prod.p_explain_path}
	<br />
	${prod.p_info_path}
	
</div>
<div id="cartPopUp">
	<div class="subTitle">상품을 장바구니에 담았습니다.</div>
</div>
<!--고객 리뷰-->
<div id="customer_review_container">
	<c:forEach items="${reviews}" var="r">
		<div id="customer_each_review_container">
			<!--아이디-->
			<c:set var="mem_name" value="${r.mem_name }" />
			<div id="customer_review_user_id">${fn:substring(mem_name, 0, 2)}*
			</div>
			<!--리뷰-->
			<div id="review_container">
				<div id="customer_review_text_container">
					<div id="customer_review_stars_container">
						<span id="customer_review_stars">
							<c:forEach begin="1" end="${r.review_star }">★</c:forEach>
							<c:forEach begin="1" end="${5-r.review_star}">☆</c:forEach>
						</span> 
						<span id="customer_review_stars_text">${r.review_star }</span> 
						<span id="customer_review_date"> 
							<fmt:formatDate pattern="MM.dd" value="${r.review_regdate }" />
						</span>
					</div>
					<div id="customer_review_contents">${r.review_content }</div>
					<c:if test="${empty r.review_image_path}">
					</c:if>
					<c:if test="${not empty r.review_image_path}">
						<div>
							<img src="${r.review_image_path }" alt="" />
						</div>
					</c:if>

				</div>
			</div>
		</div>
		<hr>
	</c:forEach>
</div>
<!-- 리뷰 -->
<div class="subject">고객 리뷰</div>
<div id="main_review_container">
	<!--구매고객 총 평점-->
	<div id="customer_score_container">
		<div>구매 고객 총 평점</div>
		<div>5</div>
		<div>★★★★★</div>
	</div>

	<div id="review_bar"></div>

	<!--사진 모아보기 (8개까지만)-->
	<div>
		<img src="assets/common/cstm_img/착샷.jpg" alt=""> <img
			src="assets/common/cstm_img/착샷2.jpg" alt=""> <img
			src="assets/common/cstm_img/착샷3.jpg" alt=""> <img
			src="assets/common/cstm_img/착샷4.jpg" alt=""> <img
			src="assets/common/cstm_img/예시1.jpg" alt=""> <img
			src="assets/common/cstm_img/의류1.jpg" alt=""> <img
			src="assets/common/cstm_img/의류2.jpg" alt=""> <img
			src="assets/common/cstm_img/예시5.jpg" alt="">
	</div>
</div>

<div id="separator"></div>

<!--고객 리뷰-->
<div id="customer_review_container">
	<div id="customer_each_review_container">
		<!--아이디-->
		<div id="customer_review_user_id">wjdtnwj*</div>
		<!--리뷰-->
		<div id="review_container">
			<div id="customer_review_text_container">
				<div id="customer_review_stars_container">
					<span id="customer_review_stars">★★★☆☆</span> <span
						id="customer_review_stars_text">3</span> <span
						id="customer_review_date">02.13</span>
				</div>
				<div id="customer_review_contents">
					따뜻하네요 근데 좀 비싼 거 같아요<br> <b>아래 사진 클릭하면 크게 보이게 하기</b>
				</div>
				<div>
					<img src="assets/common/cstm_img/예시5.jpg" alt="" /> <img
						src="assets/common/cstm_img/예시2.jpg" alt="" /> <img
						src="assets/common/cstm_img/예시3.jpg" alt="" />
				</div>

			</div>
		</div>

	</div>

	<hr>

	<div id="customer_each_review_container">
		<!--아이디-->
		<div id="customer_review_user_id">구지은바*</div>
		<!--리뷰-->
		<div id="review_container">
			<div id="customer_review_text_container">
				<div id="customer_review_stars_container">
					<span id="customer_review_stars">★★★★★</span> <span
						id="customer_review_stars_text">5</span> <span
						id="customer_review_date">02.13</span>
				</div>
				<div id="customer_review_contents">
					사랑스러워 넌 나의 애기야<br> 너무 귀여워 넌 나의 애기야<br> 정말 요리보고 조리봐도 어쩜 넌<br>
					깨물고만 싶어 꼬집고만 싶어<br> 넌 나만의 Baby 영원한 나만의 자기<br> 아주 꼭꼭 숨겨놓고선
					나만 볼래 나만 볼래 나만 볼래
				</div>
				<div>
					<img src="assets/common/cstm_img/의류4.jpg" alt="" />
				</div>
			</div>
		</div>
	</div>

	<hr>

	<div id="customer_each_review_container">
		<!--아이디-->
		<div id="customer_review_user_id">쌤!저질문있어*</div>
		<!--리뷰-->
		<div id="review_container">
			<div id="customer_review_text_container">
				<div id="customer_review_stars_container">
					<span id="customer_review_stars">★☆☆☆☆</span> <span
						id="customer_review_stars_text">1</span> <span
						id="customer_review_date">02.13</span>
				</div>
				<div id="customer_review_contents">지은아 리뷰 예시로 들 거 좀 말해줘. 좋아요~
					아니 길게 좀 말해봐 아니 그냥 가나다마바사해;;</div>
				<div>
					<img src="assets/common/cstm_img/의류1.jpg" alt="" /> <img
						src="assets/common/cstm_img/의류2.jpg" alt="" /> <img
						src="assets/common/cstm_img/의류3.jpg" alt="" />
				</div>

			</div>
		</div>
	</div>

	<hr>

	<div id="customer_each_review_container">
		<!--아이디-->
		<div id="customer_review_user_id">안녕하세*</div>
		<!--리뷰-->
		<div id="review_container">
			<div id="customer_review_text_container">
				<div id="customer_review_stars_container">
					<span id="customer_review_stars">★☆☆☆☆</span> <span
						id="customer_review_stars_text">1</span> <span
						id="customer_review_date">12.14</span>
				</div>
				<div id="customer_review_contents">옷 좋아요</div>
			</div>
		</div>
	</div>
</div>


<script>
	const mem_num = '${member.mem_num}';
	const p_num = '${prod.p_num}';
	const p_name = '${prod.p_name}';
	const p_price = '${prod.p_price}';
</script>

<script src="${contextPath}/assets/user/prod/js/cstm.js"></script>

<%@ include file="../common/footer.jsp"%>