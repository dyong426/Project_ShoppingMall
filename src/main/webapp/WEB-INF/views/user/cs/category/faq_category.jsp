<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/user/cs/body/cateBody.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/cs/css/category.css">

<tr>
	<th colspan="5">



		<div class="faq_box">
			<h3>${cate_name}</h3>
			<div class="fap_accordion">

				<c:forEach items="${faq}" var="faq">
					<input type="checkbox" id="faq_answer${faq.faq_num}">

					<label for="faq_answer${faq.faq_num}">Q ${faq.faq_title} <em></em></label>
					<div>

						<p >A <br>${faq.faq_content}</p>
					</div>

				</c:forEach>

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