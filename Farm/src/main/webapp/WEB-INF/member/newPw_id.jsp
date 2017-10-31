<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>RyanFarm</title>
<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <!--Import materialize.css-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
	<div class="white">
		<jsp:include page="../include/top.jsp" flush="true" />
		<div class="center-align">
			<a href="home.jsp" class="blue-text text-darken-2 center-align" style="font-size: 30pt">RyanFarm</a>
		</div>
		<div class="black-text center-align">농산물직거래</div>
	</div>
	<hr style="border: solid 1px lightgrey;">
	<jsp:include page="../include/submenu.jsp" flush="true" />
		<hr style="border: solid 1px lightgrey;">

<script>
$(document).ready(function() {
	
	$("#xx").hide();
$("#sub").on("click", function(){
	
	var newPw=$("#newPw").val();
	var newPw2=$("#newPw2").val();
	console.log(newPw , newPw2);
	
	if(newPw == newPw2){
				console.log("일치");
				$("#xx").hide();
		return true;
		
	}else{
		$("#xx").show();
		return false;
	}
	
	});//one click	

});//ready
</script>
<form action="changePw_id">
<table>
<tr><td>아이디:<input type="text" name="userid" value="${userid}" readonly style="font-weight:bold;">
<tr><td>
새로운 비밀번호:<input type="text" id="newPw" name="newPw" maxlength="10">
</td></tr>
<tr><td><p id="xx" style='color:red;'>비밀번호가 서로 일치하지 않습니다</p></td></tr>
<tr><td>다시한번 입력:<input type="password" id="newPw2" maxlength="10"></td></tr>
<tr><td>
<input type="submit" value="변경" id="sub">
</td></tr>
</table>
</form>