<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/wr_review.css?after">

  <!-- main -->
  <div class="rv_container2">
        <div class="rv_body2">
            <div class="header_title2">
                <span class="wr_review">리뷰 작성하기</span>
            </div>
            
	            <div class="pd_info">
	                <div class="pd_image">
	                    <img style="width: 100px; height: 100px;" src="<%=request.getContextPath() %>/${review_pd.origin_img_path}" alt="">
	                </div>
	                <div class="pd_check">
	                    <div><span>${review_pd.p_name}</span></div>
	                    <div class="pd_color"><span>${review_pd.pc_name}</span></div>
	                    <div class="ps_size">${review_pd.ps_name} size</div>
	                </div>
	            </div>
	            <input type="hidden" name="rate" id="rate" value="0"/>
	            <div class="check_box">
	            	<form class="mb-1" name="myform" id="myform" method="post">
	            	<div class="warning_msg">별점을 선택해 주세요.</div>
	                    <fieldset>
	                        <input type="radio" name="reviewStar" value="5" id="rate1" class="rate_radio"><label
	                            for="rate1">★</label>
	                        <input type="radio" name="reviewStar" value="4" id="rate2" class="rate_radio"><label
	                            for="rate2">★</label>
	                        <input type="radio" name="reviewStar" value="3" id="rate3" class="rate_radio"><label
	                            for="rate3">★</label>
	                        <input type="radio" name="reviewStar" value="2" id="rate4" class="rate_radio"><label
	                            for="rate4">★</label>
	                        <input type="radio" name="reviewStar" value="1" id="rate5" class="rate_radio"><label
	                            for="rate5">★</label>
	                    </fieldset>
	                    </form>
	                    <div class="attached_file_box">
	                        <div class="input-file" id="data_file">
	                        <input type="text" readonly="readonly" class="file-name" />
							  <label for="upload02" class="file-label">찾아보기</label>
							  <input type="file" name="" id="upload02" class="file-upload" style="display:none;"/>
	                        </div>
	                    </div>
	            </div>
	            <div class="main_box">
	                <div class="write_box">
	                    <textarea name="review" id="wr_review" cols="115" rows="11" spellcheck="false" class="review_textarea" placeholder="5자 이상으로 작성해 주세요."/></textarea>
	                </div>
	                <div class="button_box">
	                    <button type="button" class="picture">사진 추가</button>
	                    <button type="button" class="registration">리뷰 등록</button>
	                </div>
	            </div>
        </div>
  </div>
  


 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
?v=<%=System.currentTimeMillis() %>   
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/review.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/file.js"></script>