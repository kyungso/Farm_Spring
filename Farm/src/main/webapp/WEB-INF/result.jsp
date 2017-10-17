<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
p{
	font
}
</script>
<body onload="myFunction()">
<img src="images/send_ryan.jpg">
<h2>메시지가 전송되었습니다</h2>
<h2>(이 페이지는 5초뒤에 닫힙니다.)</h2>
</body>
<script>
function myFunction(){
	  setTimeout(function(){ window.close(); }, 5000);
}
</script>
