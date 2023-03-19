<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include header -->

<%@ include file="../include/header.jsp"%>

<!-- admin_prod_reg -->

<body>

	<div class="main-container">

		<!-- include left Nav Bar -->

		<%@ include file="../include/left_nav_bar.jsp"%>


		<div class="content-container-prod">

			<div class="card grid-top">탑</div>

			<div class="card grid-main">

				<!-- Content wrapper -->
				<div class="card-header">회원정보 조회</div>
				<div class="card-body">

					<table class="table">
						<thead>
							<tr>
								<th scope="col">회원 번호</th>
								<th scope="col">이름</th>
								<th scope="col">E-mail</th>
								<th scope="col">포인트</th>
								<th scope="col">상세정보</th>
								<th scope="col">탈퇴</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${members}" var="member">

								<tr>
									<form method="POST">
									<th scope="row">${member.mem_num}</th>
									<td>${member.mem_name}</td>
									<td>${member.mem_email}</td>
									<td>${member.mem_point}</td>
									<td>
										<button type="button" class="btn btn-outline-secondary"
											id="member-detail" onclick="viewDetail(${member.mem_num})">회원상세보기</button>
									</td>
									<td>
										<input type="hidden" name="mem_num" value="${member.mem_num}">
										<button type="submit" class="btn btn-danger" formaction="/jhc/admin/member/delete">강제탈퇴</button>
									</td>
									</form>
								</tr>
							</c:forEach>
						</tbody>
					</table>


				</div>
				<!-- / Content -->
			</div>
		</div>


		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>