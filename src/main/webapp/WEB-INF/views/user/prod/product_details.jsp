<!-- 정수정, 제품 상세 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/header.jsp"%>
<c:set value="<%=request.getContextPath()%>" var="contextPath"></c:set>

<title>juhee custom - ${prod.p_name }</title>
<link rel="stylesheet" href="${contextPath}/assets/user/prod/css/cstm.css" />
<link rel="stylesheet" href="${contextPath}/assets/user/prod/css/product_detail.css" />
<script src="https://unpkg.com/konva@8.4.2/konva.min.js"></script>

<!-- main -->
<div id="main_container">
	<!--canvas-->
		<div id="main_canvas_container">
			<div id="menuBar">
				<label id="imageIcon" for="fileInput"> <span
					class="material-symbols-outlined loginCheck">imagesmode</span> <br /> 이미지 업로드
					<input type="file" multiple="multiple" id="fileInput"
					accept="image/*">
				</label> <label id="textIcon"> <span
					class="material-symbols-outlined loginCheck">format_shapes</span> <br /> 텍스트
				</label> <label id="sampleIcon"> <span
					class="material-symbols-outlined loginCheck">category</span> <br /> 샘플 아이콘
				</label>
			</div>
			<div id="outer">
				<div id="container-top"></div>
		
				<div id="settingPanelOuter">
					<div id="textSettingPanel" class="settingPanel">
						<div>글씨 스타일</div>
						<div>
							<div id="fontFamily">
								<div class="subTitle">글꼴</div>
								<select class="round_border" id="fontFamilyComboBox"
									onchange="changeFontFamily()">
								</select>
							</div>
							<div id="textAlignFontSize">
								<div id="textAlign" class="round_border">
									<span class="material-symbols-outlined">format_align_left</span>
									<span class="material-symbols-outlined">format_align_center</span>
									<span class="material-symbols-outlined">format_align_right</span>
								</div>
								<div id="fontSize" class="round_border">
									<span id="fontUpBtn" class="material-symbols-outlined">text_increase</span>
									<span id="fontDownBtn" class="material-symbols-outlined">text_decrease</span>
								</div>
							</div>
							<div id="textDecoration" class="round_border">
								<div class="textDecoration">
									<b>B</b>
								</div>
								<div class="textDecoration">
									<i>I</i>
								</div>
								<div class="textDecoration">U</div>
								<div class="textDecoration">S</div>
							</div>
						</div>
						<div id="textColorInformation">
							<div class="subTitle">글자색</div>
							<input type="color" id="color" />
						</div>
					</div>
		
					<div id="mainSettingPanel" class="settingPanel">
						<div id="productInformation">
							<div id="productName">${prod.p_name}</div>
							<div id="productPrice">${prod.p_price}</div>
						</div>
						<div id="colorInformation">
							<!-- DB에서 가져온 색들 중 선택된 색의 이름을 색상명에 넣음 -->
							<div>
								<b class="subTitle"> 색상 - <span id="colorName"
									data-imagePath="${color.pc_img_path}">${color.pc_name}</span>
								</b>
							</div>
							<div id="productColors">
								<!-- DB에서 가져온 해당 상품에 존재하는 색들의 값을 backgroundColor로 설정한 div 추가 -->
								<c:forEach items="${colors}" var="color">
									<div id="${color.value.pc_code}"
										data-name="${color.value.pc_name}"
										data-imagePath="${color.value.pc_img_path}"></div>
								</c:forEach>
							</div>
						</div>
						<!-- DB 조회해서 재고가 없으면 품절 표시 -->
						<!-- DB 조회해서 존재하는 사이즈 추가 -->
						<b class="subTitle">사이즈</b>
						<div id="productSizes">
							<c:forEach items="${sizes}" var="size">
								<div class="sizeHover">${size.ps_name}</div>
							</c:forEach>
						</div>
						<b class="subTitle">수량</b>
						<div id="productQuantity">
							<table class="quantityTable">
								<tr>
									<td class="minus" data-action="decrement"></td>
									<td id="quantity">1</td>
									<td class="plus" data-action="increment"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div id="buttons">
					<form action="<%=request.getContextPath()%>/order/directPurchase" method="POST" id="orderForm">
						<input type="submit" class="buttons loginCheck" id="directPurchase" value="바로 구매하기"/>
						<input type="hidden" id="cart_num" name="cart_num"/>
					</form>
					<button class="buttons loginCheck" id="intoCart">장바구니 담기</button>
				</div>
				
				<div id="menu">
					<button id="delete-button">Delete</button>
				</div>
			</div>
		</div>
	
	<div id="sampleIconPopUpBackground">
		<div id="sampleIconPopUp">
			<div id="sampleIconPopUpHeader">
				<div>샘플 아이콘</div>
				<span id="sampleIconPopUpCloseBtn">X</span>
			</div>
			<div id="sampleIcons"></div>
		</div>
	</div>
	<div id="cartPopUp">
		<div class="subTitle"></div>
	</div>
	
	<br> <br> <br> <br> <br>
	<!-- 상품 정보 -->
	<!-- 사이즈 정보 -->
	<div class="subject">사이즈</div>
	<table id="size_table">
		<tbody>
			<tr>
				<th>Size (cm)</th>
				<th>S(85)</th>
				<th>M(90)</th>
				<th>L(95)</th>
				<th>XL(100)</th>
				<th>2XL(105)</th>
				<th>3XL(110)</th>
			</tr>
			<tr>
				<th>총기장</th>
				<td>64</td>
				<td>65</td>
				<td>66.5</td>
				<td>69.5</td>
				<td>72</td>
				<td>75</td>
			</tr>
			<tr>
				<th>어깨넓이</th>
				<td>39</td>
				<td>42</td>
				<td>44</td>
				<td>47</td>
				<td>48</td>
				<td>51.5</td>
			</tr>
			<tr>
				<th>가슴둘레</th>
				<td>44.5</td>
				<td>46</td>
				<td>50</td>
				<td>53</td>
				<td>55</td>
				<td>58</td>
			</tr>
			<tr>
				<th>소매길이</th>
				<td>57</td>
				<td>57.5</td>
				<td>60</td>
				<td>61</td>
				<td>61.5</td>
				<td>64</td>
			</tr>
		</tbody>
	</table>


	<!-- 제작 가이드-->
	<span class="subject">제작 가이드</span>
	<div id="production_guide_container">
		<div class="tg_body">
			<div class="print_area">

				<h2>주의사항</h2>
				<ul class="list1">
					<li>배경이 투명한 PNG의 경우, CMYK 색상모드로 웹용(Save for Web) 저장해 주세요.<br />배경이
						꽉 찬 JPG의 경우, RGB 색상모드로 저장해 주세요.<br />이미지 크기는 최소 2500~3500px /
						해상도는 150dpi 이상으로 제작해 주세요.
					</li>
					<li>상품마다 이미지 크기가 다르므로, 해당 상품의 이미지 가이드를 확인해 주세요.</li>
					<li>작은 원본 이미지를 사이즈 규격에 맞게 임의로 크게 확대할 경우 인쇄 시 화질이 깨질 수 있습니다.</li>
					<li>상품 실측 사이즈를 반드시 확인해 주세요.</li>
					<li>인쇄를 원하시는 위치가 있을 시 [상품 제작 요청사항]에 남겨주시거나, 1:1 게시판 상담 또는
						고객센터(031-555-4449)로 전화 주세요.</li>
					<li>모니터, 핸드폰에 따라 실제 인쇄 색상과 다르게 보일 수 있습니다.</li>
				</ul>
				<br>
				<h2>교환/환불 불가 사항</h2>
				<p class="txt1">모든 상품은 고객 주문에 따라 개별 제작되는 방식으로 단순 변심을 포함, 아래의
					경우에는 교환 / 환불이 불가합니다.</p>
				<h3>- 디자인 시안 색상의 차이</h3>
				<p class="txt2">프린팅 방식과 원단 재질에 따른 경우의 수가 다양하므로 인쇄 후 모니터, 혹은 종이
					출력물과 색상 차이가 발생할 수 있습니다.</p>
				<h3>- 인쇄 위치 및 크기의 차이</h3>
				<p class="txt2">제품 재질에 따른 특성의 차이와 대부분의 인쇄가 수작업으로 이루어진다는 점에서 시안과
					실제 상품의 인쇄 위치 및 크기의 오차가 발생할 수 있습니다. 인쇄 위치 및 크기를 별도로 [요청] 하지 않은 주문건에
					대한 교환 또는 환불은 불가합니다.</p>
				<h3>- 추가 주문 시 기존 상품 색상과의 컬러 차이</h3>
				<p class="txt2">상품 컬러 및 사이즈는 제작 시기별, 생산시즌별로 원단 컬러와 사이즈 차이가 발생할 수
					있습니다.</p>
				<h3>- 화학 제품 사용으로 인한 손상</h3>
				<p class="txt2">우레탄 전사(PU Heat Transfer) 인쇄 제품에 솔벤트와 같은 용해력이 있는
					용매를 사용한 향수를 직접적으로 분사할 경우 인쇄 부분이 손상될 수 있으니 주의해 주세요.</p>
				<br>
				<h2>교환/환불 기간</h2>
				<p class="txt1">
					물품에 문제 되는 사항에 대해서는 수령 후 7일 이내 이메일 <a href="mailto:help@marpple.com">ezen@guri.academy</a>
					또는 고객센터로 연락주셔야 가능합니다.
				</p>
				<p class="txt1">
					★ 주문 완료 후 상품 및 이미지 변경을 원하실 경우 [제작준비중] 상태에서만 변경이 가능하며 [제작중]에는 변경 및
					취소가 불가합니다. 변경을 원하시는 경우 1:1 게시판 상담 및 고객센터(<a href="tel:031-555-4449">031-555-4449</a>)를
					통해 문의 바랍니다.
				</p>
			</div>
		</div>
	</div>
