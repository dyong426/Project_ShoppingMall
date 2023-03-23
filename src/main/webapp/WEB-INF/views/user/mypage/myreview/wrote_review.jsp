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
			<span class="my_review2"><h1>나의 리뷰</h1></span>
		</div>
		<c:set var="member" value="${sessionScope.member }"/>
		<div class="header_tab">
			<div class="tab_left" type="order_list">
				<a class="ok_review"
					href="<%=request.getContextPath()%>/review/write?page=1" style="text-decoration: none;">작성 가능한 리뷰</a>
			</div>
			<div class="tab_right" type="review_list">내가 쓴 리뷰</div>
		</div>
		<div class="wrote_review" total_count="0">
			<table class="wr_info">
				<thead>
					<tr >
						<th style="width: 180px;">주문일자[주문번호]</th>
						<th style="width: 100px;">작성일자</th>
						<th style="width: 280px;">내용</th>
						<th style="width: 100px;">별점</th>
						<th style="width: 100px;">내 사진</th>
					</tr>
				</thead>

				<tbody class="wr_list">
				<c:forEach items="${rv_history}" var="rh" begin="${start }" end="${end }">
				
				
					<tr class="wr" id="${rh.review_num}">
					<c:set var="ord_num" value="${rh.ord_num}"/>
						<td class="od_number">
							<p>
							${rh.rv_write_date} <br>
								<a href="<%=request.getContextPath()%>/details?ord_num=${ord_num}"
									class="order_number">[${rh.new_order_num}]</a>
							</p>
						</td>
						<td class="wr_img">${rh.new_order_date}</td>
						<td class="wr_check"><strong class="wr_name">
								<div class="sentence">
									<a href="" class="ec_wr_name" onclick="return false;" style="text-decoration: none;">${rh.review_content}</a>
								</div>
						</strong></td>
						<td class="wr_amount">
							<div class="star-ratings">
								<div class="star-ratings-fill">
									${rh.star}
								</div>
							</div>
						</td>
						<td>
						
						<img id="picture"
							src="<%=request.getContextPath() %>/display/image?fileName=${rh.review_image_path}"
							alt=""></td>
					</tr>
					</c:forEach> 
				</tbody>
			</table>
		</div>
		<div id="page_num_container">
		            		<div id="page_num_box">
		            		
		            		</div>
            		</div>
	</div>
</div>

<script>



<!-- 페이징 -->
<script>
	let total = ${rh_count};
	
	let page_box = document.getElementById('page_num_box');
	
	function createPageBtn(cnt) {
	    page_box.innerHTML += '<div class="page_num_div"><button class="page_num" type="button" name="page" value="' + cnt + '" onclick="goToPage(' + cnt + ');">' + cnt + '</button></div>';
	}
	
	let total_page = Math.ceil(total/10);
	
	
	let cnt = 1;
	
	for(let i = 0; i < total_page; ++i) {
	    createPageBtn(cnt++);
	}
	
	function goToPage(page) {
	    location.href = "/review/list?mem_num=${member.mem_num}&page=" + page;
	}
</script>






<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/user/mypage/js/review_popup.js?ver=1"></script>