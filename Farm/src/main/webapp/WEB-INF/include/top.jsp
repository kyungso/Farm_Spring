
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<div class="left-align" >
	<img src="images/semilogo.jpg" >
	</div>

<c:if test="${empty sessionScope.login}">
	<div class="right-align" style="margin-top: 1%; margin-right: 2%; font-size: 10pt">
		<a href="loginForm" style="color: black">
		<i class="material-icons" style="font-size: 10pt">lock</i>로그인 
		</a> 
		<a href="memberForm" style="color: black; margin-left: 1%">
		<i class="material-icons" style="font-size: 10pt">person</i>회원가입
		</a>
	</div>
</c:if>
<c:if test="${!empty sessionScope.login}">
	<div class="right-align" style="margin-top: 1%; margin-right: 2%; font-size: 10pt">
		<a href="logout" style="color: black">
		<i class="material-icons" style="font-size: 10pt">lock</i>로그아웃 
		</a> 
		<a href="main_mypage" style="color: black; margin-left: 1%">
		&nbsp;&nbsp;마이페이지
		</a>
		<a href="cartList" style="color: black; margin-left: 1%">
		&nbsp;&nbsp;장바구니
		</a>
	</div>
</c:if>


