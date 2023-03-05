
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/home/css/review.css">

<div id="review_main_container">
	<div id="re_title">
		<h1>REVIEW</h1>
	</div>
	<div id="re_box">



		<div id="review_con">
			<div id="review_img">
				<img
					src="<%=request.getContextPath()%>/assets/user/home/img/review_test/착샷.jpg" />
			</div>

			<div id="review_content_box">
				<div id="re_info">

					<div id="re_user_name">yee0***</div>
					<div class="re_star">★★★★★</div>
					<div id="re_created_at">2023-02-23</div>


				</div>

				<div id="review_contents">
					<div id="re_comment">이쁘게나왔어용 책가방에걸어놓아야zㅣ</div>
				</div>


			</div>
		</div>

		<div id="review_pro_box">

			<a href="#">
				<div id="review_pro">
					<div>
						<img>제품사진
					</div>
					<div>
						<p>제품명</p>
					</div>
				</div>
			</a>
			<a id="review_back" href="<%=request.getContextPath()%>/main">
				돌아가기 
			</a>
			<a id="review_all" href="<%=request.getContextPath()%>/allreview">
				전체리뷰
			</a>
			
		</div>

	</div>

</div>


<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />