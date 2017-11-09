<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="left-align">
	<img src="/app/images/semilogo.jpg">
</div>

<c:if test="${empty sessionScope.admin}">
	<div class="right-align"
		style="margin-top: 2%; margin-right: 2%; font-size: 10pt">
		<a href="loginForm" style="color: black"> <i
			class="material-icons" style="font-size: 10pt">lock</i>로그인
		</a>
	</div>
</c:if>
<c:if test="${!empty sessionScope.admin}">
	<div class="right-align" style="margin-top: 2%; margin-right: 2%; font-size: 10pt">
		<b style="margin-right: 1%; color: gray;"> 관리자님 로그인 중...</b>
		<a href="logout" style="color: black"> 
			<i class="material-icons" style="font-size: 10pt">lock</i>로그아웃
		</a>
	</div>
</c:if>

