<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="d-flex justify-content-center align-items-center"
		style="border: solid 1px black; height: 100vh;">
		<form action="" method="POST">
			<div class="row col-12">
				<div class="col-12">
					<img
						src="http://localhost:8888/jhc/assets/common/cstm_img/logo.png"
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
					<div class="col-12">
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>