<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/mypage/contact/css/mp_contact.css?after">

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
					<c:forEach items="${list}" var="l" begin="${begin}" end="${end}" >
						<tr class="con_list">
							<td class="con_list_cate">[${l.cs_ctgr_name }]</td>
							<td class="con_list_date">${l.con_only_date}</td>
							<td>
								<div class="con_list_content">
									<a 
									
									id=""
										href="<%=request.getContextPath()%>/contact/view?contact_num=${l.contact_num}">
										${l.contact_title} </a>
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
					<div id="con_page_num_container" style="margin: 40px;">
						<form id="all_contact_page" action="<%=request.getContextPath()%>/contact?page=${page}">
							<div id="con_page_num_box" style="display: flex; margin: auto;">
							
							</div>
							
						</form>
					</div>
		</div>
	</div>
</div>
<script>
	let total = ${list_size};
	console.log(total);
	
	let page_box = document.getElementById('con_page_num_box');

	console.log(total);
	function createPageBtn(cnt) {
	    page_box.innerHTML += '<div class="con_page_num_div"><input style="margin-right: 5px; border: none; background-color: white; border-bottom: 1px black solid;" class="con_page_num" type="submit" name="page" value="' +  cnt + '"></input></div>'; 
	}

	let total_page = Math.ceil(total/10);

	console.log(total_page);
	
	let cnt = 1;
	
	for(let i = 0; i < total_page; ++i){
		createPageBtn(cnt++);
	}
	
</script>

<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />