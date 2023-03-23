<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!-- include header -->

  <%@ include file="../include/header.jsp" %>


    <!-- admin_home -->

    <body>




  <%@ include file="../include/top_search_bar.jsp" %>







	<div class="container-fluid">
          <div class="row">

            <!-- include left Nav Bar -->
            <%@ include file="../include/left_nav_bar.jsp" %>


              <!-- main-container -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<div class="row mt-4">
					<div class="col-lg-12">
						<div
							class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
							<div class="col p-4 d-flex flex-column position-static">
								<div class="d-flex flex-row justify-content-between">
									<h3 class="mb-0 fw-bold mb-4">등록 상품</h3>
									
									<!-- 카테고리 선택 -->
									<div class="dropdown">
										<a class="btn btn-dark dropdown-toggle" href="#" role="button"
											data-bs-toggle="dropdown" aria-expanded="false"> 카테고리 종류 </a>
										<ul
											class="dropdown-menu dropdown-menu-dark gap-1 p-2 rounded-3 mx-0 border-0 shadow w-220px">
											<li><a class="dropdown-item rounded-2"
												href="<%=request.getContextPath()%>/admin/prod/view?currentPage=1">전체</a></li>
											
											<c:forEach items="${ctgrs}" var="ctgr">
												
												<li><a class="dropdown-item rounded-2"
												href="<%=request.getContextPath()%>/admin/prod/view?currentPage=1&category=${ctgr.m_ctgr_num}">${ctgr.m_ctgr_name}</a></li>
											
											</c:forEach>
											
										</ul>
									</div>
									

								</div>
								<table class="table text-center fw-bold">
									<thead>
										<tr class="table-dark">
											<th scope="col">카테고리</th>
											<th scope="col">분류</th>
											<th scope="col">제품번호</th>
											<th scope="col">제품명</th>
											<th scope="col">가격</th>
											<th scope="col">상세정보</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${prods}" var="prod">
											<tr class="prod-info">
												<td class="m-ctgr-name">${prod.m_ctgr_name}</td>
												<td class="s-ctgr-name">${prod.s_ctgr_name}</td>
												<td class="p-num">${prod.p_num}</td>
												<td class="p-name">${prod.p_name}</td>
												<td class="p-price">${prod.p_price}원</td>
												<td class="prod-detail-btn"><button type="button"
														class="btn btn-sm btn-outline-secondary"
														onclick="location.href=`./view/detail?p_num=${prod.p_num}`">제품상세보기</button></td>
												<td>
													<form method="POST">
														<input type="hidden" value="${prod.p_num}" name="p_num">
														<button type="submit" class="btn btn-sm btn-danger" formaction="/admin/prod/delete">등록삭제</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							
							
				<!-- 제품 등록 버튼 -->
				<div class="col-11 d-flex flex-row-reverse justify-content-start">

                  <button class="btn btn-primary btn-sm" style="height: 30px;"
                    onclick="location.href='./reg'">제품등록</button>

                </div>


				<!-- pagination -->
                <div class="d-flex justify-content-center">

                  <div>
                    <nav>
                      <ul class="pagination">
                      
                      <!-- pagination start -->
                      <!-- previous -->
                        <li class="page-item <c:if test='${paging.startPage < 6 }'>disabled</c:if>">
                          <a class="page-link" href="<%=request.getContextPath()%>/admin/prod/view?currentPage=${paging.startPage-1}&category=${param.m_ctgr_num}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                          </a>
                        </li>
					
						<!-- paging num -->
						<c:forEach var="pgNo" begin="${paging.startPage }" end="${paging.endPage }" step="1">		
							<li class="page-item <c:if test='${param.currentPage eq pgNo}'>active</c:if>">
								<a class="page-link" href="<%=request.getContextPath()%>/admin/prod/view?currentPage=${pgNo}&category=${param.m_ctgr_num}">${pgNo}</a>
							</li>
						</c:forEach>
						
					   <!-- next -->
                        <li class="page-item <c:if test='${paging.endPage >= paging.totalPages}'>disabled</c:if>">
                          <a class="page-link" href="<%=request.getContextPath()%>/admin/prod/view?currentPage=${paging.startPage+5}&category=${param.m_ctgr_num}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                          </a>
                        </li>
                        
                      </ul>
                    </nav>
                  </div>

                </div>
							
		
						</div>
					</div>

					<!-- main 끝 -->
			</main>

		</div>
        </div>

  <script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
    </body>
</html>