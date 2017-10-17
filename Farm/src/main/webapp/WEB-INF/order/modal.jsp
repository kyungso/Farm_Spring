<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script type="text/javascript">
 function moveGoodsRetrieve(gCode){
	window.top.location.href="../GoodsRetrieveServlet?gCode="+gCode;
  }
</script>

</head>
<body>
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- Compiled and minified JavaScript -->
	
	 <table border="1">
		<tr>
			<td colspan="2">주문 상품 정보</td>
		</tr>
		<tr>
			<td><img src="../images/items/${param.gImage1}.jpg" width="250" /></td>
			<td><font size="3">${param.gName}</font><br> 상품금액:
				${param.gPrice} <br> 
				<input type="button"  value="제품 상세 페이지로 이동" onclick="moveGoodsRetrieve('${param.gCode}')"></td>
		  
		</tr>
	</table>
 

</body>
</html>