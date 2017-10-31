<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8" trimDirectiveWhitespaces="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	margin: 100px;
	width: 50%;
}

th, td {
	padding: 15px;
	text-align: left;
}

tr:hover {
	background-color: #f5f5f5
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>

</head>
<c:if test="${!empty mesg}">
<script>
alert('${mesg}');
</script>
</c:if>
<body>
   <h4>SNS 연동 가입</h4>
   <form action="snsAdd" onsubmit="return formCheck();" method="POST">
<table>
<tr><td><input type="hidden" name="jointype" id="jointype" value="1">
<input type="hidden" name="sns_id" id="sns_id" value="${sns_id}"></td></tr>
		<tr>
			<td>아이디<input type="text" name="userid" id="userid"
				value="${email}" readonly style="font-weight:bold;">
			</td>
		</tr>
		<tr>
			<td>이름<input type="text" name="username" id="username"
				value="${nickname}" readonly style="font-weight:bold;">
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-field inline">
				휴대폰
				</div>
				<div class="input-field inline">
				<select name="phone1" id="phone1">
					<option value="010" selected="selected">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
				</select></div>-- 
				<div class="input-field inline">
				<input type="text" name="phone2" id="phone2" maxlength="4" placeholder="숫자 4자리" pattern="^[0-9]+$" title="숫자 4자리만 유효">
				</div>--<div class="input-field inline">
				<input type="text" name="phone3" id="phone3" maxlength="4" placeholder="숫자 4자리" pattern="^[0-9]+$" title="숫자 4자리만 유효">
				</div>
				
			</td>
		</tr>
				<tr>
			<td><input type="submit" value="회원가입"></input> 
			<input type="reset" value="취소"></td>
		</tr>
</table>
</form>
<script>
$(document).ready(function() {

var result = true;
function formCheck(){			
	var phone2 = $("#phone2").val();	
	var phone3 =$("#phone3").val();	

	if(phone2 == '' || phone2.length == 0){
 		alert("phone을 입력하시오");
 		document.getElementById("phone2").focus();
 		result = false;
	}else if(phone3 == '' || phone3.length == 0){
 		alert("phone을 입력하시오");
 		document.getElementById("phone3").focus();
 		result = false;
	}
	return result;
	
	var regExp = /^[0-9]+$/;
	$("#phone2").on("blur",function(event){		
	if (!regExp.test( $('#phone2').val())) {
		 alert("잘못된 휴대폰 번호입니다.  - 를 제외한 숫자만 입력하세요.");
		    $('#phone2').text("");
		    event.preventDefault();
			result=false;
			console.log("전화번호>>>",result);
			};
		 	});
			$("#phone3").on("blur",function(event){
			if (!regExp.test( $('#phone3').val())) {
			    alert("잘못된 휴대폰 번호입니다.  - 를 제외한 숫자만 입력하세요.");
			    $('#phone3').text("");
			    event.preventDefault();
			    result=false;
				};
			});
			
			
			return result;
			
}
});
</script>
</body>
</html>