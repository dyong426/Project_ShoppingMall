<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ include file="../common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/home/css/category_clothes.css" />
<title>juhee custom - 의류</title>


  <div class="main_container_clothes">

    <!-- 사이드 바 -->
    <div id="clothes_main_side_bar">
      <!--카테고리 대분류-->
      <h3 class="clothes_category_major">의류</h3><br>
      <!--카테고리 소분류-->
      <ul class="category_list_detailed" style="list-style: none; padding-left: 0%;">
        <li><a>티셔츠</a></li>
        <li><a>후드</a></li>
        <li><a>맨투맨</a></li>
      </ul>
    </div>



    <!-- 본문 (상품)-->
    <div id="clothes_main_products">
      <!-- 검색 창 -->
      


    <div class="products_clothes">


      <img src="<%=request.getContextPath() %>/assets/common/cstm_img/의류1.jpg" alt="" /><br>
      <!--상품명-->
      <div class="product_name">끈이 긴 후드티</div>
      <!--상품가격-->
      <div class="product_price">￦30,000</div>
    </div>

    <div class="products_clothes">

      <img src="<%=request.getContextPath() %>/assets/common/cstm_img/의류4.jpg" alt="" /><br>
      <!--상품명-->
      <div class="product_name">끈이 긴 후드티</div>
      <!--상품가격-->
      <div class="product_price">￦30,000</div>
    </div>

    <div class="products_clothes">

      <img src="<%=request.getContextPath() %>/assets/common/cstm_img/의류3.jpg" alt="" /><br>
      <!--상품명-->
      <div class="product_name">끈이 긴 후드티</div>
      <!--상품가격-->
      <div class="product_price">￦30,000</div>
    </div>

    <div class="products_clothes">

      <img src="<%=request.getContextPath() %>/assets/common/cstm_img/의류2.jpg" alt="" /><br>
      <!--상품명-->
      <div class="product_name">끈이 긴 후드티</div>
      <!--상품가격-->
      <div class="product_price">￦30,000</div>
    </div>



  </div>

<%@ include file="../common/footer.jsp" %>