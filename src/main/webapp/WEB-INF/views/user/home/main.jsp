<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/home/css/home_main.css?after">
<!-- main -->
<div id="home_main">

	<!-- banner 수정필요-->
	<div id="home_banner_container" class="h_container">
		<div style="overflow: hidden; margin: 0;">

			<div class="img_container">
			
			<!-- 배너 마지막 이미지  -->
				<div class="img_wrapper">
					<img
						src="<%=request.getContextPath()%>/assets/user/home/img/banner/배너3.jpg">
				</div>
				<!-- 배너 이미지 forEach -->
				<div class="img_wrapper">
					<img
						src="<%=request.getContextPath()%>/assets/user/home/img/banner/배너1.jpg">
				</div>
				<div class="img_wrapper">
					<img
						src="<%=request.getContextPath()%>/assets/user/home/img/banner/배너2.jpg">
				</div>
				<div class="img_wrapper">
					<img
						src="<%=request.getContextPath()%>/assets/user/home/img/banner/배너3.jpg">
				</div>
				<!-- 배너 이미지 /forEach -->
				<!-- 배너 첫번쨰-->
				<div class="img_wrapper">
					<img
						src="<%=request.getContextPath()%>/assets/user/home/img/banner/배너1.jpg">
				</div>
			</div>
			<div>

				<button class="prev">
					<span class="material-symbols-outlined"> arrow_back_ios </span>
				</button>
				<button class="next">
					<span class="material-symbols-outlined"> arrow_forward_ios </span>
				</button>
			</div>

		</div>

	</div>

	<!-- category icon -->
	<div id="home_cate_icon_container" class="h_container">
		<div id="home_cate_icon_box">
			<div class="home_cate_item">
				<a href="/jhc/contact" class="cate_img_01">
					<div class="home_cate_img">
						<img
							src="<%=request.getContextPath()%>/assets/user/home/img/cate_icon/의류.png" />
					</div>
					<p class="home_cate_name">의류</p>
				</a>
			</div>

			<div class="home_cate_item">
				<a href="/jhc/contact" class="cate_img_02">
					<div class="home_cate_img">
						<img
							src="<%=request.getContextPath()%>/assets/user/home/img/cate_icon/폰케이스.png" />
					</div>
					<p class="home_cate_name">폰케이스/테크</p>
				</a>
			</div>

			<div class="home_cate_item ">
				<a href="/jhc/contact" class="cate_img_03">
					<div class="home_cate_img">
						<img
							src="<%=request.getContextPath()%>/assets/user/home/img/cate_icon/홈데코.png" />
					</div>
					<p class="home_cate_name">홈데코/리빙</p>
				</a>
			</div>

			<div class="home_cate_item">
				<a href="/jhc/contact" class="cate_img_04">
					<div class="home_cate_img">
						<img
							src="<%=request.getContextPath()%>/assets/user/home/img/cate_icon/액자.png" />
					</div>
					<p class="home_cate_name">잡화</p>
				</a>
			</div>
		</div>
	</div>

	<!-- recommended item -->
	<div id="home_recom_item_container" class="h_container">

		<div class="home_main_title">
			<h2>내가 만드는 나의 상품</h2>
		</div>
		<div id="recom_box">
			<div id="home_recom_item_box">

				<div class="recom_item">
					<a href="/jhc/contact" class="recom_item_img">
						<div>
							<img
								src="<%=request.getContextPath()%>/assets/user/home/img/recommend/01.png" />
						</div>
					</a>
				</div>

				<div class="recom_item">
					<a href="/jhc/contact" class="recom_item_img">
						<div>
							<img
								src="<%=request.getContextPath()%>/assets/user/home/img/recommend/02.png" />
						</div>
					</a>
				</div>

				<div class="recom_item" style="">
					<a href="/jhc/contact" class="recom_item_img">
						<div>
							<img
								src="<%=request.getContextPath()%>/assets/user/home/img/recommend/03.png" />
						</div>
					</a>
				</div>

				<div class="recom_item">
					<a href="/jhc/contact" class="recom_item_img">
						<div>
							<img
								src="<%=request.getContextPath()%>/assets/user/home/img/recommend/04.png" />
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- review -->
	<div id="home_review_container" class="h_container">
		<div id="home_customer_review_box">
			<div class="home_review_title">
				<div>
					<h2>
						리뷰 <span>(${review_size})</span>
					</h2>
				</div>
				<div id="all_review">
					<a href="/jhc/allreview?page=1"> 전체보기> </a>
				</div>

			</div>

			<div class="home_review_list_box">
				<ul class="home_review_list"
					style="background-image: url(); list-style: none;">

					<c:forEach items="${review_list}" var="list" begin="0" end="4">
						<li class="home_review_box"><a
							href="/jhc/review?review_num=${list.review_num }">

								<div class="home_review_img">
									<img
										src="<%=request.getContextPath()%>/${list.review_image_path}" />
								</div>

								<div class="review_score">
									<div class="star">${list.star}</div>
								</div>

								<div class="review_contents">
									<div class="comment">${list.review_content}</div>
								</div>

								<div class="info">
									<div class="created_at">${list.rev_only_date}</div>
									<div class="user_name">${list.user_name}</div>
								</div>

						</a></li>
					</c:forEach>

				</ul>
			</div>
		</div>
	</div>

</div>


<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
	<script
		src="<%=request.getContextPath()%>/assets/user/home/js/home_main.js"></script>