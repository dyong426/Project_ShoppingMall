<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3 sidebar-sticky">
        <ul class="nav flex-column fs-5 fw-semibold">
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/main">
              <span  class="fa-solid fa-map align-text-bottom"></span>
              사이트 바로가기
            </a>
          </li>
          <li class="nav-item">
              <span class="align-text-bottom border-bottom"><hr></span>
          </li>
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/admin/home">
              <span class="fa-solid fa-table-columns align-text-bottom"></span>
              대쉬보드
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/order?currentPage=1">
              <span class="fa-solid fa-cart-arrow-down align-text-bottom"></span>
              주문관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/prod/view?currentPage=1">
              <span class="fa-solid fa-shirt align-text-bottom"></span>
              제품관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/sales">
              <span class="fa-solid fa-magnifying-glass-chart align-text-bottom"></span>
              매출차트
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/member">
              <span class="fa-solid fa-person align-text-bottom"></span>
              회원관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/contact">
              <span class="fa-solid fa-headset align-text-bottom"></span>
              게시판관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/setting/mctgr">
              <span class="fa-solid fa-wrench align-text-bottom"></span>
              설정
            </a>
          </li>
        </ul>    
    </nav>