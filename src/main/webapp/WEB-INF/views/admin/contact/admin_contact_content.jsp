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

				<div class="card-header">1:1 문의</div>
		
		<!-- Content wrapper -->
		
					<div class="card-body">
					
						<table class="table">
						<form action="/jhc/admin/contact/content/reply/delete" method="GET" id="reply_delete_form">
						<input type="hidden" value="${content.contact_num}" form="reply_delete_form">
							<tbody>
								<tr class="table-secondary">
									<td style="width: 80%;">${content.contact_title}</td>
									<td>${content.contact_regdate}</td>
								</tr>
								<tr class="table-light">
									<td colspan=2>[${content.cs_ctgr_name}]</td>
								</tr>
								<tr class="table-light">
									<td colspan=2>${content.mem_name} (${content.mem_email})</td>
								</tr>
								<tr style="height:70%;">
									<td colspan=2>${content.contact_content}</td>
								</tr>
								<tr style="width: 100%;"class="d-flex align-items-start flex-row">
									<td  colspan=2>
										<img src="<%=request.getContextPath() %>/assets/common/cstm_img/의류.png" />
									
										<img src="<%=request.getContextPath() %>/assets/common/cstm_img/의류.png" />
									
										<img src="<%=request.getContextPath() %>/assets/common/cstm_img/의류.png" />
									</td>
								</tr>
								
								<c:choose>
									<c:when test="${null eq content.admin_reply}">
										<tr>
											<th colspan=2 class="badge text-bg-primary">답변 작성</th>
										</tr>
										<tr>
											<td id="admin_reply_form">
												<textarea rows="5" cols="220" id="admin_reply_input"></textarea>
											</td>
											<td>
												<input type="submit" value="등록" class="button text-bg-light" style="height: 120px;"/>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th colspan=2 class="badge text-bg-primary">답변</th>
										</tr>
										<tr class="table-light">
											<td colspan=2>관리자</td>
										</tr>
										<tr>
											<td id="admin_reply_reg_form">
												<textarea class="form-control"  style="height: 120px;" id="admin_reply_reg" readonly>${content.admin_reply}</textarea>
											</td>
											<td class="d-flex flex-row" id="reply_button_form">
												<button type="button" class="form-control" style="width: 50px;"><i class="fa-solid fa-pen" onclick="modifyBtn(${content.contact_num})"></i></button>
												<button type="submit" class="form-control" form="reply_delete_form" style="width: 50px;"><i class="fa-solid fa-trash-can"></i></button>
												
											</td>
										</tr>
									
									</c:otherwise>
								</c:choose>								
							</tbody>
						</form>
						</table>
					
					</div>
			</div>
          
        <!-- / Content -->
		</div>

		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>