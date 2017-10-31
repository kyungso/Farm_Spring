<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>RyanFarm</title>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	
	<div class="white">
		<jsp:include page="include/top.jsp" flush="true" />
		<div class="center-align">
			<a href="/app/" class="blue-text text-darken-2 center-align" style="font-size: 30pt">RyanFarm</a>
		</div>
		<div class="black-text center-align">농산물직거래</div>
	</div>
	<hr style="border: solid 1px lightgrey;">
	<jsp:include page="include/sub_mypage.jsp" flush="true" />
	<hr style="border: solid 1px lightgrey;">
	
<!-- MYPAGE 메인 첫부분 -->	
<style>
.btn-group .button {
    background-color: white; 

    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
    float: left;
}



table{

margin:80px;



}
</style>
<table >
<tr>
<td>
<div>${sessionScope.login.username }님 환영합니다.</div>
</td>
</tr>
<tr>
<td>
<div class="btn-group" align="center">
  <button class="button" 
  onclick="<c:if test='${sessionScope.login.jointype!=1}'>pointCheck(event)</c:if>
  <c:if test='${sessionScope.login.jointype==1}'>location.href='mypageForm'</c:if>">
  <i class="material-icons" style="font-size:48px;color:#03A9F4">
account_circle</i>개인정보 보기</button>
  <button class="button" onclick="location.href='orderList'"><i class="material-icons" style="font-size:48px;color:#03A9F4">
  notifications</i>포인트&주문내역</button>
</div>
</td>
</tr>
<tr>
<td>
<div class="btn-group" align="center">
  <button class="button" onclick="location.href='QNAList?userid=${sessionScope.login.userid }'"><i class="material-icons" style="font-size:48px;color:#03A9F4">live_help</i>1:1문의하기</button>
  <button class="button" onclick="delCheck()"><i class="material-icons" style="font-size:48px;color:#03A9F4"> pan_tool</i>회원탈퇴</button>
<button class="button"  onclick="register()"><i class="material-icons" style="font-size:48px;color:#03A9F4">trending_up</i>입점신청</button>
</div>
</td>
</tr>
</table>
 <script>

   function pointCheck(event){
	   var passwd = '${sessionScope.login.passwd}';
	   var pwChk=prompt("비밀번호를 입력해주세요");
	 if  (pwChk==null||pwChk==""||pwChk!=passwd){
		 alert("비밀번호를 정확히 입력하세요");
			event.preventDefault();
	 }else{
		 location.href="mypageForm";
	 }
   };
</script>
<script>
   function delCheck(){
	   var r=confirm("정말 탈퇴하시겠습니까?");
	   if(r==true) location.href="memberDelete";
   };
   
   
   
   
   
   
   
   function register(){
	    window.open("member/register","_blank","width=650,height=600");
   }

    </script>   