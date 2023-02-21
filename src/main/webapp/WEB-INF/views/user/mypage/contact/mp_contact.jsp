<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/mypage/contact/css/mp_contact.css">

<div id="mp_contact_main">

	<div id="mp_contact_box">

		<div id="mp_contact_title">
			<h1>나의 문의</h1>
		</div>

		<div id="mp_contact_list_box">

			<table id="con_list_table">
				<thead>
					<tr id="con_list_title">
						<th style="width: 120px;">[종류]</th>
						<th style="width: 120px;">작성일자</th>
						<th style="width: 400px;">내용</th>
						<th style="width: 140px;">답변</th>
					</tr>
				</thead>
				<tbody>
					<tr class="con_list">
						<td class="con_list_cate">[주문 / 배송]</td>
						<td class="con_list_date">2022-10-02</td>
						<td>
							<div class="con_list_content">
								<a id="" href=""> 내용입니다 내용입니다내용입니다내용입니다 내용입니다
									내용입니다내용입니다내용입니다 내용입니다 내용입니다내용입니다내용입니다 내용입니다 내용입니다내용입니다내용입니다
									내용입니다 내용입니다 내용입니다 내용입니다내용입니다내용입니다 내용입니다 내용입니다내용입니다내용입니다 내용입니다
									내용입니다 내용입니다 내용입니다 
								</a>
							</div>
						</td>
						<td class="con_list_answer">
							<div class="answer_status">답변 완료</div>
						</td>
					</tr>
							<tr class="con_list">
						<td class="con_list_cate">[주문 / 배송]</td>
						<td class="con_list_date">2022-10-02</td>
						<td>
							<div class="con_list_content">
								<a id="" href=""> 내용입니다 내용입니다내용입니다내용입니다 내용입니다
									내용입니다내용입니다내용입니다 내용입니다 내용입니다내용입니다내용입니다 내용입니다 내용입니다내용입니다내용입니다
									내용입니다 내용입니다 내용입니다 내용입니다내용입니다내용입니다 내용입니다 내용입니다내용입니다내용입니다 내용입니다
									내용입니다 내용입니다 내용입니다 
								</a>
							</div>
						</td>
						<td class="con_list_answer">
							<div class="answer_status">답변 완료</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>


<footer>

	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />