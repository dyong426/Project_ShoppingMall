<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include header -->

<%@ include file="../include/header.jsp"%>

<!-- admin_prod_reg -->

<body>

	<div class="main-container">

		<!-- include left Nav Bar -->

		<%@ include file="../include/left_nav_bar.jsp"%>

		<!-- prod_reg content-container -->

		<div class="content-container-prod">

			<div class="card grid-top">탑</div>

			<div class="card grid-main">

				<div class="card-header">제품등록</div>

				<form class="row card-body" id="prod-reg-form"
					action="/jhc/admin/prod/reg" method="POST">
					<div class="col-md-6">
						<label for="main_category" class="form-label">메인 카테고리</label> <select
							id="main-category" name="m_ctgr_num" class="form-select"
							onchange="selectMain(this)">
							<option value="0">메인 카테고리</option>

							<c:forEach items="${mainCtgrs}" var="mainCtgr">
								<option value="${mainCtgr.m_ctgr_num}">${mainCtgr.m_ctgr_name}</option>
							</c:forEach>

						</select>
					</div>

					<div class="col-md-6">
						<label for="sub-category" class="form-label">서브 카테고리</label> <select
							id="sub-category" name="s_ctgr_num" class="form-select">
							<option>서브 카테고리</option>
							<c:forEach items="${sCtgrs}" var="sCtgr">
								<option value="${sCtgr.s_ctgr_num}">${sCtgr.s_ctgr_name}</option>
							</c:forEach>
						</select>
					</div>

					<div class="col-md-6">
						<label for="p_name" class="form-label">제품명</label> <input
							type="text" class="form-control" id="p_name" name="p_name"
							placeholder="제품명을 입력하세요">
					</div>
					<div class="col-md-6">
						<label for="p_price" class="form-label">가격</label> <input
							type="text" class="form-control" id="p_price" name="p_price"
							placeholder="가격을 입력하세요">
					</div>
					<div class="col-md-12">
						<label for="p_info_img_path" class="form-label">제품 정보 이미지</label>
						<input type="file" class="form-control file-upload"
							id="prod-upload-img" name="p_info_img_path" multiple>
						<div id="uploadResult" class="dflex-row">
							
						</div>
					</div>
					<div class="dflex-column col-md-12">
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
								<tr id="prodColors[0]">
									<td><input type="text" class="form-control"
										id="color-name0" name="prodColors[0].pc_name" /></td>
									<td><input type="color" class="form-control"
										id="color-code0" name="prodColors[0].pc_code" /></td>
									<td><input type="file" class="form-control" id="color-filename0" name="prodColors[0].pc_img_filename" onchange="inputColorImg(event)"/>
									</td>
									<td>
										<div id="prodColors[0]-uploadImg" class="pc-upload-result">
										
										</div>
									</td>
									<td>
										<button type="button"
											class="btn btn-plus fa-solid fa-circle-plus btn-primary"
											onclick="addColorBtn(event)"></button>
										<button type="button"
											class="btn btn-minus fa-solid fa-circle-minus btn-danger"
											style='display: none;' onclick="removeColorBtn(event)"></button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="dflex-column">
						<label for="prod-size-table">제품 사이즈 등록</label>
						<table class="table" id="prod-size-table">
							<thead>
								<tr>
									<th>사이즈</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="prod-size-table-body">
								<tr id="size0">
									<td><input type="text" class="form-control"
										id="size-name0" name="prodSizes[0].ps_name" /></td>
									<td>
										<button type="button"
											class="btn btn-plus fa-solid fa-circle-plus btn-primary"
											onclick="addSizeBtn(event)"></button>
										<button type="button"
											class="btn btn-minus fa-solid fa-circle-minus btn-danger"
											style='display: none;' onclick="removeSizeBtn(event)"></button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="summernote-container col-md-12">
					
					
					<!-- 브랜드 스토리 -->
						<label for="prod_explain_editor"></label>
						<textarea class="summernote" id="prod_explain_editor"
							name="prod_explain">
						
						<%@ include file="../include/prod_explain.txt"%>
						
						</textarea>
						<!-- 브랜드 스토리 끝 -->
						
						
						<label for="prod_info_editor" class="form-label">제품 상세 정보</label>


						<!-- 제품 상세 정보 -->
						<textarea class="summernote" id="prod_info_editor"
							name="prod_info">
						
						<%@ include file="../include/prod_info.jsp"%>
						
						</textarea>
					</div>

					<div class="col-md-12">
						<input type="submit" id='prod-reg-btn' class="btn btn-primary"
							form="prod-reg-form" value="등록">
					</div>
				</form>

			</div>
		</div>

		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>