<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="83117513079-2k0pf4h20vdph70qps0mi8a8l1d9k9h1.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
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
<table>
	<form action="LoginServlet">
		<tr>
			<td>아이디<input type="text" name="userid"></td>
		</tr>
		<tr>
			<td>비밀번호<input type="text" name="passwd">
			</td>
		</tr>
		<tr>
			<td><input class="button " type="submit" value="로그인"> <input
				class="button" type='button' value='회원가입'
				onclick="javascript:memberJoin()"> <span> <input
					type="checkbox" class="filled-in" id="idSaveCheck" /> <label
					for="idSaveCheck">아이디저장</label></span></td>
		</tr>
		<tr>
			<td>
				<div>
					<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
					<a href="#" onclick="signOut();">구글 로그아웃</a>
				</div>
			</td>
		</tr>
	</form>
</table>


<!-- 구글  SSL Tomcat 설정 변경할것-->
<script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'https://localhost:8090/Farm/GoogleLoginServlet');
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
          console.log('Signed in as: ' + xhr.responseText);
        };
        xhr.send('idtoken=' + id_token);
      };
      
      
      function signOut() {
    	    var auth2 = gapi.auth2.getAuthInstance();
    	    auth2.signOut().then(function () {
    	      console.log('User signed out.');
    	    });
    	  }
    </script>

<script type="text/javascript">
function memberJoin(){
	location.href="MemberFormServlet";
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
