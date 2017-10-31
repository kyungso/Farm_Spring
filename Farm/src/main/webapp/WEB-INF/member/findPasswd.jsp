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
<script>
var result=false;


$(document).ready(function() {
	
	
	
$("#searchVal").on("keyup",function(event){
	console.log($('#searchVal').val());
	
	if($.trim($('#searchVal').val())==''){
		alert("빈 값");
		result=false;
		event.stopPropagation();

	}else if($("#test1").is(":checked") == true)
	{
	$('#searchVal').attr('pattern', '[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
	$('#searchVal').attr('title', '올바른 이메일형식이 아닙니다');
	$('#myForm').attr('action', 'emailAuth');
	
	
	$.ajax({
			type:"GET",
			url:"emailCheck",
			data:{email:$('#searchVal').val()},	
			dataType:"text",
			success:function(responseData, status, xhr){
			if(responseData == "false"){
				$("#result").text("일치하는 메일주소가 없습니다").css("color","red");
				result= false;
				event.stopPropagation();
			}else{
				$("#result").hide();
				result= true;
				}
			}//success
		});  //ajax
		
		
	

	}//if
	else if($("#test2").is(":checked") == true)
	{
		$('#searchVal').attr('pattern', '^[a-zA-Z0-9]{1,12}$');
		$('#searchVal').attr('title', '올바른 아이디형식이 아닙니다');
	$('#myForm').attr('action', 'idAuth');
	
	$.ajax({
		type:"GET",
		url:"idCheckForPw",
		data:{userid:$('#searchVal').val()},	
		dataType:"text",
		success:function(responseData, status, xhr){
		if(responseData == "false"){
			$("#result").text("일치하는 아이디가 없습니다").css("color","red");
			result= false;
			event.stopPropagation();
		}else{
			$("#result").hide(event);
			result= true;
			}
		}//success
	});
	
	}

}); //click
	
});//ready




function valChk(){
	console.log(result);
		return result;
}	
	
</script>
	
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

<!-- 비번찾기폼 -->
<form id="myForm" onsubmit="return valChk()" action="#">
<table border="1" class="centered">
<tr><td style="font-weight:bold;">* SNS 연동회원 비밀찾기는 직접 사이트에 가서 찾아야 합니다</td></tr>
<tr><td style="color:red;"> * 입력할 값을 선택해주세요</td></tr>
<tr><td>
      <input name="searchName" type="radio" required id="test1" value="byMail" onclick="$('#searchInsert').text('* 가입한 당시 적은 Mail주소를 입력해주세요.');"/>
      <label for="test1">Mail로 찾기</label>
      <input name="searchName" type="radio" id="test2" value="byId" onclick="$('#searchInsert').text('* ID를 입력해주세요.');"/>
      <label for="test2">ID로 찾기</label>
</td></tr>
<tr><td style="color:red;" id="searchInsert">  </td></tr>


<tr><td><div class="row" >
    <div class="input-field col s5" style="text-align: center">
      <input name="searchVal" id="searchVal" type="text" class="validate" required pattern="#">
    </div>
  </div>
  <p id="result"></p></td></tr>
  <tr><td><input type="submit" value="다음단계"></td></tr>
</table>
  </form>	
</body>
</html>
