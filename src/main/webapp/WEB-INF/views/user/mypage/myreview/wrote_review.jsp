<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/mypage/review/css/wrote_review.css?after">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/mypage/review/css/review_popup.css">

<!-- main -->
<div class="rv_container2">
	<div class="rv_body2">
		<div class="header_title2">
			<span class="my_review2">나의 리뷰</span>
		</div>
		<c:set var="member" value="${sessionScope.member }"/>
		<div class="header_tab">
			<div class="tab_left" type="order_list">
				<a class="ok_review"
					href="<%=request.getContextPath()%>/writeable_reviews?mem_num=${member.mem_num}&page=1">작성 가능한 리뷰</a>
			</div>
			<div class="tab_right" type="review_list">내가 쓴 리뷰</div>
		</div>
		<div class="wrote_review" total_count="0">
			<table class="wr_info">
				<thead>
					<tr>
						<th style="width: 180px;">주문일자[주문번호]</th>
						<th style="width: 100px;">작성일자</th>
						<th style="width: 280px;">내용</th>
						<th style="width: 100px;">별점</th>
						<th style="width: 100px;">내 사진</th>
					</tr>
				</thead>

				<tbody class="wr_list">
				<c:forEach items="${rv_history}" var="rh" begin="${start }" end="${end }">
					<tr class="wr">
						<td class="od_number">
							<p>
							${rh.new_order_date} <br>
								<a href="<%=request.getContextPath()%>/details"
									class="order_number">[${rh.new_order_num}]</a>
							</p>
						</td>
						<td class="wr_img">${rh.new_order_date}</td>
						<td class="wr_check"><strong class="wr_name">
								<div class="sentence">
									<a href="<%=request.getContextPath()%>/review_poprup" class="ec_wr_name" onclick="return false;">${rh.review_content}</a>
								</div>
						</strong></td>
						<td class="wr_amount">
							<div class="star-ratings">
								<div class="star-ratings-fill">
									${rh.star}
								</div>
							</div>
						</td>
						<td><img id="picture"
							src="<%=request.getContextPath() %>/${rh.review_image_path}"
							alt=""></td>
					</tr>
					</c:forEach> 
				</tbody>
			</table>
		</div>
		<div id="page_num_container">
            			<form id="all_review_page" action="<%=request.getContextPath()%>/writeable_reviews?mem_num=${member.mem_num}&page=${page}" method="get">
		            		<div id="page_num_box">
		            		
		            		</div>
            			</form>
            		</div>
	</div>
</div>

<!-- 팝업 창 -->
<div class="rv_main">
	<div class="rv_modal">
		<div class="rv_modal-content">
			<span class="rv_close-button">&times;</span>
			<div class="rv_title_box">
				<h2 class="rv_title">내가 쓴 리뷰</h2>
			</div>
			<div class="rv_info">
				<div class="rv_image">
					<img
						src="<%=request.getContextPath()%>/assets/common/cstm_img/products/clothes/젤란 라이트 후드집업.png"
						alt="" style="width: 70px; height: 70px;">
				</div>
				<div class="rv_">
					<div class="rv_name">넘나 힙한 츄리닝 [Brown]</div>
					<div class="rv_price">29,000원</div>
				</div>
			</div>
			
			<div class="rv_check_box">
				<form class="mb-1" name="myform" id="myform" method="post">
					<fieldset>
						<input type="radio" name="reviewStar" value="5" id="rate1"><label
							for="rate1">★</label> <input type="radio" name="reviewStar"
							value="4" id="rate2"><label for="rate2">★</label> <input
							type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3">★</label> <input type="radio" name="reviewStar"
							value="2" id="rate4"><label for="rate4">★</label> <input
							type="radio" name="reviewStar" value="1" id="rate5"><label
							for="rate5">★</label>
					</fieldset>
				</form>
			</div>
				<div class="text_box">리뷰 내용</div>
				<div class="input_file">
				<div class="upload_space"></div>
				<div class="plus_box" id="uploadResult">
				</div>
			</div>
		</div>
	</div>
</div>



<script>
	let total = ${rh_count};
	console.log(total);
	
	let page_box = document.getElementById('page_num_box');
	
	console.log(total);
	function createPageBtn(cnt) {
	    page_box.innerHTML += '<div class="page_num_div"><input class="page_num" type="submit" name="page" value="' + cnt + '"></input></div>';
	}
	
	let total_page = Math.ceil(total/10);
	
	console.log(total_page);
	
	let cnt = 1;
	
	for(let i = 0; i < total_page; ++i) {
	    createPageBtn(cnt++);
	}
</script>






<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/user/mypage/js/review_popup.js?ver=1"></script>