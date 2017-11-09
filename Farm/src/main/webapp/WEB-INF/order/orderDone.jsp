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

<c:if test="${!empty oDTO}">
<table>
	<tr>
		<td><b>주문완료</b></td>
	</tr>
	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b></td>
	</tr>

	<tr>
		<td class="td_default"><b>${oDTO.userid}</b> 님의 주문이 안전하게
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
					<td class="td_default" height="35">${oDTO.orderName}</td>
				</tr>
				<tr>
					<td class="td_default" height="35">주소</td>
					<td class="td_default" height="35">(${oDTO.post1}-${oDTO.post2})<br> ${oDTO.addr1}
						${oDTO.addr2}
					</td>
				</tr>

				<tr>
					<td class="td_default" height="35">휴대전화</td>
					<td class="td_default" height="35">${oDTO.phone}</td>
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

				<tr>
					<td height="35" class="td_default"><span class="a_default">${oDTO.gname}</span>
					</td>
					<td height="35" class="td_default" align="center"><span
						id="price1"><fmt:formatNumber value="${oDTO.gprice}" type="number" /></span>원</td>
					<td height="35" class="td_default" align="center"><span
						id="num1">${oDTO.gamount}</span>개</td>
					<td height="35" class="td_default" align="center"><span><fmt:formatNumber value="${oDTO.gprice*oDTO.gamount}" type="number" /></span>원
					</td>
				</tr>

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
						<fmt:formatNumber var="tt" value="${oDTO.gprice*oDTO.gamount}" type="number" />
						<input type='text' id='total' value='${tt}' readonly></div>
						<div class="input-field inline">원</div>
					</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35">결제수단</td>
					<td class="td_default" height="35"><span>${oDTO.payMethod}</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td class="td_default" align="center">
			<a class="a_default" href="orderList">주문조회 페이지로 이동</a>
		</td>
	</tr>

</table>
</c:if>

<c:if test="${!empty oDTO_d}">
<table>
	<tr>
		<td><b>주문완료</b></td>
	</tr>
	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b></td>
	</tr>

	<tr>
		<td class="td_default"><b>${oDTO_d.userid}</b> 님의 주문이 안전하게
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
					<td class="td_default" height="35">${oDTO_d.orderName}</td>
				</tr>
				<tr>
					<td class="td_default" height="35">주소</td>
					<td class="td_default" height="35">(${oDTO_d.post1}-${oDTO_d.post2})<br> ${oDTO_d.addr1}
						${oDTO_d.addr2}
					</td>
				</tr>

				<tr>
					<td class="td_default" height="35">휴대전화</td>
					<td class="td_default" height="35">${oDTO_d.phone}</td>
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

				<tr>
					<td height="35" class="td_default"><span class="a_default">${oDTO_d.gname}</span>
					</td>
					<td height="35" class="td_default" align="center"><span
						id="price1"><fmt:formatNumber value="${oDTO_d.gprice}" type="number" /></span>원</td>
					<td height="35" class="td_default" align="center"><span
						id="num1">${oDTO_d.gamount}</span>개</td>
					<td height="35" class="td_default" align="center">
						<span><fmt:formatNumber value="${oDTO_d.gprice*oDTO_d.gamount}" type="number" /></span>원
					</td>
				</tr>

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
						<fmt:formatNumber var="tt2" value="${oDTO_d.gprice*oDTO_d.gamount}" type="number" />
						<input type='text' id='total' value='${tt2}' readonly></div>
						<div class="input-field inline">원</div>
					</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35">결제수단</td>
					<td class="td_default" height="35"><span>${oDTO_d.payMethod}</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td class="td_default" align="center">
			<a class="a_default" href="orderList">주문조회 페이지로 이동</a>
		</td>
	</tr>

</table>
</c:if>
