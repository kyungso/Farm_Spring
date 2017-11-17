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

<c:if test="${!empty mesg}">
	<script>alert('${mesg}')</script>
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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
	.album-wrap {position:relative; width:800px; height:350px; margin:0 auto; overflow:hidden;}
	.album-wrap ul.album {position:absolute;}
	.album-wrap ul.album li {float:left; width:800px;}
	
	ul.bt-roll {width:60px; margin:0 auto; margin-top:0px;}
		ul.bt-roll li {float:left; margin-right:5px;}
		
.center {
  position:absolute;
  top: 160%;
  left:43%;
  width:300px;
  height:100px;  
  margin:-50px 0 0 -50px;
}	

table {
	width: 230%;
	align-items: center;
}
th, td {
	padding: 5px;
	text-align: center;
}

.layer{
  position:absolute;
  top: 100%;
  left:24%;
  width:100px;
  height:100px;
  margin:-50px 0 0 -50px;
}

.layer2{
  position:absolute;
  top: 100%;
  left:58%;
  width:160px;
  height:100px;  
  margin:-50px 0 0 -50px;

}
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
<!-- 메인 배너 끝 -->
<br>
<!-- 베스트상품 -->
<div class="layer">
<a href="bestList"> 
<img src="images/farm.jpg"></a><br>
<table>
<tr>

<c:forEach var="bestList" items="${bestList}" varStatus="status">
<td><a href="goodsRetrieve?gcode=${bestList.gcode}"> 
<img src="images/items/${bestList.gimage1}.jpg" border="0" align="center" width="210"></a></td>
<c:if test="${(status.index+1)%2==0}">
<tr>
								<td height="3">
					 </tr>
</c:if>
</c:forEach>
</tr>
</table>
</div>
<!-- 베스트상품 끝 -->
<br>
<!-- 게시판 -->
<div class="layer2">
<a href="boardForm"> 
<img src="images/board.jpg"></a>
<br>
<br>
<table class="bordered" >
<c:if test="${xxx.size()==0}">
<tr>
<td>작성된 글이 없습니다.</td>
</tr>
</c:if>
<c:if test="${xxx.size()!=0 }">
<c:forEach items="${xxx}" var="dto">
<tr>
<td >${dto.author}</td>
<td id="retrieve${dto.board_num}">
<a href="boardRetrieve?board_num=${dto.board_num}">${dto.title}</a></td>
<td >${dto.writeday}</td>
</tr>
</c:forEach>
</c:if>
</table>
</div>
<!-- 게시판 끝 -->
<br>
<!-- 하단 배너 -->
<div class="center">
<div >
<a href="https://rp5.ru/12514/ko">
<img border=0 width=88 height=31 src="https://rp5.ru/informer/88x31x2.php?f=26&id=5483&lang=ko&um=00000"></a>
</div>
<div id="kakaostory-share-button" data-url="http://localhost:8090/app/" ></div>
<font size="2" color="gray" >Copyright(c)2017 W3 All rights reserved. </font>
</div>
<!-- 하단 배너 끝 -->
	
</body>
<script>
  window.kakaoAsyncInit = function () {
    Kakao.Story.createShareButton({
      container: '#kakaostory-share-button'
    });
  };

  (function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//developers.kakao.com/sdk/js/kakao.story.min.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'kakao-js-sdk'));
</script>

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