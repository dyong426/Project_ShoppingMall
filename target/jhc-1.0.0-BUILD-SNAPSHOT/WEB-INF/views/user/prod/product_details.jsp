<!-- 정수정, 제품 상세 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/header.jsp"%>

<title>juhee custom - ${prod.p_name }</title>
<link rel="stylesheet" href="assets/user/prod/css/product_detail.css" />

<!-- main -->
<div id="main_container">
	<!--canvas-->
	<div id="main_canvas_container">
		<span>canvas by 이동용, 상품 번호 = ${prod.p_num }</span>
	</div>
	<br> <br> <br> <br> <br>
	<!-- 상품 정보 -->


	<!-- 리뷰 -->
	<div class="subject">고객 리뷰</div>
	<div id="main_review_container">
		<!--구매고객 총 평점-->
		<div id="customer_score_container">
			<div>구매 고객 총 평점</div>
			<div>
				<c:if test="${empty starAvg}">
           	0
           	</c:if>
				<c:if test="${not empty starAvg}">
					<fmt:formatNumber value="${starAvg }" pattern="#.##" />
				</c:if>
			</div>
			<div></div>
		</div>

		<div id="menu">
			<button id="delete-button">Delete</button>
		</div>
	</div>
	<!--사진 모아보기 (7개까지만)-->
	<div>
		<c:forEach var="r" items="${reviews }" begin="0" end="8">
			<c:if test="${empty r.review_image_path}">
			</c:if>
			<c:if test="${not empty r.review_image_path }">
				<img src="${r.review_image_path }" alt="" />
			</c:if>
		</c:forEach>

	</div>
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
						<span id="customer_review_stars"> <c:forEach begin="1"
								end="${r.review_star }">★</c:forEach> <c:forEach begin="1"
								end="${5-r.review_star}">☆</c:forEach>
						</span> <span id="customer_review_stars_text">${r.review_star }</span> <span
							id="customer_review_date"> <fmt:formatDate pattern="MM.dd"
								value="${r.review_regdate }" />
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

<script src="assets/user/prod/js/cstm.js"></script>

<script>
	const mem_num = $
	{
		member.mem_num
	};
</script>

<%@ include file="../common/footer.jsp"%>