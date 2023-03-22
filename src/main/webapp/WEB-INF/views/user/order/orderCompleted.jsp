<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/user/order/css/orderCompleted.css" />

<title>juhee custom - 주문서 작성</title>

<div id="mainBody">
	<div class="basket_top">
		<span id="my_basket">주문 완료</span>
		<div class="basket_process">
			<span class="other">장바구니</span>
			<span class="other">&gt;</span>
			<span class="other">주문서작성</span>
			<span class="other">&gt;</span>
			<span>주문완료</span>
		</div>
	</div>
	
	<div id="emptyNotice">
		<div class="subTitle">주문이 완료되었습니다!</div>
		<table id="orderInfo">
			<tr>
				<th>주문 번호</th>
				<td>${now} - ${order.ord_num}</td>
			</tr>
			<tr>
				<th>결제 금액</th>
				<td id="total_amount">${order.total_amount}</td>
			</tr>
		</table>
		<form action="<%=request.getContextPath()%>/main" method="GET">
			<input type="submit" id="goToMain" value="메인화면으로 이동"/>
		</form>
	</div>
</div>

<script src="<%=request.getContextPath()%>/assets/user/order/js/orderCompleted.js"></script>

<%@ include file="../common/footer.jsp"%>
