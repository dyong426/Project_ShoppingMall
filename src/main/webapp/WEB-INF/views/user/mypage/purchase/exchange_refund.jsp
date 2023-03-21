<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/er.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <!-- main -->
  <div class="er_background">
        <div class="er_body">
            <h2>교환/환불 신청하기</h2>
                <div class="er_contents">
                        <div class="er_info">
                            <div>
                                주문번호&nbsp;&nbsp;<a href="/jhc/details?ord_num=${order.ord_num }">[${order.new_order_num }]</a>
                            </div>
                        </div>
                            <div class="er_guide_box">
                                <span class="er_guide">교환/환불 안내</span> <br>
                                <span class="er_explanation">교환 및 반품 신청 페이지에 모든 항목을 기재하신 후, 상품을 우체국을 이용해 착불로 보내주세요.</span>
                            </div>

                            <br>
                            <br>
                            
                            <div class="er_form">
                                <div class="category_box" id="ct_box">
                                    <div class="radio_box">
                                        <input type="radio" name="er" id="exchange" value="6" onclick="javascript:contentsView('exchange');" checked><label for="" class="radio_label">&nbsp;교환</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="er" id="refund" value="7" onclick="javascript:contentsView('refund');" ><label for="" class="radio_label">&nbsp;반품</label>
                                    </div>
                                    <div id="sb1">
                                        <div class="select_box" >
                                            <select name="" id="mySelect1">
                                                <option selected>교환사유를 선택해주세요</option>
                                                <option value="상품훼손">상품훼손</option>
                                                <option value="사이즈 변경">사이즈 변경</option>
                                                <option value="상품정보와 상이">상품정보와 상이</option>
                                            </select>
                                        </div>
                                        <div class="detailed_reason">
                                            <textarea name="er_reason" id="er_reason" cols="50" rows="12" placeholder="상세사유를 입력해주세요(선택사항)"></textarea>
                                        </div>
                                    </div>
                                    <div id="sb2" style="display:none;">
                                        <div class="select_box"  >
                                            <select name="" id="mySelect2">
                                                <option selected>반품사유를 선택해주세요</option>
                                                <option value="상품훼손">상품훼손</option>
                                                <option value="배송지연">배송지연</option>
                                                <option value="상품정보와 상이">상품정보와 상이</option>
                                            </select>
                                        </div>
                                        <div class="detailed_reason">
                                            <textarea name="er_reason" id="er_reason" cols="50" rows="4" placeholder="상세사유를 입력해주세요(선택사항)"></textarea>
                                        </div>
                                        <div class="bank_info">
                                            <div class="bank">
                                                <input type="text" placeholder="은행명" >
                                            </div>
                                            <div class="bank_number">
                                                <input type="text" placeholder="계좌번호" >
                                            </div>
                                            <div class="bank_user">
                                                <input type="text" placeholder="예금주">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="er_pd_box">
                                    <div class="or_info" id="sb3" style="display:none;">
                                        <div class="er_pd_title"><span>반품 상품 선택</span></div>
                                        <div class="or_pd_info">
                                        <table>
                                        <tbody class="product_link">
		                                    
			                                    <c:forEach items="${orderDetails }" var="od">
			                               
			                                        <tr class="link_record">
														<td>
															<input type="checkbox" id="myCheckbox2" value="${od.od_amount }" onclick="selectCheck2(); calculate(this); total_calculate(this);" >
														</td>
			                                            <td class="thumb">                                              
			                                               <img id="pd_img" src="<%=request.getContextPath() %>/${od.origin_img_path }" alt="상품 사진">       
			                                            </td>
			                                            <td class="product_info">
			                                                    <a href="/jhc/product_details?p_num=${od.p_num}">${od.p_name }</a>                            
			                                                <div class="option"></div>
			                                            </td>
			                                            <td>${od.od_quantity}</td>
			                                            <td class="product_price">
			                                                <div>
			                                                    <fmt:formatNumber value="${od.od_amount }" type="currency" currencySymbol="￦" />
			                                                </div>
			                                              
			                                            </td>
			                                           
		                                        	</tr>
		                                        </c:forEach>
		                                    </tbody>
                                        </table>
                                            
                                        </div>
                                    </div>
                                    <div class="or_info" id="sb4">
                                        <div class="er_pd_title"><span>교환 상품 선택</span></div>
                                        <table>
                                        <tbody class="product_link">
		                                    
			                                    <c:forEach items="${orderDetails }" var="od">
			                               
			                                        <tr class="link_record">
														<td>
															<input type="checkbox" id="myCheckbox1" value="${od.od_amount }" onclick="selectCheck();" >
														</td>
			                                            <td class="thumb">                                              
			                                               <img id="pd_img" src="<%=request.getContextPath() %>/${od.origin_img_path }" alt="상품 사진">       
			                                            </td>
			                                            <td class="product_info">
			                                                    <a href="/jhc/product_details?p_num=${od.p_num}">${od.p_name }</a>                            
			                                                <div class="option"></div>
			                                            </td>
			                                            <td>${od.od_quantity}</td>
			                                            <td class="product_price">
			                                                <div>
			                                                    <fmt:formatNumber value="${od.od_amount }" type="currency" currencySymbol="￦" />
			                                                </div>
			                                              
			                                            </td>
			                                           
		                                        	</tr>
		                                        </c:forEach>
		                                    </tbody>
                                        </table>
                                    </div>
                                    <div id="sb5" class="or_price" style="display:none;">
                                        <div class="er_pd_title"><span>환불 예정 금액</span></div>
                                        <div class="double_ck">
                                            <div class="pd_price">
                                                <div>취소 상품 금액 합계</div>
                                                <div><input type ="text" id="cancle_price" value="0" disabled></div>원
                                            </div>
                                            <div class="pd_price">
                                                <div>취소 배송비 합계</div>
                                                <div>3,000원</div>
                                            </div>
                                        </div>
                                        <div class="er_total_price">
                                            <div class="total_title"><span>환불상품 총 금액 합계</span></div>
                                            <div><input type ="text" id="total_price" value="3000" disabled></div>원
                                        </div>
                                    </div>
                                </div>
                            </div>
           </div>
                 <div class="Ok_btn">
                            	<script>
	                              const ord_num = parseInt("${order.ord_num}");
								</script>
	                          <button type="button" class="exchange_and_return" id="sb6"
	                          onclick="location.href='<%=request.getContextPath() %>/order/er/exchange?ord_num=${order.ord_num}'" >교환 신청하기</button>
	                          <button type="button" class="exchange_and_return" id="sb7" style="display:none;"
	                          onclick="location.href='<%=request.getContextPath() %>/order/er/refund?ord_num=${order.ord_num}'">반품 신청하기</button>
                            </div>
        </div>
  </div>
  
   <!-- 사유 체크 여부 -->
 <script>
 function selectCheck() {
	 const mySelect1 = document.getElementById("mySelect1");
		const selectedOption1 = mySelect1.options[mySelect1.selectedIndex].value;
		const sum1 = 0;
		
		const test = ${order.ord_num}
	    if (selectedOption1 === "상품훼손" || selectedOption1 === "사이즈 변경" || selectedOption1 === "상품정보와 상이") {
	        return true;
	    } else {
	    	alert("교환 사유를 선택해주세요");
	    	 event.preventDefault();
	    	 
	                sum1 += parseInt(0);
	             document.getElementById("total_price").value = sum1; 
	             return false;
	         }
	    	
	    }
 

 </script>
 
 <script>
 function selectCheck2() {
	  const mySelect2 = document.getElementById("mySelect2");
		const selectedOption2 = mySelect2.options[mySelect2.selectedIndex].value;
		const removePrice = document.getElementById("cancle_price");
		const removeTotalPrice = document.getElementById("total_price");
		const sum2 = 0;
		
	    if (selectedOption2 === "상품훼손" || selectedOption2 === "배송지연" || selectedOption2 === "상품정보와 상이") {
	        return true;
	    } else {
	    	alert("반품 사유를 선택해주세요");
	    	 event.preventDefault();
	    	 
            sum2 += parseInt(0);
        	document.getElementById("total_price").value = sum2;
	    	return false;
	    }
	    
}
 </script>
 
 <!--  
  <script>
  function pd_checked(box){
	     if(box.unchecked)
	    	 alert("교환할 상품을 선택해주세요");
	     	return false;
	     else    
	    	 return true;
	 }
  </script> -->
  
  <!-- 교환, 환불 버튼으로 보여지는 div 변경 -->
  <script>
	  function contentsView(id) {
		    var sb1 = document.getElementById("sb1"); // 교환
		    var sb2 = document.getElementById("sb2"); // 환불
		    
		    var sb3 = document.getElementById("sb3"); // 환불
		    var sb4 = document.getElementById("sb4"); // 교환
		    
		    var sb5 = document.getElementById("sb5"); // 환불 금액 페이지
		    
		    var sb6 = document.getElementById("sb6"); // 교환 버튼
		    var sb7 = document.getElementById("sb7"); // 환불 버튼
		    

		    if( id === "exchange" ) { // 교환
		    	sb1.style.display = "block";    
		    	sb2.style.display = "none";
		    	sb3.style.display = "none";
		    	sb4.style.display = "block";    		    	
		    	sb5.style.display = "none";
		    	sb6.style.display = "block";
		    	sb7.style.display = "none";
		    } else { // 환불
		    	sb1.style.display = "none";    
		    	sb2.style.display = "block";
		    	sb3.style.display = "block";
		    	sb4.style.display = "none";    		    	
		    	sb5.style.display = "block";  
		    	sb6.style.display = "none";
		    	sb7.style.display = "block";
		    }
		    
		   
		}
	 
  </script>
  
  
  <!-- 체크를 통해 취소 금액 합산 -->
  <script>
	 
	  var sum1 = 0;
      function calculate(box){
          if(box.checked) 
              sum1 += parseInt(box.value); 
          else    
              sum1 -= parseInt(box.value);
          document.getElementById("cancle_price").value = sum1; 
      }
  </script>
  
  <!-- 체크를 통해 취소 금액 합산 (배송비 포함) -->
   <script>
	 
	  var sum2 = 3000;
      function total_calculate(box){
          if(box.checked) // 체크가 되면 checed==true라는 값을 전달받는다. 
              sum2 += parseInt(box.value); //value속성을 이용
          else    
              sum2 -= parseInt(box.value);
          document.getElementById("total_price").value = sum2; //getElementById메소드 이용&value속성 변경
      }
  </script>
  
<footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />