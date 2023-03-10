<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="/WEB-INF/views/user/common/header.jsp" />
    
<c:set var = "member" value="${sessionScope.member }"/>

비밀번호 변경 링크를 다음 메일 주소로 보냈습니다.
${member.mem_email }
메일함을 확인해주세요.
   
    
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />