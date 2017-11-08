<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div style="margin-left: 10%">
<table>
	<tr>
		<td>
			<table style="width: 700px;">
				<tr>
					<c:forEach var="goodsAllList" items="${goodsAllList}" varStatus="status">
					<td>
						<a href="goodsRetrieve?gcode=${goodsAllList.gcode}">
							<span>
								<img src="images/items/${goodsAllList.gimage1}.jpg" border="0" align="center" width="250">
								<img src="/images/${goodsAllList.gimage1}" border="0" align="center" width="250" >
							</span><br>
							<span style="color: black;">${goodsAllList.gname}
							</span><br>
							<span><b style="color: black;"><fmt:formatNumber value="${goodsAllList.gprice}" type="number" /><b></span>
							
						</a>
					</td> 
					<c:if test="${(status.index+1)%4==0}">
					 <tr>
								<td height="3">
					 </tr>
					</c:if>
					</c:forEach>
				</tr>
				
			</table> 
		</td>
	</tr>
	<tr>
		<td height="3">
	</tr>
</table> 
</div>
	<c:if test="${!empty sessionScope.login}">
		<center>
			<input type="button" value="상품올리기"
				onclick="gWrite()" class="check"/>			
		</center>
	</c:if>
	<br>

<style>
.check {
	background-color: #008CBA;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
<script>
function gWrite(){
	 location.href="/app/gWrite";
}
</script>


