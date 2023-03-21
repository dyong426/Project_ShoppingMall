<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include header -->

<%@ include file="../include/header.jsp"%>


<!-- admin_home -->

<body>

	<!-- include top search bar -->

	<%@ include file="../include/top_search_bar.jsp"%>

	<div class="container-fluid">
		<div class="row">

			<!-- include left Nav Bar -->
			<%@ include file="../include/left_nav_bar.jsp"%>


			<!-- content-container -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<div class="row mt-4">
					<div class="col-lg-12">
						<div
							class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
							<div class="col p-4 d-flex flex-column position-static">
								<div class="d-flex flex-row justify-content-between">
									<h3 class="mb-0 fw-bold mb-4">1:1 문의 게시판</h3>
									<button class="btn btn-primary btn-sm me-3"
										style="height: 30px;" onclick="location.href='./'">목록</button>
								</div>

								<div class="col-md-12">

									<form method="POST">
										<input type="hidden" name="contact_num"
											value="${content.contact_num}">
										<table class="table">
											<thead>
												<tr>
													<th style="width: 10%;"></th>
													<th style="width: 75%;"></th>
													<th style="width: 15%;"></th>
												</tr>
											</thead>
											<tbody>
												<tr class="table-secondary">
													<td>제목</td>
													<td>${content.contact_title}</td>
													<td>${content.contact_regdate}
														<button type="submit" class="btn btn-dark btn-sm"
															style="height: 30px;"
															formaction="/jhc/admin/contact/content/reply/delete">
															<i class="fa-solid fa-trash-can"></i>
														</button>
													</td>
												</tr>
												<tr class="table-light">
													<td>문의사항</td>
													<td colspan="2">[${content.cs_ctgr_name}]</td>
												</tr>
												<tr class="table-light">
													<td>작성자</td>
													<td colspan="2">${content.mem_name}
														(${content.mem_email})</td>
												</tr>
												<tr style="height: 300px;">
													<td colspan="3">${content.contact_content}</td>
												</tr>
												<tr>
													<td colspan="3">
														<c:forEach items="${csImages}"
															var="csImg">

															<img src="<%=request.getContextPath() %>/display/image?fileName=${csImg.contact_img}" />

														</c:forEach>
													</td>
												</tr>

												<c:choose>
													<c:when test="${null eq content.admin_reply}">
														<tr>
															<th colspan="3" class="badge text-bg-danger mt-3">
																답변 작성</th>
														</tr>
														<tr>
															<td colspan="3" id="admin_reply_form"><textarea
																	rows="5" cols="170" name="admin_reply"></textarea>
																<div class="d-flex justify-content-end">
																	<button type="submit" class="btn btn-sm btn-dark"
																		formaction="/jhc/admin/contact/content/reply/update">등록</button>
																</div></td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<th colspan="3" class="badge text-bg-primary mt-3">답변
																완료</th>
														</tr>
														<tr class="table-light">
															<td colspan="3">관리자 답변</td>
														</tr>
														<tr>
															<td colspan="3" id="admin_reply_reg_form"><textarea
																	class="form-control mb-3" style="height: 120px;"
																	id="admin_reply_reg" readonly>${content.admin_reply}</textarea>
																<div class="d-flex justify-content-end"
																	id="reply_button_form">
																	<button type="button" class="btn btn-dark">
																		<i class="fa-solid fa-pen"
																			onclick="modifyBtn(${content.contact_num})"></i>
																	</button>
																</div></td>
														</tr>

													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</form>
								</div>


							</div>
						</div>
					</div>
				</div>

			</main>

		</div>
	</div>

	<script
		src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>

</body>

</html>