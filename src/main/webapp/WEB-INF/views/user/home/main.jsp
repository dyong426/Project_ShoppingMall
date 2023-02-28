
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/home/css/home_main.css">
<!-- main -->
<div id="home_main">

	<!-- banner (부트스트랩)-->
	<div id="home_banner_container" class="h_container">

		<div id="banner_photo" class="banner_slider">


			<div id="carouselExampleInterval" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div id="banner_img01" class="carousel-item active"
						data-bs-interval="10000">
						<img
							src="<%=request.getContextPath()%>/assets/user/home/img/banner/배너1.jpg"
							class="d-block w-100" alt="...">
					</div>
					<div id="banner_img01" class="carousel-item"
						data-bs-interval="2000">
						<img
							src="<%=request.getContextPath()%>/assets/user/home/img/banner/배너2.jpg"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img
							src="<%=request.getContextPath()%>/assets/user/home/img/banner/배너3.jpg"
							class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
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
							src="<%=request.getContextPath()%>/assets/user/home/img/cate_icon/의류.png" />
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

			<div class="recom_item">
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

	<!-- review -->
	<div id="home_review_container" class="h_container">
		<div id="home_customer_review_box">
			<div class="home_review_title">
				<div>
				<h2>
					리뷰 <span>(9,000)</span>
				</h2>
				</div>
				<div id="all_review">
					<a href="/jhc/allreview">
					전체보기>
					</a>
				</div>				
				
			</div>

			<div class="home_review_list_box">
				<ul class="home_review_list"
					style="background-image: url(); list-style: none;">

					<li class="home_review_box">
					<!-- href="/kr/review/list?r_id=121480" -->

					<a href="/jhc/review"> 
							<div class="home_review_img">
								<img
									src="<%=request.getContextPath()%>/assets/user/home/img/review_test/착샷.jpg" />
							</div>

							<div class="review_score">
								<div class="star">★★★★★</div>
							</div>

							<div class="review_contents">
								<div class="comment">이쁘게나왔어용 책가방에걸어놓아야zㅣ</div>
							</div>

							<div class="info">
								<div class="created_at">2023-02-23</div>
								<div class="user_name">yee0***</div>
							</div>

					</a></li>

					<li class="home_review_box">
						<!-- href="/kr/review/list?r_id=121480" --> 
						<a href="/jhc/contact">

							<div class="home_review_img">
								<img
									src="<%=request.getContextPath()%>/assets/user/home/img/review_test/착샷2.jpg" />
							</div>

							<div class="review_score">
								<div class="star">★★★★★</div>
							</div>

							<div class="review_contents">
								<div class="comment">이쁘게나왔어용 책가방에걸어놓아야zㅣ</div>
							</div>

							<div class="info">
								<div class="created_at">2023-02-23</div>
								<div class="user_name">yee0***</div>
							</div>

					</a>
					</li>
					<li class="home_review_box">
						<!-- href="/kr/review/list?r_id=121480" -->
						<a href="/jhc/contact">
							<div class="home_review_img" style="background-image: url();">
								<img
									src="<%=request.getContextPath()%>/assets/user/home/img/review_test/착샷3.jpg" />
							</div>

							<div class="review_score">
								<div class="star">★★★★★</div>
							</div>

							<div class="review_contents">
								<div class="comment">이쁘게나왔어용 책가방에걸어놓아야zㅣ</div>
							</div>

							<div class="info">
								<div class="created_at">2023-02-23</div>
								<div class="user_name">yee0***</div>
							</div>
					</a>
					</li>

					<li class="home_review_box">
						<!-- href="/kr/review/list?r_id=121480" -->
						 <a href="/jhc/contact">
							<div class="home_review_img">
								<img
									src="<%=request.getContextPath()%>/assets/user/home/img/review_test/착샷4.jpg" />
							</div>

							<div class="review_score">
								<div class="star">★★★★★</div>
							</div>

							<div class="review_contents">
								<div class="comment">이쁘게나왔어용 책가방에걸어놓아야zㅣ</div>
							</div>

							<div class="info">
								<div class="created_at">2023-02-23</div>
								<div class="user_name">yee0***</div>
							</div>
					</a>

					</li>

					<li class="home_review_box">
						<!-- href="/kr/review/list?r_id=121480" --> 
						<a href="/jhc/contact">
							<div class="home_review_img">
								<img
									src="<%=request.getContextPath()%>/assets/user/home/img/review_test/착샷4.jpg" />
							</div>

							<div class="review_score">
								<div class="star">★★★★★</div>
							</div>

							<div class="review_contents">
								<div class="comment">이쁘게나왔어용 책가방에걸어놓아야zㅣ</div>
							</div>

							<div class="info">
								<div class="created_at">2023-02-23</div>
								<div class="user_name">yee0***</div>
							</div>
					</a>

					</li>


				</ul>
			</div>
		</div>
	</div>

</div>


<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />