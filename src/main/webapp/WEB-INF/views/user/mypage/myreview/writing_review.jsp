<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/wr_review.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/clipfile.css?ver1.1">




  <!-- main -->
  <div class="rv_container2">
        <div class="rv_body2">
            <div class="header_title2">
                <span class="wr_review">리뷰 작성하기</span>
            </div>
           
	            <div class="pd_info">
	            	<c:forEach items="${review_pd}" var="rp">
	                <div class="pd_image">
	                <!-- <input type="hidden" name="p_num" value="${ch.p_num}"> -->
	                    <img style="width: 100px; height: 100px;" src="<%=request.getContextPath() %>/${rp.origin_img_path}" alt="">
	                </div>
	                <div class="pd_check">
	                    <div><span>${rp.p_name}</span></div>
	                    <div class="pd_color"><span>${rp.pc_name}</span></div>
	                    <div class="ps_size">${rp.ps_name} size</div>
	                </div>
	                </c:forEach>
	            </div>
	            
	            <input type="hidden" name="rate" id="rate" value="0"/>
	            <div class="check_box">
	            <!-- <form action="/wrote_review" method="POST"> -->
	            	<div class="mb-1" name="myform" id="myform" >
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
	                    </div>
	              <!-- </form> -->
	            </div>
	            <div class="main_box">
	                <div class="write_box">
	                    <textarea name="review" id="wr_review" cols="131" rows="17" spellcheck="false" class="review_textarea" placeholder="5자 이상으로 작성해 주세요."/></textarea>
	                </div>
	                <table class="table_write">
					    <colgroup>
					        <col style="width:180px;"><col>
					    </colgroup>
					    <tbody>
					        <tr class="fileTR">
					            <th>첨부파일</th>
					            <td>
					           <!--  <form action="/saveImage" method="POST"> -->
					                <div class="ipt_file_area makeFlex ai_C">
					                    <div class="filebox makeFlex ai_FE">
					                        <input class="upload-name" placeholder="Image Name" disabled="disabled">
					                        <label>
					                            첨부
					                            <input type="file" class="upload-hidden" accept="image/png, image/gif, image/jpeg" onchange="uploadName(this)">
					                        </label>
					                    </div><!-- filebox -->
					
					                    <button class="btn_del" title="첨부파일 삭제" onclick="delFile(this)">삭제</button>
					                    <div class="clip_add" style="text-align:right;"><button title="사진 추가" id="btn_addFile" onclick="add_fileTR()" class="btn white noBDR wider">사진 추가</button></div>
					                </div><!-- ipt_file_area -->
					                <!-- </form> -->
					            </td>
					        </tr>
					    </tbody>
					    <tfoot>
					        <tr>
					            <th colspan="2" style="text-align:right; border:none;">
					                
					            </th>
					        </tr>
					    </tfoot>
					</table>
					
	                <div class="button_box" style="float:right">
	                <div></div>
	                    <button type="button" class="registration" >리뷰 등록</button>
	                </div>
	            </div>
	          
        </div>
  </div>
  


  


 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
?v=<%=System.currentTimeMillis() %>   
<script src="https://kit.fontawesome.com/3a90129dcf.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/clipfile.js?ver=1"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/review.js?ver=1"></script>

