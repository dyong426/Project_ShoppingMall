<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3 sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/main">
              <span data-feather="file-text" class="align-text-bottom"></span>
              사이트 바로가기
            </a>
          </li>
          <li class="nav-item">
              <span class="align-text-bottom border-bottom"><hr></span>
          </li>
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/admin/home">
              <span data-feather="home" class="align-text-bottom"></span>
              대쉬보드
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/order">
              <span data-feather="file" class="align-text-bottom"></span>
              주문관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/prod/view">
              <span data-feather="shopping-cart" class="align-text-bottom"></span>
              제품관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/sales">
              <span data-feather="bar-chart-2" class="align-text-bottom"></span>
              매출차트
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/member">
              <span data-feather="users" class="align-text-bottom"></span>
              회원관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/contact">
              <span data-feather="edit" class="align-text-bottom"></span>
              게시판관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/setting">
              <span data-feather="tool" class="align-text-bottom"></span>
              설정
            </a>
          </li>
        </ul>    
    </nav>