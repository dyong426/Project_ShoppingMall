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

				<div class="card-header">설정</div>
		
		<!-- Content wrapper -->
				<div class="card-body d-flex flex-column">
                    <div class="row">

                        <div class="col-12">
                            <button type="button" class="btn btn-sales btn-secondary"
                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/mctgr'">메인카테고리</button>

                            <button type="button" class="btn btn-sales btn-secondary"
                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/sctgr'">서브카테고리</button>

                            <button type="button" class="btn btn-sales btn-dark"
                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/bn'">배너</button>

                            <button type="button" class="btn btn-sales btn-secondary"
                                onclick="location.href='<%=request.getContextPath()%>/admin/sales/monthly'">자주하는
                                질문</button>
                        </div>
                    </div>

                    <div class="row d-flex justify-content-center">
                        

                        <div class="col-lg-12">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>배너 이름</th>
                                        <th>배너 이미지</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
								<tbody>
									<c:forEach items="${banners}" var="banner">
											
											<form method="POST">
										<tr>
											<td><input type="text" name="banner_name" class="form_control"
												value="${banner.banner_name}"></td>
											<td><input type="file" class="form_control"></td>
											<td>
												<div>
													<img alt="배너이미지"
														src="/jhc/display/image?fileName=${banner.banner_img_path}" />
												</div>
											</td>
											<td>
												<input type="hidden" name="banner_img_path" value="${banner.banner_img_path}">
												<input type="hidden" name="banner_num" value="${banner.banner_num}">
												<button type="submit" class="btn btn-warning" formaction="/jhc/admin/setting/bn/modify">수정</button>
												<button type="submit" class="btn btn-danger" formaction="/jhc/admin/setting/bn/delete">삭제</button>
											</td>
										</tr>
											</form>
									</c:forEach>


									<tr>
										<form method="POST">
											<td><input type="text" name="banner_name" class="form_control" placeholder="배너명"></td>
											<td><input type="file" class="form_control"></td>
											<td>
												<div></div>
											</td>
											<td>
												<input type="hidden" name="banner_img_path">
												<button type="submit" class="btn btn-primary" formaction="/jhc/admin/setting/bn/reg">등록</button>
											</td>
										</form>
									</tr>
								</tbody>
							</table>
                        </div>
                    </div>
                        
                </div>
                
          
        <!-- / Content -->


		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>