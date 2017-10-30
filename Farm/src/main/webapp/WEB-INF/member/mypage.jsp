<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="jquery-3.2.1.min.js"></script>
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<c:if test="${sessionScope.login.jointype!=1}">
<script>
$(document).ready(function() {
    $('select').material_select();
  });
         

	var result = true;
	function formCheck() {

		var userid = $.trim($('#userid').val());
		var passwd = $("#passwd").val();
		var passwd2 = $("#passwd2").val();
		var post1 = $("#post1").val();
		var email = $("#email").val();
		var username = $("#username").val();
		
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();

		if (userid == '' || userid.length == 0) {
			alert("ID를 입력하시오");
			document.getElementById("userid").focus();
			result = false;
		} else if (passwd == '' || passwd.length == 0) {
			alert("비밀번호를 입력하시오");
			document.getElementById("passwd").focus();
			result = false;
		} else if (passwd2 == '' || passwd2.length == 0) {
			alert("비밀번호를 위와 똑같이 입력하시오");
			document.getElementById("passwd").focus();
			result = false;
		} else if (username == '' || username.length == 0) {
			alert("이름을 입력하시오");
			document.getElementById("username").focus();
			result = false;
		} else if (post1 == '' || post1.length == 0) {
			alert("주소를 입력하시오");
			result = false;
		} else if (phone2 == '' || phone2.length == 0) {
			alert("phone을 입력하시오");
			document.getElementById("phone2").focus();
			result = false;
		} else if (phone3 == '' || phone3.length == 0) {
			alert("phone을 입력하시오");
			document.getElementById("phone3").focus();
			result = false;
		} else if (email == '' || email.length == 0) {
			alert("email을 입력하시오");
			document.getElementById("email").focus();
			result = false;
		}
		console.log("result: " + result);
		
		return result;
	}
</script>
<script>
	$(document).ready(function() {

		//비번 일치하는지 
		$("#passwd2").on("blur", function(event) {
			var pw = $("#passwd").val();
			var pw2 = $("#passwd2").val();
			if (pw != pw2) {
				//$("#errMsg").text("비밀번호가 일치하지 않음");
				alert("비밀번호가 일치하지 않음");
				event.preventDefault();
				result = false;
				console.log(">>>", result);
			} else {
				$("#errMsg").text("비밀번호 일치");
				//	result=true;
			}
			;
		});

		// 전화번호 숫자만 포함하는지 확인
		var regExp = /^[0-9]+$/;
		$("#phone2").on("blur", function(event) {
			if (!regExp.test($('#phone2').val())) {
				alert("잘못된 휴대폰 번호입니다.  - 를 제외한 숫자만 입력하세요.");
				$('#phone2').text("");
				event.preventDefault();
				result = false;
				console.log("전화번호>>>", result);
			}
			;
		});
		$("#phone3").on("blur", function(event) {
			if (!regExp.test($('#phone3').val())) {
				alert("잘못된 휴대폰 번호입니다.  - 를 제외한 숫자만 입력하세요.");
				$('#phone3').text("");
				event.preventDefault();
				result = false;
			};
		});

		return result;


	}); //ready
</script>
</c:if>


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