</div>
<div id="cartPopUp">
	<div class="subTitle">상품을 장바구니에 담았습니다.</div>
</div>
<!-- 리뷰 -->
   <div class="subject">고객 리뷰</div>
   <div id="main_review_container">
      <!--구매고객 총 평점-->
      <div id="customer_score_container">
         <div>구매 고객 총 평점</div>
         <div>
            <c:if test="${empty starAvg}">
              0
              </c:if>
            <c:if test="${not empty starAvg}">
               <fmt:formatNumber value="${starAvg }" pattern="#.##" />
            </c:if>
         </div>
         <div></div>
      </div>

      <div id="review_bar"></div>

      <!--사진 모아보기 (7개까지만)-->
      <div>
         <c:forEach var="r" items="${reviews }" begin="0" end="8">
            <c:if test="${empty r.review_image_path}">
            </c:if>
            <c:if test="${not empty r.review_image_path }">
               <img src="${r.review_image_path }" alt="" />
            </c:if>
         </c:forEach>

      </div>
   </div>

   <div id="separator"></div>

   <!--고객 리뷰-->
   <div id="customer_review_container">
      <c:forEach items="${reviews}" var="r">
         <div id="customer_each_review_container">
            <!--아이디-->
            <c:set var="mem_name" value="${r.mem_name }" />
            <div id="customer_review_user_id">${fn:substring(mem_name, 0, 2)}*
            </div>
            <!--리뷰-->
            <div id="review_container">
               <div id="customer_review_text_container">
                  <div id="customer_review_stars_container">
                     <span id="customer_review_stars"> <c:forEach begin="1"
                           end="${r.review_star }">★</c:forEach>
                        <c:forEach begin="1" end="${5-r.review_star}">☆</c:forEach>
                     </span> <span id="customer_review_stars_text">${r.review_star }</span> <span
                        id="customer_review_date"> <fmt:formatDate
                           pattern="MM.dd" value="${r.review_regdate }" />
                     </span>
                  </div>
                  <div id="customer_review_contents">${r.review_content }</div>
                  <c:if test="${empty r.review_image_path}">
                  </c:if>
                  <c:if test="${not empty r.review_image_path}">
                     <div>
                        <img src="${r.review_image_path }" alt="" />
                     </div>
                  </c:if>

               </div>
            </div>
         </div>
         <hr>
      </c:forEach>
   </div>

<script>
	console.log(contextPath);
	const mem_num = '${member.mem_num}';
	const p_num = '${prod.p_num}';
	const p_name = '${prod.p_name}';
	const p_price = '${prod.p_price}';
</script>

<script src="${contextPath}/assets/user/prod/js/cstm.js"></script>

<%@ include file="../common/footer.jsp"%>