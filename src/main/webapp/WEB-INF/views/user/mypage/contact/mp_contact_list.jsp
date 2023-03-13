<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/mypage/contact/css/mp_contact_list.css">

<div class="mp_contact_main">

	<div class="mp_contact_box">

		<div class="mp_contact_title">
			<h1>나의 이전 1:1 문의</h1>
		</div>

		<div id="mp_contact_list_box">

			<table id="con_list_table">
				<thead>
					<tr id="con_list_title">
						<th style="width: 120px;">[종류]</th>
						<th style="width: 120px;">작성일자</th>
						<th style="width: 400px;">제목</th>
						<th style="width: 140px;">답변</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="l">
						<tr class="con_list">
							<td class="con_list_cate">[${l.cs_ctgr_name }]</td>
							<td class="con_list_date">${l.contact_regdate}</td>
							<td>
								<div class="con_list_content">
									<a id=""
										href="<%=request.getContextPath()%>/contact/view?contact_num=${l.contact_num}">
										${l.contact_title} ${l.admin_reply }  </a>
								</div>
							</td>
							<td class="con_list_answer"><c:if
									test="${empty l.admin_reply}">
									<div class="answer_status2">답변 예정</div>
								</c:if> <c:if test="${!empty l.admin_reply}">
									<div class="answer_status">답변 완료</div>
								</c:if></td>
						</tr>

					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</div>



<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />