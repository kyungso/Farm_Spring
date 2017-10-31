<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>RyanFarm</title>

<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

</head>
<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	
	<div class="white">
		<jsp:include page="../include/top.jsp" flush="true" />
		<div class="center-align">
			<a href="home.jsp" class="blue-text text-darken-2 center-align" style="font-size: 30pt">RyanFarm</a>
		</div>
		<div class="black-text center-align">농산물직거래</div>
	</div>
	<hr style="border: solid 1px lightgrey;">
	<jsp:include page="../include/sub_mypage.jsp" flush="true" />
	<hr style="border: solid 1px lightgrey;">
		
<script>
$(document).ready(function() {
	
	$("#sub").hide();
	
$("#phone3").on("blur",function(){
	
$.ajax({
	type:"GET",
	url:"nameCheck",
	data:{
		username:$('#username').val(),
		userid:$('#userid').val(),
		phone1:$('#phone1').val(),
		phone2:$('#phone2').val(),
		phone3:$('#phone3').val()
		},	
		dataType:"text",
		success:function(responseData, status, xhr){
		console.log(responseData);	
			if(responseData == "true"){
				console.log("아이디 있음");
				$("#sub").show();
			}else{
				$("#sub").hide();
				alert("정보와 일치하는 아이디가 없습니다. 다시입력하세요");
				}
			}
		});  //ajax

	});//blur
	
	
});//ready
</script>



	<form action="newPw_id">
		<table>
		<tr><td style="font-weight:bold"> * SNS회원은 SNS를 연동한 사이트에서 찾아주세요</td></tr>
		<tr><td style="color:red">* 가입당시 적었던 정보를 적어주세요 </td></tr>
			<tr>
				<td>아이디:<input type="text" name="userid" id="userid" value="${userid}"
					readonly style="font-weight: bold"> 
					<c:set var="userid" value='${userid}' scope="session" />
				</td>
			</tr>
			<tr>
				<td>이름:<input type="text" id="username" name="username"></td>
			</tr>
			<tr>
				<td>
					휴대폰:
					<div class="input-field inline">
						<input type="text" name="phone1" id="phone1" maxlength="3"
							placeholder="숫자 3자리">
					</div>--
					<div class="input-field inline">
						<input type="text" name="phone2" id="phone2" maxlength="4"
							placeholder="숫자 4자리">
					</div>--
					<div class="input-field inline">
						<input type="text" name="phone3" id="phone3" maxlength="4"
							placeholder="숫자 4자리">
					</div>
				</td>
			</tr>
			<tr><td><input id="sub" type="submit" value="비번찾기"></td></tr>
		</table>
	</form>
	
