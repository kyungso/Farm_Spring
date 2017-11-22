<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="83117513079-2k0pf4h20vdph70qps0mi8a8l1d9k9h1.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>


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

.button {
	background-color: #64b5f6;
	border: none;
	color: white;
	padding: 8px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 2px 2px;
	cursor: pointer;
	transition-duration: 0.4s;
}

.button {
	background-color: white;
	color: black;
	border: 2px solid gray;
}

.button:hover {
	background-color: #64b5f6;
	color: white;
	border: 2px solid white;
}
</style>

	<form action="login" method="POST">
	<table>
		<tr>
			<td>아이디<input type="text" name="userid" required></td>
		</tr>
		<tr>
			<td>비밀번호<input type="text" name="passwd" required>
			</td>
		</tr>
		<tr>
			<td>
			<input class="button " type="submit" value="로그인"> 
			<input	class="button" type='button' value='회원가입' onclick="javascript:memberJoin()"> 
				<input	class="button" type='button' value='비번찾기' onclick="location.href='findPasswd'">
				<span> 
				<input type="checkbox" class="filled-in" id="idSaveCheck" /> 
				<label for="idSaveCheck">아이디저장</label>
					</span>
			</td>
		</tr>
		<tr><td>  <div id="naver_id_login"></div>
				  <script type="text/javascript">
    var naver_id_login = new naver_id_login("k0KYBOHkL1RTbPlvxpAF",
      "http://192.168.0.151:8090/app/test_callback");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("green", 3, 40);
    naver_id_login.setDomain("http://192.168.0.151:8090/app/test_login");
    naver_id_login.setState(state);
    naver_id_login.init_naver_id_login();
   </script>
   <div class="input-field inline">
		<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
		</td>
		</tr>
		</table>
	</form>
<script type="text/javascript">
function memberJoin(){
	location.href="memberForm";
}


$(document).ready(function(){

    var userInputId = getCookie("userInputId");
    $("input[name='userid']").val(userInputId); 
     
    if($("input[name='userid']").val() != ""){ 
        $("#idSaveCheck").attr("checked", true); 
    }
     
    $("#idSaveCheck").change(function(){ 
        if($("#idSaveCheck").is(":checked")){
            var userInputId = $("input[name='userid']").val();
            setCookie("userInputId", userInputId, 7);
        }else{ 
            deleteCookie("userInputId");
        }
    });
     
   
    $("input[name='userid']").keyup(function(){
        if($("#idSaveCheck").is(":checked")){ 
            var userInputId = $("input[name='userid']").val();
            setCookie("userInputId", userInputId, 7);
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>
<script>

//GOOGLE
      function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId());
        console.log('Full Name: ' + profile.getName());
        console.log("Email: " + profile.getEmail());
        
        location.href = "http://192.168.0.151:8090/app/session?state=".concat(googleUser.getAuthResponse().id_token,"&email=",profile.getEmail(),"&nickname=",profile.getName(),"&sns_id=",profile.getId());


};
      </script>    

      

