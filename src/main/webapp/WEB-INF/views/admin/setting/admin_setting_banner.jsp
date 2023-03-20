<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- include header -->

    <%@ include file="../include/header.jsp" %>


        <!-- admin_home -->

        <body>

            <!-- include top search bar -->

            <%@ include file="../include/top_search_bar.jsp" %>

                <div class="container-fluid">
                    <div class="row">

                        <!-- include left Nav Bar -->
                        <%@ include file="../include/left_nav_bar.jsp" %>


                            <!-- content-container -->
                            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

                                <div class="row mt-4">
                                    <div class="col-lg-12">
                                        <div
                                            class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                            <div class="col p-4 d-flex flex-column position-static">
                                                <div class="d-flex flex-row justify-content-between">
                                                    <h3 class="mb-0 fw-bold mb-4">카드 제목</h3>
                                                    <button class="btn btn-primary btn-sm me-3" style="height: 30px;"
                                                        onclick="location.href='./reg'">옵션 버튼</button>
                                                </div>
                                                
                                                
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
											<td><input type="text" name="banner_name" class="form-control"
												value="${banner.banner_name}"></td>
											<td><input type="file" class="form-control"></td>
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
											<td><input type="text" name="banner_name" class="form-control" placeholder="배너명"></td>
											<td><input type="file" class="form-control"></td>
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
                                                


                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </main>

                    </div>
                </div>

                <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
                    integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
                    integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
                    crossorigin="anonymous"></script>
                <script src="dashboard.js"></script>
        </body>

        </html>