<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include header -->

<%@ include file="../include/header.jsp"%>

<!-- admin_prod_reg -->

<body>

	<div class="main-container">

		<!-- include left Nav Bar -->

		<%@ include file="../include/left_nav_bar.jsp"%>

		<!-- prod_view content-container -->
		
        <div class="content-container-prod">

            <div class="card grid-top">탑</div>

            <div class="card grid-main">
                <div class="card-header">
                    주문 조회
                </div>
                <div class="card-body">

                    <table class="table">
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
                                	<td class="prod-detail-btn"><button type="button" class="btn btn-outline-secondary" onclick="prodViewDetail(event, ${prod.p_num})">제품상세보기</button></td>
                                	<td>
                                		<form method="POST">
                                			<input type="hidden" value="${prod.p_num}" name="p_num">
                                			<button type="submit" class="btn btn-danger" formaction="/jhc/admin/prod/delete">삭제</button>
                                		</form>
                                	</td>
                            	</tr>
                        	</c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>




    <!-- include footer -->
		<%@ include file="../include/footer.jsp"%>