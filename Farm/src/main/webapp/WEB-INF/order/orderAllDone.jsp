<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
table {
	width: 90%;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5
}
label{
	color: black;
}
</style>

<table>
	<tr>
		<td><b>주문완료</b></td>
	</tr>

	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b></td>
	</tr>

	<tr>
		<td class="td_default" align="center"><b>${oDTOlist[0].userid}</b> 님의 주문이 안전하게
			처리되었습니다.</td>
	</tr>

	<tr>
		<td class="td_default"><b>상품 및 배송정보</b></td>
	</tr>

	<tr>
		<td>
			<table>
				<tr>
					<td class="td_default" width="150" height="35">받으시는 분</td>
					<td class="td_default" height="35">${oDTOlist[0].orderName}</td>
				</tr>
				<tr>
					<td class="td_default" height="35">주소</td>
					<td class="td_default" height="35">(${oDTOlist[0].post1}-${oDTOlist[0].post2})<br> ${oDTOlist[0].addr1}
						${oDTOlist[0].addr2}
					</td>
				</tr>

				<tr>
					<td class="td_default" height="35">휴대전화</td>
					<td class="td_default" height="35">${oDTOlist[0].phone}</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td>
			<table>
				<tr>
					<td width="250" class="td_default" height="35" align="center"><strong>상품명</strong></td>
					<td width="100" class="td_default" height="35" align="center"><strong>판매가</strong></td>
					<td class="td_default" width="50" height="35" align="center"><strong>수량</strong></td>
					<td class="td_default" width="100" height="35" align="center"><strong>합계</strong></td>
				</tr>

				<c:set var="result" value="0"></c:set>
				<c:forEach var="oDTO" items="${oDTOlist}">
				<tr>
					<td height="35" class="td_default"><span class="a_default">${oDTO.gName}</span>
					</td>
					<td height="35" class="td_default" align="center"><span
						id="price1">${oDTO.gPrice}</span>원</td>
					<td height="35" class="td_default" align="center"><span
						id="num1">${oDTO.gAmount}</span>개</td>
					<td height="35" class="td_default" align="center"><span>${oDTO.gPrice*oDTO.gAmount}</span>원
					<c:set var="result" value="${result+(oDTO.gPrice*oDTO.gAmount)}"></c:set>
					</td>
				</tr>
				</c:forEach>

			</table>
		</td>
	</tr>

	<tr>
		<td class="td_default"><b>결제정보</b></td>
	</tr>

	<tr>
		<td>
			<table>
				<tr>
					<td class="td_default" width="150" height="35">결제금액</td>
					<td class="td_default" height="35" align='right'>
						<div class="input-field inline">
						<input type='text' id='total' value='${result}' readonly></div>
						<div class="input-field inline">원</div>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35">결제수단</td>
					<td class="td_default" height="35" align='right'><span>${oDTOlist[0].payMethod}</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td class="td_default" align="center"><a class="a_default"
			href="orderList">주문조회 페이지로 이동</a></td>
	</tr>

</table>
