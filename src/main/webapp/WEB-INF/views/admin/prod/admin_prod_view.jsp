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


              <!-- main-container -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<div class="row mt-4">
					<div class="col-lg-12">
						<div
							class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
							<div class="col p-4 d-flex flex-column position-static">
								<div class="d-flex flex-row justify-content-between">
									<h3 class="mb-0 fw-bold mb-4">등록 상품</h3>
									<button class="btn btn-primary btn-sm" style="height: 30px;" onclick="location.href='./reg'">제품등록</button>
								</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th scope="col">메인카테고리</th>
											<th scope="col">서브카테고리</th>
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
														<button type="submit" class="btn btn-sm btn-danger" formaction="/jhc/admin/prod/delete">등록삭제</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- main 끝 -->
			</main>

		</div>
        </div>

  <script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/assets/admin/js/dashboard.js"></script>
    </body>
</html>