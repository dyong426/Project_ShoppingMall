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
				
					<table  class="table">
						<thead>
							
							<tr class="table-dark align-center">
								<th style="width: 10%; text-align: center;">카테고리</th>
								<th style="width: 60%; text-align: center;">제목</th>
								<th style="width: 10%; text-align: center;">작성자</th>
								<th style="width: 10%; text-align: center;">작성일</th>
								<th style="width: 10%; text-align: center;">처리상태</th>
							</tr>

						</thead>
							
						<tbody>
								<c:forEach items="${contents}" var="content">
									
									<tr>
										<td style="text-align: center;">[${content.cs_ctgr_name }]</td>
										<td style="text-align: center;"><a href="<%=request.getContextPath()%>/admin/contact/content?contact_num=${content.contact_num}">${content.contact_title}</a></td>
										<td style="text-align: center;">${content.mem_name} (${content.mem_email})</td>
										<td style="text-align: center;">${content.contact_regdate}</td>
										<td style="text-align: center;">
											<c:choose>
												<c:when test="${null eq content.admin_reply}">
													<span class="badge text-bg-danger">답변 대기중</span>
												</c:when>
												<c:otherwise>
													<span class="badge text-bg-primary">답변 완료</sapn>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>					
							
						</tbody>
					
					</table>
				
				
				</div>
		
          
        <!-- / Content -->


		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>