<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/my_review2.css">

  <!-- main -->
  <div class="rv_container2">
        <div class="rv_body2">
            <div class="header_title2">
                <span class="my_review2">나의 리뷰</span>
            </div>
            <div class="header_tab">
                <div class="tab_left" type="order_list">
                    <a class="ok_review" href="<%=request.getContextPath() %>/writeable_reviews">작성 가능한 리뷰</a>
                </div>
                <div class="tab_right" type="review_list">내가 쓴 리뷰 </div>
            </div>
            <div class="wrote_review" total_count="0">
                <table class="wr_info">
                    <thead>
                        <tr>
                            <th  style="width: 180px;">주문일자[주문번호]</th>
                            <th style="width: 120px;">작성일자</th>
                            <th style="width: 260px;">내용</th>
                            <th style="width: 100px;">별점</th>
                            <th style="width: 100px;">내 사진</th>
                            <th style="width: 140px;">포인트</th>
                        </tr>
                    </thead>

                    <tbody class="wr_list">
                        <tr class="wr">
                            <td class="od_number">
                                2022-09-29
                                <p><a href="<%=request.getContextPath() %>/details" class="order_number">[20220929-0001079]</a></p>
                            </td >
                            <td class="wr_img">
                                2022-10-02
                            </td>
                            <td class="wr_check">
                                <strong class="wr_name">
                                    <div class="sentence">
                                        <a href="" class="ec_wr_name">실물 깡패 완전 존예입니다. 받자마자 너무 예뻐서 네이비로 재주문 함</a>
                                    </div>
                                </strong>
                            </td>
                            <td class="wr_amount">
                                <div class="star-ratings">
                                    <div 
                                    class="star-ratings-fill space-x-2 text-lg"
                                    :style="{ width: ratingToPercent + '%' }"
                                    >
                                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                    </div>
                                    <div class="star-ratings-base space-x-2 text-lg">
                                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <img id="picture" src="<%=request.getContextPath() %>/assets/common/cstm_img/착샷3.jpg" alt="">
                            </td>
                            <td>
                                <div class="point_clear">포인트 지급 완료</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
  </div>
  
  <!-- 팝업 창 --> 

<div class="main">
  <div class="modal">
    <div class="modal-content">
        <span class="close-button">&times;</span>
        <div class="title_box"><h1 class="title">리뷰</h1></div>
        <div class="pd_info">
          <div class="pd_image">
            <img src="../images/착샷2.jpg" alt="" style="width: 70px; height: 70px;">
          </div>
          <div class="pd_">
            <div class="pd_name">넘나 힙한 츄리닝 [Brown]</div>
            <div class="pd_price">29,000원</div>
          </div>
          <div class="point_clear2">포인트 지급 완료</div>
        </div>
        <div class="check_box">
          <form class="mb-1" name="myform" id="myform" method="post">
              <fieldset>
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
      </div>
        <form action="#post.php" method="POST">
          <textarea name="message" required="required" spellcheck="false"></textarea>
          <input type="submit" id="submit" value="수정하기">
        </form>
    </div>
  </div>
</div>

<script>
  var modal = document.querySelector(".modal");
	    var ec_wr_name = document.querySelector(".ec_wr_name");
	    var closeButton = document.querySelector(".close-button");


	    function toggleModal() {
	        modal.classList.toggle("show-modal");
	    }

	    function windowOnClick(event) {
	        if (event.target === modal) {
	            toggleModal();
	        }
	    }

	    ec_wr_name.addEventListener("click", toggleModal);
	    closeButton.addEventListener("click", toggleModal);
	    window.addEventListener("click", windowOnClick);
</script>

 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />