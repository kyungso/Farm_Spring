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


<c:if test="${!empty sessionScope.login}">
		<c:if test="${empty join}">
		<script>
			alert("로그인 되었습니다");
		</script>
		</c:if>
		<c:if test="${!empty join}">
	<script>
		alert('${join}');
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
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>

<style type="text/css">
	.album-wrap {position:relative; width:800px; height:350px; margin:0 auto; overflow:hidden;}
	.album-wrap ul.album {position:absolute;}
	.album-wrap ul.album li {float:left; width:800px;}
	
	ul.bt-roll {width:60px; margin:0 auto; margin-top:0px;}
		ul.bt-roll li {float:left; margin-right:5px;}
</style>
</head>
<body>
	<div class="white">
		<jsp:include page="include/top.jsp" flush="true" />
		<div class="center-align">
			<a href="/app/" ><img src="images/ryanlogo.jpg" ></a>
		</div>
	</div>
	<hr style="border: solid 0.5px lightgrey;">
	<jsp:include page="include/submenu.jsp" flush="true" />
<!-- 메인 배너 -->
<div class="album-wrap">
	<ul class="album clfix">
		<li><a href="#"><img src="images/ban_week.jpg" alt="" width="800" height="300"></a></li>
		<li><a href="#"><img src="images/ban_grate.jpg" alt="" width="800" height="300"></a></li>
		<li><a href="#"><img src="images/ban_hat.jpg" alt="" width="800" height="300"></a></li>
	</ul>
</div>
<ul class="bt-roll">
	<li><a href="#"><img src="images/btn_circle_.png" alt=""></a></li>
	<li><a href="#"><img src="images/btn_circle.png" alt=""></a></li>
	<li><a href="#"><img src="images/btn_circle.png" alt=""></a></li>
</ul>	

	<!-- 라이언 팝업 -->
	<div class="dim"></div>
	<div class="popup">
		<div class="pop_area">
			<img src="images/welcome_ryan.gif" alt="라이언">
		</div>
		<div class="not_open">
			<input type="checkbox" onclick="javascript:cookie_main();"
				id="close_pop" /> <label for="close_pop">오늘 하루 이창을 열지않음</label> <a
				href="#" onclick="javascript:close_pop();" class="close_pop"><img
				src="images/x.png" alt="팝업 닫기"></a>
		</div>
	</div>
	
	
</body>
<script type="text/javascript">
	var $list = $('ul.album');
	var size = $list.children().outerWidth();
	var len =  $list.children().length;
	var speed = 2500;
	var timer = null;
	var auto = true;
	var cnt = 1;
	$list.css('width',len*size);
	if(auto) timer = setInterval(autoSlide, speed);
	$list.children().bind({
		'mouseenter': function(){
			if(!auto) return false;
			clearInterval(timer);
			auto = false;
		},
		'mouseleave': function(){
			timer = setInterval(autoSlide, speed);
			auto = true;
		}
	})
	$('.bt-roll').children().bind({
		'click': function(){
			var idx = $('.bt-roll').children().index(this);
			cnt = idx;
			autoSlide();
			return false;
		},
		'mouseenter': function(){
			if(!auto) return false;
			clearInterval(timer);
			auto = false;
		},
		'mouseleave': function(){
			timer = setInterval(autoSlide, speed);
			auto = true;
		}
	});		
	function autoSlide(){
		if(cnt>len-1){
			cnt = 0;
		}
		$list.animate({'left': -(cnt*size)+'px' },'normal');
		var source2 = $('.bt-roll').children().find('img').attr('src').replace('_.png','.png');
		$('.bt-roll').children().find('img').attr('src',source2);
		var source = $('.bt-roll').children().find('img').attr('src').replace('.png','_.png');
		$('.bt-roll').children().eq(cnt).find('img').attr('src',source);
		cnt++;
	}
</script>
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