<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">


<title>관리자 로그인</title>
</head>
<body>
	<c:if test="${login_error ne null}">
		<script type="text/javascript">

  			alert(`${login_error}`);

		</script>
	</c:if>

	<div class="d-flex justify-content-center align-items-center"
		style="border: solid 1px black; height: 100vh;">
		<form action="<%=request.getContextPath()%>/admin/login/loginAction.do" method="POST">
			<div class="row col-12">
				<div class="col-12 d-flex justify-content-center mb-4 me-5">
					<img
						src="<%=request.getContextPath()%>/assets/common/cstm_img/logo/logo.png"
						style="width: 200px;">
				</div>
				<div class="col-12">
					<div class="row col-12 mb-4">
						<label for="inputEmail3" class="col col-form-label">Email</label>
						<div class="col-12">
							<input type="email" name="admin_email" class="form-control" id="inputEmail3">
						</div>
					</div>
					<div class="row col-12 mb-4">
						<label for="inputPassword3" class="col col-form-label">Password</label>
						<div class="col-12">
							<input type="password" name="admin_pw" class="form-control" id="inputPassword3">
						</div>
					</div>
					<div class="col-11 d-flex justify-content-end ms-3">
						<button type="submit" class="btn btn-dark">로그인</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.js"></script>

</body>
</html>