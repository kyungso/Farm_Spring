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
					<c:forEach var="bestList" items="${bestList}" varStatus="status">
					<td>
						<a href="goodsRetrieve?gcode=${bestList.gcode}"> 
						   <span>
							<img src="images/items/${bestList.gimage1}.jpg" border="0" align="center" width="250">
							<img src="/images/${bestList.gimage1}"border="0" align="center" width="250" >
						   </span><br>
						   <span style="color: black;">${bestList.gname}</span><br>
						   <span><b style="color: black;"><fmt:formatNumber value="${bestList.gprice}" type="number" /></b></span>
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
