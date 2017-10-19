<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row" style="margin-top: 2%">
	<div class="col s12">
		<ul>

			<li class="col s3"><a href="mypageForm"
				onclick="pointCheck(event)">회원정보</a></li>
			<li class="col s3"><a href="orderList">포인트&주문내역</a></li>
			<li class="col s3"><a
				href="QNAListServlet?userid=${sessionScope.login.userid }">1:1문의</a></li>
			<li class="col s3"><a href="memberDelete"
				onclick="return confirm('탈퇴 하시겠습니까?')">회원탈퇴</a></li>
		</ul>
	</div>
</div>


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
