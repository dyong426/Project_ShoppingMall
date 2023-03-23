<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/review/css/writeable_reviews.css">

  <!-- main -->
  <div class="rv_container">
    <div class="rv_body">
    
        <div class="header_title">
            <span class="my_review"><h1>나의 리뷰</h1></span>
        </div>
        
        
        <div class="header_tab">
            <div class="tab_left" type="order_list">작성 가능한 리뷰</div>
            <div class="tab_right" type="review_list">
                <a class="writed_review" href="<%=request.getContextPath() %>/review/list?page=1" style="text-decoration: none;">내가 쓴 리뷰</a>
            </div>
        </div>
        <div class="header_my_review">
            <div class="info1">
                작성 가능한 상품이 <span>${pd_count}</span> 개 있습니다.
            </div>
            <div class="info2">
                리뷰 작성 시 적립금 100P, 사진과 함께 리뷰를 작성해주시면 500P를 지급해 드립니다.
            </div>
            <div class="info2">
                단, 주문 금액이 크더라도, 상품별 금액이 3,000원 이하일 경우 리뷰작성시 50포인트, 사진과 함께 리뷰를 작성해주시면 150포인트 적립되는 점 참고 부탁드립니다.
            </div>
       
        </div>
        <div class="write_review">
            <table class="wr_info">
                <thead>
                    <tr>
                        <th  style="width: 170px;">주문번호</th>
                        <th style="width: 120px;">이미지</th>
                        <th style="width: 340px;">상품정보</th>
                        <th style="width: 120px;">색상</th>
                        <th style="width: 180px;">리뷰 작성</th>
                    </tr>
                </thead>
				
                <tbody class="wr_list">
               <c:forEach items="${pd_info}" var="pi" begin="${start }" end="${end }"> 
                    <tr class="wr">
                        <td class="od_number">
                            <c:set var="ord_num" value="${pi.ord_num}"/>
                            <p><a href="<%=request.getContextPath() %>/details?ord_num=${ord_num}" class="order_number">[${pi.new_order_num}]</a></p>
                        </td >
                        <td class="wr_img">
                            <a href=""><!-- 여기 클릭하면 판매 페이지로 이동 --></a>
                            <img style="width: 50px; height: 50px;" src="<%=request.getContextPath() %>/${pi.origin_img_path}" alt="상품 사진">
                        </td>
                        <td class="wr_check">
                            <strong class="wr_name">
                                <a href="" class="ec_wr_name" style="text-decoration: none;">${pi.p_name}</a>
                            </strong>
                        </td>
                        <td> 
                          <span>${pi.pc_name}</span>
                        </td>
                        <td class="wr_amount">
                            <button type="button" onclick="location.href='<%=request.getContextPath() %>/review/check?p_num=${pi.p_num}&pc_num=${pi.pc_num}&ps_num=${pi.ps_num}&od_num=${pi.od_num}'">리뷰 작성 하기</button>
                        </td>
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


<!-- 페이징 -->    
    <script>
    
	    let total = ${pd_count};
		
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
	        location.href = "/review/write?mem_num=${member.mem_num}&page=" + page;
	    }
    </script>
    
    
    
     <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
  </div>


	