<!-- 일반계정 -->
<c:if test="${sessionScope.login.jointype!=1}">
	<form action="memberUpdate"> <!-- 테이블안에 안쓰면 text만 가져감.. -->
	<table>
		<tr>
			<td>아이디<input type="text" name="userid" id="userid"
				value="${login.userid}" readonly>
			</td>
		</tr>
		<tr>
			<td>비밀번호<input type="text" name="passwd" id="passwd"
				value="${login.passwd}">
			</td>
		</tr>
		<tr>
			<td>이름<input type="text" name="username" id="username"
				value="${login.username}" readonly>
			</td>
		</tr>
		<tr>
			<td>
				<!-- 다음주소 시작--> <input name="post1" id="post1" size="5"
				value="${login.post1}" readonly> - <input name="post2"
				id="post2" size="5" value="${login.post2}" readonly> <input
				onclick="openDaumPostcode()" type="button" value="우편번호찾기"> <br>
				<input name="addr1" id="addr1" size="40" readonly
				placeholder="도로명주소" value="${login.addr1}"> <br> <span
				style="line-height: 10%;"><br></span> <input name="addr2"
				id="addr2" size="40" value="${login.addr2}" placeholder="지번주소">
				<!-- 다음주소 끝 -->
			</td>
		</tr>
		<tr>
				<td>
				휴대폰
	
				<div class="input-field inline">
				<select name="phone1" id="phone1">
					<c:choose>
						<c:when test="${login.phone1 == '010'}">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
						</c:when>
						<c:when test="${login.phone1 == '011'}">
							<option value="010">010</option>
							<option value="011" selected="selected">011</option>
							<option value="017">017</option>
						</c:when>
						<c:when test="${login.phone1 == '017'}">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017" selected="selected">017</option>
						</c:when>
					</c:choose>
			</select></div>
				-- 
				<div class="input-field inline">
				<input type="text" name="phone2" id="phone2" value="${login.phone2}">
				</div>--<div class="input-field inline">
				<input type="text" name="phone3" id="phone3" value="${login.phone3}">
				</div>
				
			</td> 
				 

		</tr>
		<tr>
			<td>이메일<input type="email" name="email" id="email"
				value="${login.email}">
			</td>
		</tr>
		<tr>
			<td>가입일:<input type="text" name="joinday" id="joinday"
				value="${login.joinday}" readonly="readonly"><br>
			</td>
		</tr>
		<tr>
			<td>구매횟수:<input type="text" name="buycnt" id="buycnt"
				value="${login.buycnt}" readonly="readonly"><br>
			</td>
		</tr>
		<tr>
			<td>적립포인트: <input type="text" name="point" id="point"
				value="${login.point}" readonly="readonly"><br>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="정보수정"></td>
		</tr>
		</table>
	</form>
	</c:if>

<!-- SNS 계정 -->
		<c:if test="${sessionScope.login.jointype == 1}">
<form action="SNSmemberUpdate"> 
<input type="hidden" name="jointype" value='${login.jointype}'>
	<table>
	<tr><td><p style="color:red;">*SNS연동계정은 전화번호만 수정가능합니다</p></td></tr>
		<tr>
			<td>아이디<input type="text" name="userid" id="userid"
				value="${login.userid}" readonly style="font-weight:bold;">
			</td>
		</tr>

		<tr>
			<td>이름<input type="text" name="username" id="username"
				value="${login.username}" readonly style="font-weight:bold;">
			</td>
		</tr>
		

		<tr>
				<td>
				휴대폰
	
				<div class="input-field inline">
				<select name="phone1" id="phone1">
					<c:choose>
						<c:when test="${login.phone1 == '010'}">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
						</c:when>
						<c:when test="${login.phone1 == '011'}">
							<option value="010">010</option>
							<option value="011" selected="selected">011</option>
							<option value="017">017</option>
						</c:when>
						<c:when test="${login.phone1 == '017'}">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017" selected="selected">017</option>
						</c:when>
					</c:choose>
			</select></div>
				-- 
				<div class="input-field inline">
				<input type="text" name="phone2" id="phone2" value="${login.phone2}">
				</div>--<div class="input-field inline">
				<input type="text" name="phone3" id="phone3" value="${login.phone3}">
				</div>
				
			</td> 
		</tr>
		<tr>
			<td>가입일:<input type="text" name="joinday" id="joinday"
				value="${login.joinday}" readonly="readonly"><br>
			</td>
		</tr>
		<tr>
			<td>구매횟수:<input type="text" name="buycnt" id="buycnt"
				value="${login.buycnt}" readonly="readonly"><br>
			</td>
		</tr>
		<tr>
			<td>적립포인트: <input type="text" name="point" id="point"
				value="${login.point}" readonly="readonly"><br>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="정보수정"></td>
		</tr>
		</table>
	</form>
		</c:if>
