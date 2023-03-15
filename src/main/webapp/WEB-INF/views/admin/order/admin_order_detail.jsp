<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include header -->

<%@ include file="../include/header.jsp"%>

<!-- admin_prod_reg -->

<body>

	<div class="content-container-prod">

		<div class="card grid-main">

			<div class="card-header">주문 상세</div>

			<div class="card-body card-dflex-column">
			
			<div class="card-dflex-column">
				<label for="ord_num" class="badge text-bg-dark">주문번호</label>
				<label id="ord_num">${order.ord_num}</label>
				<label for="ord_date" class="badge text-bg-dark">주문날짜</label>
				<label id="ord_date">${order.ord_date}</label>
				<label for="ord_zipcode" class="badge text-bg-dark">배송지 우편번호</label>
				<label id="ord_zipcode">${order.ord_zipcode}</label>
				<label for="ord_addr1" class="badge text-bg-dark">배송지 주소1</label>
				<label id="ord_addr1">${order.ord_addr1}</label>
				<label for="ord_addr2" class="badge text-bg-dark">배송지 주소2</label>
				<label id="ord_addr2">${order.ord_addr2}</label>
				<label for="receiver_name"  class="badge text-bg-dark">수령자 이름</label>
				<label id="receiver_name">${order.receiver_name}</label>
				<label for="receiver_phone" class="badge text-bg-dark">수령자 연락처</label>
				<label id="receiver_phone">${order.receiver_phone}</label>
				<label for="ord_request" class="badge text-bg-dark">요청 사항</label>
				<label id="ord_request">${order.ord_request}</label>
			</div>
				
				<table class="basic-table" id="order_details">
					<thead>
						<tr>
							<th >주문 상세 번호</th>
							<th>제품명</th>
							<th>제품색상</th>
							<th>제품사이즈</th>
							<th>수량</th>
							<th>가격</th>
							<th>커스텀이미지</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderDetails}" var="od">
							<tr>
								<td>${od.od_num}</td>
								<td>${od.p_name}</td>
								<td>${od.pc_name}</td>
								<td>${od.ps_name}</td>
								<td>${od.od_quantity}</td>
								<td>${od.od_amount}</td>
								<td><img src="${od.mem_cstm_path}"></td>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
				<label for="total_amount" class="badge text-bg-dark">총 가격</label>
				<label id="total_amount" class="form-label">${order.total_amount}</label>
				
				
				
			
			</div>
			
		</div>
	</div>


<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>