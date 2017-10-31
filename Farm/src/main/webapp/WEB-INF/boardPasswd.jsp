<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <c:if test="${empty requestScope.message}">
	<script>
		alert('${requestScope.message}');
	</script>
</c:if> --%>
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
			<a href="/app/" ><img src="images/m3logo.jpg"  width="270" height="140"></a>
		</div>
	</div>
	<hr style="border: solid 0.5px lightgrey;">
	<jsp:include page="include/submenu.jsp" flush="true" />
  	<jsp:include page="board/passwd.jsp" flush="true"/>
</body>
</html>