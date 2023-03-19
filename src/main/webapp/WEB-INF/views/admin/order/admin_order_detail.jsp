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
			
			<div class="d-flex flex-row justify-content-between">
				<div>
				<table class="table">
					<thead>
						<tr class="table-dark">
							<td class="fw-semibold">주문자 정보</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="table-secondary"><label class="badge text-bg-dark">회원 이름</label></th>
							<td><label id="mem_num">${order.mem_name}</label><td>
						</tr>
                        <tr>
                            <th class="table-secondary"><label class="badge text-bg-dark">회원 이메일</label></th>
                            <td><label id="mem_email">${order.mem_email}</label></td>        
                        </tr>
                        <tr>
                            <th class="table-secondary"><label class="badge text-bg-dark">회원 연락처</label></th>
                            <td><label id="mem_phone">${order.mem_phone}</label></td>        
                        </tr>
                        <tr>
                            <th class="table-secondary"><label class="badge text-bg-dark">결제</label></th>
                            <td><label id="payment_name">${order.payment_name}</label></td>        
                        </tr>
					</tbody>
				</table>
				</div>
			
				<div>
				<table class="table">
					<thead>
						<tr class="table-dark">
							<td class="fw-semibold">수령자 정보</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="table-secondary"><label for="ord_num" class="badge text-bg-dark">주문번호</label></th>
							<td><label id="ord_num">${order.ord_num}</label><td>
						</tr>
						<tr>
                            <th class="table-secondary"><label for="ord_date" class="badge text-bg-dark">주문날짜</label></th>
                            <td><label id="ord_date">${order.ord_date}</label></td>
                        </tr>
                        <tr>
                            <th class="table-secondary"><label for="receiver_name"  class="badge text-bg-dark">수령자 이름</label></th>
                            <td><label id="receiver_name">${order.receiver_name}</label></td>        
                        </tr>
                        <tr>
                            <th class="table-secondary"><label for="receiver_phone" class="badge text-bg-dark">수령자 연락처</label></th>
                            <td><label id="receiver_phone">${order.receiver_phone}</label></td>        
                        </tr>
						<tr rowspan="3">
							<th class="table-secondary"></th>
                            <td><label id="ord_zipcode">${order.ord_zipcode}</label></td>
                        </tr>
                        <tr>
                            <th class="table-secondary"><label class="badge text-bg-dark">주소</label></th>
                            <td><label id="ord_addr1">${order.ord_addr1}</label></td>        
                        </tr>        
                        <tr>
                        	<th class="table-secondary"></th>
                            <td><label id="ord_addr2">${order.ord_addr2}</label></td>        
						</tr>
                        <tr>
                            <th class="table-secondary"><label for="ord_request" class="badge text-bg-dark">요청 사항</label></th>
                            <td><label id="ord_request">${order.ord_request}</label></td>        
                        </tr>
					</tbody>
				</table>
				</div>			
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
				<label for="total_amount" class="badge fw-semibold fs-6 text-bg-dark">총 가격</label>
				<label id="total_amount" class="fw-semibold">${order.total_amount}</label>
				
				<button class="btn btn-primary" onclick="closeWindow(this)">닫기</button>
				
				
				
			
			</div>
			
		</div>
	</div>


<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>