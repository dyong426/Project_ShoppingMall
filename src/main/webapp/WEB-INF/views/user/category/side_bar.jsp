<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- 사이드 바 -->
    <div id="category_main_side_bar">
      <!--카테고리 대분류-->
      <h3 class="category_category_major">${mainCtgr}</h3>
      <!--카테고리 소분류-->
      <ul class="category_list_detailed" style="list-style: none; padding-left: 0%;">
	<c:forEach items="${subCtgr }" var="subCtgr">
	<li><a href="/category?ctgr_num=${subCtgr.s_ctgr_num}">${subCtgr.s_ctgr_name}</a></li>
      </c:forEach>
      </ul>
    </div>
    
  
