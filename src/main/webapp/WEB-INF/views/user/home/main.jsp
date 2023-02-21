 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="../common/header.jsp" %>

  <!-- main -->
  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
     <div class="carousel-indicators">
       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
     </div>
     <div class="carousel-inner">
       <div class="carousel-item active">
         <img src="assets/common/cstm_img/banners/banner1.jpg" class="d-block w-100" alt="...">
       </div>
       <div class="carousel-item">
         <img src="assets/common/cstm_img/banners/banner2.jpg" class="d-block w-100" alt="...">
       </div>
       <div class="carousel-item">
         <img src="assets/common/cstm_img/banners/banner3.jpg" class="d-block w-100" alt="...">
       </div>
         <div class="carousel-item">
         <img src="assets/common/cstm_img/banners/banner4.jpg" class="d-block w-100" alt="...">
       </div>
     </div>
     <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
       <span class="carousel-control-prev-icon" aria-hidden="true"></span>
       <span class="visually-hidden">Previous</span>
     </button>
     <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
       <span class="carousel-control-next-icon" aria-hidden="true"></span>
       <span class="visually-hidden">Next</span>
     </button>
   </div>

  <div id="category_container">
    <div id="home-category-item__btns" class="">
      <a href="category_clothes.html">
        <div class="home-category-item__bg" style="background-color: #F5B959;">
          <img width=100px src="assets/common/cstm_img/의류.png" alt="">
        </div>
      </a>
      <a href="#">
        <div class="home-category-item__bg" style="background-color: #945335;">
          <img width=100px src="assets/common/cstm_img/액자.png" alt="">
        </div>
      </a>
      <a href="#">
        <div class="home-category-item__bg" style="background-color: #B86C96;">
          <img width=100px src="assets/common/cstm_img/폰케이스.png" alt="">
        </div>
      </a>
      <a href="#">
        <div class="home-category-item__bg" style="background-color: #4B3733;">
          <img width=100px src="assets/common/cstm_img/홈데코.png" alt="">
        </div>
      </a>
    </div>


    <div class="home-category-item__txt">
      <div class="home-category-item__name">의류</div>
      <div class="home-category-item__name">액자</div>
      <div class="home-category-item__name">폰케이스/테크</div>
      <div class="home-category-item__name">홈데코/리빙</div>
    </div>

  </div>


	<!-- 내가 만드는 나만의 상품 -->
	<div class="main_subject_text">내가 만드는 나만의 상품</div>
		<div class="main_container_madeByMe">
		
			<a><img src="assets/common/cstm_img/main_madeByMe/madeByMe1.png"></a>
			<a><img src="assets/common/cstm_img/main_madeByMe/madeByMe2.jpg"></a>
			<a><img src="assets/common/cstm_img/main_madeByMe/madeByMe3.jpg"></a>
			<a><img src="assets/common/cstm_img/main_madeByMe/madeByMe4.jpg"></a>
		</div>
		
   <!-- 리뷰 -->
  <div class="main_subject_text" >회원 리뷰</div>
  <div id="main_reviews" class="container d-flex justify-content-center">
    <div class="card" style="width: 18rem;">
      <img src="assets/common/cstm_img/착샷.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <span>★★★</span>
        <p class="card-text">따뜻한 후드티네요</p>
        <span class="review_date">2023-02-11 </span>
        <span class="review_user">정수*</span>
      </div>
    </div>
    <div class="card" style="width: 18rem;">
      <img src="assets/common/cstm_img/착샷2.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <span>★★★★</span>
        <p class="card-text">세트로 샀어요 맘에 들어요 놀러...</p>
        <span class="review_date">2023-02-11 </span>
        <span class="review_user">구지*</span>
      </div>
    </div>
    <div class="card" style="width: 18rem;">
      <img src="assets/common/cstm_img/착샷3.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <span>★★★★★</span>
        <p class="card-text">강아지 옷 잘하네요</p>
        <span class="review_date">2023-02-11 </span>
        <span class="review_user">강경*</span>
      </div>
    </div>
    <div class="card" style="width: 18rem;">
      <img src="assets/common/cstm_img/착샷4.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <span>★★★★★</span>
        <p class="card-text">친구들끼리 옷 맞췄어요</p>
        <span class="review_date">2023-01-16 </span>
        <span class="review_user">이동*</span>
      </div>
    </div>

  </div>

 <br><br><br>

<%@ include file="../common/footer.jsp" %>