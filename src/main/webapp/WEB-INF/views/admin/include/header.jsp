<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">
<meta name=" viewport" content="width=device-width, initial-scale=1.0">
<title>Juhee Custom</title>


<!-- jquery -->
<script src="https://code.jquery.com/jquery-latest.js"></script>

<!-- 부트스트랩 -->
<script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
	
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<!-- 서머노트 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/summernote/summernote-lite.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/admin/summernote/summernote-lite.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/js/summernote.js"></script>

<!-- 폰트 어썸 -->
<script type="text/javascript" src="https://kit.fontawesome.com/2a15985a96.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/feather-icons"></script>
<!-- feather icon -->

<!-- Chart.js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src=" https://cdn.jsdelivr.net/npm/chart.umd.js.map"></script>
	
<link rel="stylesheet" href="/jhc/assets/admin/css/common.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/js/prod_view.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/js/prod_reg.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/js/file_upload.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/js/order_view.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/js/sales.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/js/member.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/js/contact.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/js/setting.js"></script>

<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">

    <style>
    	body{
    		background-color: smokewhite;
    	}
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/assets/admin/css/dashboard.css" rel="stylesheet">
  </head>