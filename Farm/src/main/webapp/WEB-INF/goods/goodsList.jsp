<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	${goodsList.size()}
<table width="100%" cellspacing="0" cellpadding="0">
	
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0" border="0">
	
				<tr>
					<c:forEach var="goodsList" items="${goodsList}" varStatus="status">
					<td>
						<table style='padding: 15px'>
							<tr>
								<td><a href="GoodsRetrieveServlet?gCode=${goodsList.gCode}"> 
									<img src="images/items/${goodsList.gImage1}.jpg" border="0" align="center" width="200">
								</a></td>
							</tr>
							<tr>
								<td class="td_default" align="center">
								<a class="a_black" href="GoodsRetrieveServlet?gCode=${goodsList.gCode}">${goodsList.gName}<br>
								</a> <font color="gray"> --------------------------------------------- </font></td>
							</tr>
							<tr>
								<td class="td_gray" align="center">${goodsList.gContent}
								</td>
							</tr>
							<tr>
								<td class="td_red" align="center"><font color="red"><strong>
											${goodsList.gPrice} </strong></font></td>
							</tr>
						</table>
					</td> 
					<c:if test="${(status.index+1)%4==0}">
					 <tr>
								<td height="1">
					 </tr>
					</c:if>
					</c:forEach>
				</tr>
				
			</table>
		</td>
	</tr>
	<tr>
		<td height="5">
	</tr>
</table>

