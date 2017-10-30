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
// ${authNum} ==승인번호
$(document).ready(function() {
	

$("#nextPage").on("click", function(){
	
	var authNum=${authNum};
	console.log(authNum);
	
	if($("#chkNum").val()==authNum){
				console.log("일치");
		return true;		
	}else{
		$("#chkNum").after("<p style='color:red;'>인증번호가 일치하지 않습니다</p>");
		return false;
	}
	
	});//one click	

});//ready
</script>
<form action="newPw">
<table>
<tr><td><input type="hidden" name="email" value="${email}">
<c:set var="email" value='${email}' scope="session" />
<tr><td>
승인번호:<input type="text" id="chkNum" name="chkNum">
</td></tr>
<tr><td>
<input type="submit" id="nextPage" value="인증">
</td></tr>
</table>
</form>