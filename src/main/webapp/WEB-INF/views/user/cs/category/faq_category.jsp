<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/user/cs/body/cateBody.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/cs/css/category.css">

<tr>
	<th colspan="${num_of_ctgr}">



		<div class="faq_box">
			<h3>${ctgr_name}</h3>
			<div class="fap_accordion">

				<c:forEach items="${faq}" var="faq_">
					<input type="checkbox" id="faq_answer${faq_.faq_num}">

					<label for="faq_answer${faq_.faq_num}">Q ${faq_.faq_title}
						<em></em>
					</label>
					<div>

						<p>
							A <br>${faq_.faq_content}</p>
					</div>

				</c:forEach>

			</div>

			<div class="cs_other_questions">
				<h3>찾으시는 답변이 없으면 1:1 실시간 상담을 이용해 주세요.</h3>
				<p>
					고객센터 전화 또는 카카오톡(플러스친구 "마플" 추가) 상담시간은 평일 오전 10시부터 오후6시까지입니다.<br />이외
					문의시간에는 이메일&nbsp;<a href="mailto:help@ezen.com">help@ezen.com</a>으로
					메일주시거나 1:1 상담에 문의담겨주시면 친절하게 안내해드리겠습니다.
				</p>
				<div class="image">
					<img
						src="//s3.marpple.co/files/u_14355/2019/5/original/f_294627_1558519259330_dH0DZS2y0r7MqV7CQx3qW.png"
						alt="" 
            />
				</div>
			</div>
		</div>


		</div>
	</th>
</tr>
</table>
</table>
</div>

</div>
<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />