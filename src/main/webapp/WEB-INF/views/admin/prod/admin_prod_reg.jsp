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
            <div class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
              <div class="col p-4 d-flex flex-column position-static">
                <div class="d-flex flex-row justify-content-between">
                  <h3 class="mb-0 fw-bold mb-4">제품 정보 입력</h3>
                  <button class="btn btn-sm btn-primary" onclick="location.href='./view'" style="height: 30px;">뒤로가기</button>
                </div>
                <form class="row" id="prod-reg-form" action="/admin/prod/reg" method="POST">
                  <div class="col-md-6 mb-3">
                    <label for="main_category" class="form-label">메인 카테고리</label> <select id="main-category"
                      name="m_ctgr_num" class="form-select" onchange="selectMain(this)">
                      <option value="0">메인 카테고리</option>

                      <c:forEach items="${mainCtgrs}" var="mainCtgr">
                        <option value="${mainCtgr.m_ctgr_num}">${mainCtgr.m_ctgr_name}</option>
                      </c:forEach>

                    </select>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label for="sub-category" class="form-label">서브 카테고리</label> <select id="sub-category"
                      name="s_ctgr_num" class="form-select">
                      <option>서브 카테고리</option>
                      <c:forEach items="${sCtgrs}" var="sCtgr">
                        <option value="${sCtgr.s_ctgr_num}">${sCtgr.s_ctgr_name}</option>
                      </c:forEach>
                    </select>
                  </div>

                  <div class="col-md-6 mb-3">
                    <label for="p_name" class="form-label">제품명</label> <input type="text" class="form-control"
                      id="p_name" name="p_name" placeholder="제품명을 입력하세요">
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="p_price" class="form-label">가격</label> <input type="text" class="form-control"
                      id="p_price" name="p_price" placeholder="가격을 입력하세요">
                  </div>
                  <div class="col-md-12 mb-3">
                    <label for="p_info_img_path" class="form-label">제품 정보 이미지</label>
                    <input type="file" class="form-control file-upload" id="prod-upload-img" name="p_info_img_path"
                      onchange="uploadProdImg(this)">
                    <div id="uploadResult" class="d-flex flex-row">

                    </div>
                  </div>
                <div class="col-lg-12 d-flex flex-row justify-content-between mb-3">
                  <div class="d-flex flex-column col-md-6">
                    <label for="prod_color_table">제품 색상 등록</label>
                    <table class="table" id="prod_color_table">
                      <thead>
                        <tr>
                          <th class="col-3">색상</th>
                          <th class="col-1">코드</th>
                          <th>이미지</th>
                          <th></th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody id="prod-color-table-body">
                        <tr id="prodColors0">
                          <td><input type="text" class="form-control" id="color-name0" name="prodColors[0].pc_name" />
                          </td>
                          <td><input type="color" class="form-control-color" id="color-code0" name="prodColors[0].pc_code" />
                          </td>
                          <td><input type="file" class="form-control" id="color-filename0"
                              name="prodColors[0].pc_img_filename" onchange="inputColorImg(event)" />
                          </td>
                          <td>
                            <div id="prodColors[0]-uploadImg" class="pc-upload-result">

                            </div>
                          </td>
                          <td>
                            <button type="button" class="btn btn-plus fa-solid fa-circle-plus btn-primary"
                              onclick="addColorBtn(event)"></button>
                            <button type="button" class="btn btn-minus fa-solid fa-circle-minus btn-danger"
                              style='display: none;' onclick="removeColorBtn(event)"></button>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="d-flex flex-column col-md-3 mb-3">
                    <label for="prod-size-table">제품 사이즈 등록</label>
                    <table class="table" id="prod-size-table">
                      <thead>
                        <tr>
                          <th>사이즈</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody id="prod-size-table-body">
                        <tr id="prodSizes0">
                          <td><input type="text" class="form-control" id="size-name0" name="prodSizes[0].ps_name" />
                          </td>
                          <td>
                            <button type="button" class="btn btn-plus fa-solid fa-circle-plus btn-primary"
                              onclick="addSizeBtn(event)"></button>
                            <button type="button" class="btn btn-minus fa-solid fa-circle-minus btn-danger"
                              style='display: none;' onclick="removeSizeBtn(event)"></button>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>                  


              </div>
            </div>
          </div>
        </div>
        <div class="row mt-4">
          <div class="col-lg-12">
            <div class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
              <div class="col p-4 d-flex flex-column position-static">
                <div class="d-flex flex-row justify-content-between">
                  <h3 class="mb-0 fw-bold mb-4">상세 정보 입력</h3>
                </div>
                <div class="summernote-container col-md-6 d-flex flex-column">
                  <!-- 브랜드 스토리 -->
                  <label for="prod_explain_editor">브랜드 설명</label>
                  <textarea class="summernote" id="prod_explain_editor" name="prod_explain">

                      <%@ include file="../include/prod_explain.txt"%>
                      
                    </textarea>
                  <!-- 브랜드 스토리 끝 -->


                  <label for="prod_info_editor" class="form-label">제품 상세 정보</label>


                  <!-- 제품 상세 정보 -->
                  <textarea class="summernote" id="prod_info_editor" name="prod_info">

                      <%@ include file="../include/prod_info.jsp"%>
                      
                    </textarea>
                </div>

                <div class="col-md-12 d-flex justify-content-end">
                  <input type="submit" id='prod-reg-btn' class="btn btn-primary mt-2" form="prod-reg-form" value="등록">
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>

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