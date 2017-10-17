<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty delete}">
	<script>
		alert('${delete}');
	</script>
</c:if>
<c:if test="${!empty logout}">
	<script>
		alert('${logout}');
	</script>
</c:if>
<c:if test="${!empty join}">
	<script>
		alert('${join}');
	</script>
</c:if>
<c:if test="${!empty sessionScope.login}">
	<c:if test="${!empty requestScope.login}">
		<script>
			alert("로그인 되었습니다");
		</script>
	</c:if>
</c:if>

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

</head>
<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	
	<div class="white">
		<jsp:include page="include/top.jsp" flush="true" />
		<div class="center-align">
			<a href="/app" class="blue-text text-darken-2 center-align" style="font-size: 30pt">RyanFarm</a>
		</div>
		<div class="black-text center-align">농산물직거래</div>
	</div>
	<hr style="border: solid 1px lightgrey;">
	<jsp:include page="include/submenu.jsp" flush="true" />

	<!-- 라이언 팝업 -->
	<div class="dim"></div>
	<div class="popup">
		<div class="pop_area">
			<li><img src="images/welcome_ryan.gif" alt="라이언"></li>
		</div>
		<div class="not_open">
			<input type="checkbox" onclick="javascript:cookie_main();"
				id="close_pop" /> <label for="close_pop">오늘 하루 이창을 열지않음</label> <a
				href="#" onclick="javascript:close_pop();" class="close_pop"><img
				src="images/x.png" alt="팝업 닫기"></a>
		</div>
	</div>
</body>

<script>
	function setUserCookie(cName, cValue, cDay) {
		var expire = new Date();
		expire.setDate(expire.getDate() + cDay);
		cookies = cName + '=' + escape(cValue) + '; path=/ ';
		if (typeof cDay != 'undefined')
			cookies += ';expires=' + expire.toGMTString() + ';';
		document.cookie = cookies;
	}

	function getUserCookie(cName) {
		cName = cName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cName);
		var cValue = '';
		if (start != -1) {
			start += cName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cValue = cookieData.substring(start, end);
		}
		return unescape(cValue);
	}
</script>

<script>
	$(document).ready(
			function() {

				var startdate = "201705170600";
				var enddate = "201705170630";

				var now = new Date(); //현재시간

				year = now.getFullYear();
				month = now.getMonth() + 1;
				if ((month + "").length < 2) {
					month = "0" + month;
				}
				date = now.getDate();
				if ((date + "").length < 2) {
					date = "0" + date;
				}
				hour = now.getHours();
				if ((hour + "").length < 2) {
					hour = "0" + hour;
				}

				mm = now.getMinutes();
				if ((mm + "").length < 2) {
					mm = "0" + mm;
				}

				today = year + "" + month + "" + date + "" + hour + "" + mm; //오늘 날짜 완성.

				if ((eval(today) > eval(startdate))
						&& ((eval(today) < eval(enddate)))) {
					$('.popup').css("display", "block");
				}
				if (getUserCookie('main_pop_cookie') == "Y") {
					$('.popup').hide();
				}

			});

	var cookie_main = function(cName, cValue, cDay) {
		if ($("input:checkbox[id='close_pop']").is(":checked")) {
			setUserCookie('main_pop_cookie', 'Y', 1);
		} else {
			setUserCookie('main_pop_cookie', '', -1);
		}
	};

	var close_pop = function() {
		$('.popup').hide();
	};
</script>
</html>