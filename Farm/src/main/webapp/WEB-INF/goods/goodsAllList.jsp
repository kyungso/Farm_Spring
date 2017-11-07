<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table width="100%" cellspacing="0" cellpadding="0">
	
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
	
				<tr>
					<c:forEach var="goodsAllList" items="${goodsAllList}" varStatus="status">
					<td>
						<table style='padding: 15px'>
							<tr>
								<td><a href="goodsRetrieve?gcode=${goodsAllList.gcode}"> 
									<img src="images/items/${goodsAllList.gimage1}.jpg" border="0" align="center" width="200">
					      <img src="/images/${goodsAllList.gimage1}" border="0" align="center" width="200" >		</a></td>
							</tr>
							<tr>
								<td class="td_default" align="center">
								<a class="a_black" href="goodsRetrieve?gcode=${goodsAllList.gcode}">${goodsAllList.gname}<br>
								</a> <font color="gray"> -------------------------------- </font></td>
							</tr>
							<tr>
								<td class="td_gray" align="center">${goodsAllList.gcontent}
								</td>
							</tr>
							<tr>
								<td class="td_red" align="center"><font color="red"><strong>
											${goodsAllList.gprice} </strong></font></td>
							</tr>
						</table>
					</td> 
					<c:if test="${(status.index+1)%4==0}">
					 <tr>
								<td height="5">
					 </tr>
					</c:if>
					</c:forEach>
				</tr>
				
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
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


