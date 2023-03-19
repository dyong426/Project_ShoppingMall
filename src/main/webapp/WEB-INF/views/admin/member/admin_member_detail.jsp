<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include header -->

<%@ include file="../include/header.jsp"%>

<!-- admin_prod_reg -->

<body>

	<div class="content-container-prod">

		<div class="card grid-main">

			<div class="card-header">회원 상세 정보</div>

			<div class="card-body d-flex align-items-start flex-column">
				<table class="basic-table">
					<tbody class="table-dark">
						<tr>
							<td class="d-flex align-items-start flex-column"><label
								class="fs-6 fw-light">회원번호</label> <label
								class="fs-2 fw-semibold">${member.mem_num}</label></td>
						</tr>

						<tr>
							<td class="d-flex align-items-start flex-column"><label
								class="fs-6 fw-light">이름</label> <label class="fs-2 fw-semibold">${member.mem_name}</label>
						
						<tr>
							<td class="d-flex align-items-start flex-column"><label
								class="fs-6 fw-light">이메일</label> <label
								class="fs-2 fw-semibold">${member.mem_email}</label></td>
						</tr>

						<tr>
							<td class="d-flex align-items-start flex-column"><label
								class="fs-6 fw-light">생년월일</label> <label
								class="fs-2 fw-semibold"> ${member.mem_birth}</label></td>
						</tr>


						<tr>
							<td class="d-flex align-items-start flex-column"><label
								class="fs-6 fw-light">연락처</label> <label
								class="fs-2 fw-semibold"> ${member.mem_phone} </label></td>
						</tr>

						<tr>
							<td class="d-flex align-items-start flex-column"><label
								class="fs-6 fw-light">포인트</label> <label
								class="fs-2 fw-semibold">${member.mem_point}</label></td>
						</tr>


						<tr>
							<td class="d-flex align-items-start flex-column"><label
								class="fs-6 fw-light">비고</label> <label class="fs-2 fw-semibold">
									<input type="text" value="${member.mem_note}">
							</label></td>
						</tr>


						<tr>
							<td class="d-flex align-items-start flex-column"><label
								class="fs-6 fw-light">등록일</label> <label
								class="fs-2 fw-semibold">${member.mem_regdate}</label></td>
						</tr>
					</tbody>
				</table>
				
				<label class="fs-6 fw-light">최근 주문 목록</label>
				<table class="table">
					<thead>
						<tr class="table-dark">
							<th>주문번호</th>
							<th>상품명</th>
							<th>색상</th>
							<th>사이즈</th>
							<th>이미지</th>
							<th>결제 금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="orderLists">
							<tr class="table-light">
								<c:choose>
									<c:when test="${empty orderLists.orderDetails}">
										<td></td>
										<td></td>
										<td>구매 정보 없음</td>
										<td></td>
										<td></td>
										<td></td>
										
									</c:when>
									<c:otherwise>
								<td>${orderLists.orderDetails.get(0).ord_date}</td>
									<td>
								<c:forEach items="${orderLists.orderDetails}" var="order">
									<span>${order.p_name}</span><br>
								</c:forEach>
									</td>
									<td>
								<c:forEach items="${orderLists.orderDetails}" var="order">
									<span>${order.pc_name}</span><br>
								</c:forEach>
									</td>
									<td>
								<c:forEach items="${orderLists.orderDetails}" var="order">
									<span>${order.ps_name}</span><br>
								</c:forEach>
									</td>
									<td>
								<c:forEach items="${orderLists.orderDetails}" var="order">
									<span><img src="${order.mem_cstm_path}"></span><br>
								</c:forEach>
									</td>
									<td>
								<c:forEach items="${orderLists.orderDetails}" var="order">
									<span>${order.od_amount}</span><br>
								</c:forEach>
									</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button class="btn btn-primary" onclick="closeWindow(this)">닫기</button>
			</div>
		</div>
	</div>


<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>