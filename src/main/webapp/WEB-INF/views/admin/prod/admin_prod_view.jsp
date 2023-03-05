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
                                <th scope="col">색상</th>
                                <th scope="col">사이즈</th>
                                <th scope="col">상세정보 수정</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${prods}" var="prod">
                        		<tr>
                                	<th scope="row">${prod.m_ctgr_name}</th>
                                	<td>${prod.s_ctgr_name}</td>
                                	<td>${prod.p_num}</td>
                                	<td>${prod.p_name}</td>
                                	<td>${prod.p_price}</td>
                                	
                                	<td>
                                		가긴하냐?
                                		<c:set value="${p_name}${_Colors}" var="prodColors"/>
                                		
                                		<c:forEach items="${prodColors}" var="prodColor">
                                			왓다
                                			<i class="fa-solid fa-circle" style="color: ${prodColor.pc_code};">${prodColor.pc_name}</i>
                                		</c:forEach>
                                	</td>
                                	
                                	<td>
                                		<c:set value="${p_name}${Sizes}" var="prodSizes"/>
                                		<c:forEach items="${prodSizes}" var="prodSize">
                                			<c:choose>
                                				<c:when test="${empty prodSize.ps_name}">
                                					사이즈 없음
                                				</c:when>
                                				<c:otherwise>
                                					${prodSize.ps_name}
                                				</c:otherwise>
                                			</c:choose>
                                		</c:forEach>
                                	</td>
                                	<td><button type="button" class="btn btn-outline-secondary">제품상세보기</button></td>
                            	</tr>
                        	</c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>




    <!-- include footer -->
		<%@ include file="../include/footer.jsp"%>