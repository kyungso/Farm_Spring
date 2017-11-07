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

<script type="text/javascript">
 function back(){
	 history.back();
 }
 function keepShopping() {
		location.href = "goodsAllList";
 }
</script>

 <table>
	<tr>
		<td colspan="3" class="td_default">&nbsp;&nbsp;&nbsp; 
			<font size="5"><b>- 주문상세보기 -</b></font> &nbsp;
		</td>
	</tr>
	
	<tr>
		<td height="50"></td>
	</tr>
	
	<tr>
		<td><b>결제 정보</b></td>
	</tr>
	<tr>
		<td>
			<table class="bordered">
			<tr>
			 <th>상품금액</th>
			 <td id="price">${oDTO.gprice}</td>
			 <td></td>
			</tr>
			<tr>
			 <th>총 결제금액</th>
			 <td id="price">${oDTO.gprice*oDTO.gamount}원</td>
			 <td>${oDTO.payMethod}<br>
			 	 ${oDTO.orderDay}
			 </td>
			 </table>
		 </td>
	</tr>
	<tr>
		<td height="50"></td>
	</tr>
	
	<tr>
		<td><b>주문 상품 정보</b></td>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<td></td>
					<td colspan="2">상품 정보</td>
					<td>수량</td>
					<td>상품금액</td>
					<td>주문상태</td>
				</tr>
				<tr>
					<td>1</td>
					<td colspan="2">${oDTO.gname}</td>
					<td>${oDTO.gamount}</td>
					<td >${oDTO.gprice*oDTO.gamount}원</td>
					<td >구매확정</td>
				</tr>
			</table>
		 </td>
	</tr>
	<tr>
		<td height="50"></td>
	</tr>
	
	<tr>
		<td><b>배송지 정보</b></td>
	</tr>
	<tr>
		<td>
			<table>
			 <tr>
			  <td>받는사람</td>
			  <td colspan="4">
			  	${oDTO.orderName} <br>
			  	(${oDTO.post1}-${oDTO.post2})&nbsp; ${oDTO.addr1} <br> 
			  	지번: ${oDTO.addr2} <br>
			  	${oDTO.phone}<br><br>
			  	상품명: ${oDTO.gname}
			  </td>
			 </tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan="5">
			<button onclick="back()">이전 페이지로</button>&nbsp;&nbsp;&nbsp;&nbsp; 
			<button onclick="javascript:keepShopping()">계속 쇼핑하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>

