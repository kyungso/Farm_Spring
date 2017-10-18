<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${empty sessionScope.login}">
	<div class="right-align" style="margin-top: 2%; margin-right: 2%; font-size: 10pt">
		<a href="loginForm" style="color: black">
		<i class="material-icons" style="font-size: 10pt">lock</i>로그인 
		</a> 
		<a href="memberForm" style="color: black; margin-left: 1%">
		<i class="material-icons" style="font-size: 10pt">person</i>회원가입
		</a>
	</div>
</c:if>
<c:if test="${!empty sessionScope.login}">
	<div class="right-align" style="margin-top: 2%; margin-right: 2%; font-size: 10pt">
		<a href="logout" style="color: black">
		<i class="material-icons" style="font-size: 10pt">lock</i>로그아웃 
		</a> 
		<a href="main_mypage" style="color: black; margin-left: 1%" onclick="pointCheck(event)">
		&nbsp;&nbsp;마이페이지
		</a>
		<a href="CartListServlet" style="color: black; margin-left: 1%">
		&nbsp;&nbsp;장바구니
		</a>
	</div>
</c:if>

<script>
   function pointCheck(event){
	   var passwd = '${sessionScope.login.passwd}';
	   console.log(passwd);
	   var pwChk=prompt("비밀번호를 입력해주세요");
	 if  (pwChk==null||pwChk==""||pwChk!=passwd){
		 alert("비밀번호를 정확히 입력하세요");
			event.preventDefault();
	 }
   }
</script>
