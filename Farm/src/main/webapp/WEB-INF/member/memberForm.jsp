<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<<<<<<< HEAD
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
=======
   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
>>>>>>> branch 'master' of https://github.com/kyungso/Farm_Spring.git

<script>
var result = true;
function formCheck(){
	var userid =$.trim($('#userid').val());	
	var passwd =$("#passwd").val();	
	var passwd2 =$("#passwd2").val();	
	var username =$("#username").val();
	var post1 =$("#post1").val();
	var email =$("#email").val();				
	var phone2 = $("#phone2").val();	
	var phone3 =$("#phone3").val();	

	if(userid == '' || userid.length == 0){
	alert("ID를 입력하시오");
	document.getElementById("userid").focus();
	result = false;
	}else if(passwd == '' || passwd.length == 0){
		alert("비밀번호를 입력하시오");
		document.getElementById("passwd").focus();
		result = false;
	}else if(passwd2 == '' || passwd2.length == 0){
		alert("비밀번호를 위와 똑같이 입력하시오");
		document.getElementById("passwd").focus();
		result = false;
	}else if(username == '' || username.length == 0){
		alert("이름을 입력하시오");
		document.getElementById("username").focus();
		result = false;
	}else if(post1 == '' || post1.length == 0){
 		alert("주소를 입력하시오");
 		result = false;
	}else if(phone2 == '' || phone2.length == 0){
 		alert("phone을 입력하시오");
 		document.getElementById("phone2").focus();
 		result = false;
	}else if(phone3 == '' || phone3.length == 0){
 		alert("phone을 입력하시오");
 		document.getElementById("phone3").focus();
 		result = false;
	}else if(email == '' || email.length == 0){
		alert("email을 입력하시오");
		document.getElementById("email").focus();
		result = false;
	}
	return result;
}
</script>
<script>
$(document).ready(function() {

	//아이디 중복확인
	$("#userid").on("blur",function(event){
		console.log($.trim($('#userid').val()));
		if($.trim($('#userid').val())==null || $('#userid').val().length <6 ) {
			$("#result").text("* 아이디는 공백제외 6자리이상").css("color","red").css("font-size","9px");
			//event.preventDefault();
			result=false;
			console.log(result);
		}else{
		$.ajax({
			type:"GET",
			url:"idCheck",
			data:{
				userid:$('#userid').val()
				},	
			dataType:"text",
			success:function(responseData, status, xhr){
				console.log(responseData);
				$("#result").text(responseData).css("color","red").css("font-size","9px");
			if(responseData.includes("사용가능")){
				result=true;
				console.log(result);
			}else{ 
				result=false; 
				console.log(result);
				}
			},
			error: function(xhr, status, e){console.log(status, e);}
			}); //ajax
		}
	});
	
	
	//비번 일치하는지 
	$("#passwd2").on("blur",function(event){		
		var pw=$("#passwd").val();
		var pw2=$("#passwd2").val();	
		if(pw!=pw2){
			//$("#errMsg").text("비밀번호가 일치하지 않음");
			alert("비밀번호가 일치하지 않음");
			event.preventDefault();
			result=false;
			console.log(">>>",result);
		}else{
			$("#errMsg").text("비밀번호 일치");	
			result=true;
		};	
	});	
	
	// 전화번호 숫자만 포함하는지 확인
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
			
			
			

	}); //ready
</script>



<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<style>
table {
	margin: 100px;
	width: 50%;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5
}
</style>

<form action="memberAdd" onsubmit="return formCheck();">
	<table>
		<tr>
			<td>아이디
			<input type="text" name="userid" id="userid" placeholder="아이디는 공백없이 10자리이하.."> 
			<span id="result"></span></td>
		</tr>

		<tr>
			<td>비밀번호<input type="password" name="passwd" id="passwd"
				placeholder="비밀번호는 10자리 이하.."> 비밀번호 확인<input type="password"
				name="passwd2" id="passwd2" placeholder="비밀번호를 다시한번 입력해주세요..">
				<span class="err" id="errMsg" style="color: red; font-size: 10px"></span>
			</td>
		</tr>
		<tr>
			<td>이름<input type="text" name="username" id="username"
				placeholder="이름을 입력해주세요..">
			</td>
		</tr>
		<tr>
			<td>
				<!-- 다음주소 시작--> 
				<div class="input-field inline">
					<input name="post1" id="post1" size="5" readonly="">
				</div>
				 - 
				<div class="input-field inline">
					<input name="post2" id="post2" size="5" readonly="">
				</div> 
				<div class="input-field inline">
				<input onclick="openDaumPostcode()" type="button" value="우편번호찾기"><br>
				</div>
				<input name="addr1" id="addr1" size="40" readonly="" placeholder="도로명주소"> <br> 
				<span style="line-height: 10%;"><br></span> 
				<input name="addr2" id="addr2" size="40" placeholder="지번주소"> 
				<!-- 다음주소 끝 -->
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
				<input type="text" name="phone2" id="phone2" maxlength="4" placeholder="숫자 4자리">
				</div>--<div class="input-field inline">
				<input type="text" name="phone3" id="phone3" maxlength="4" placeholder="숫자 4자리">
				</div>
				
			</td>
		</tr>
		<tr>
			<td>이메일<input type="email" name="email" id="email"
				placeholder="이메일 형식에 맞게 입력해주세요..">
			</td>
		</tr>

		<input type="hidden" id="point" name="point" value="0">
		<input type="hidden" id="buycnt" name="buycnt" value="0">

		<tr>
			<td><input type="submit" value="회원가입"></input> 
			<input type="reset" value="취소"></td>
		</tr>

	</table>
</form>
