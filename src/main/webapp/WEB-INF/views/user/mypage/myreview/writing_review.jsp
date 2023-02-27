<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/wr_review.css">

  <!-- main -->
  <div class="rv_container2">
        <div class="rv_body2">
            <div class="header_title2">
                <span class="wr_review">리뷰 작성하기</span>
            </div>
            <div class="pd_info">
                <div class="pd_image">
                    <img style="width: 100px; height: 100px;" src="../images/착샷.jpg" alt="">
                </div>
                <div class="pd_check">
                    <div><span>보송보송 너무나도 예쁜 하얀 목티</span></div>
                    <div class="pd_color"><span>[White]</span></div>
                </div>
            </div>
            <div class="check_box">
                <form class="mb-1" name="myform" id="myform" method="post">
                    <fieldset>
                        <span class="text-bold">별점을 선택해주세요</span>
                        <input type="radio" name="reviewStar" value="5" id="rate1"><label
                            for="rate1">★</label>
                        <input type="radio" name="reviewStar" value="4" id="rate2"><label
                            for="rate2">★</label>
                        <input type="radio" name="reviewStar" value="3" id="rate3"><label
                            for="rate3">★</label>
                        <input type="radio" name="reviewStar" value="2" id="rate4"><label
                            for="rate4">★</label>
                        <input type="radio" name="reviewStar" value="1" id="rate5"><label
                            for="rate5">★</label>
                    </fieldset>
                </form>
                    <div class="attached_file_box">
                        <div class="attached_file">첨부파일</div>
                        <div class="data_file">착샷.jpg</div>
                    </div>
            </div>
            <div class="main_box">
                <div class="write_box">
                    <textarea name="review" id="wr_review" cols="115" rows="11" spellcheck="false"></textarea>
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

