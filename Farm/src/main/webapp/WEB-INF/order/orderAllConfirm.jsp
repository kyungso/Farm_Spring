<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->

<script>

	var result = true;
	function formCheck(){	
		var result = true;
		var orderName =$.trim($('#orderName').val());	
		var post1 =$("#post1").val();			
		var phone = $.trim($("#phone").val());	
		
		if(orderName == '' || orderName.length == 0){
			alert("이름을 입력하시오");
			document.getElementById("orderName").focus();
			result = false;
		}else if(post1 == '' || post1.length == 0){
		 	alert("주소를 입력하시오");
		 	result = false;
		}else if(phone == '' || phone.length == 0){
		 	alert("휴대전화를 입력하시오");
		 	document.getElementById("phone").focus();
		 	result = false;
		}
			return result;
	}
	
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			history.back();
		});
		$("#same").on("click",function(){
			console.log(this.checked);
			if(this.checked){
				$("#orderName").val($("#mname").val());
				$("#post1").val($("#mpost1").val());
				$("#post2").val($("#mpost2").val());
				$("#addr1").val($("#maddress1").val());
				$("#addr2").val($("#maddress2").val());
				$("#phone").val($("#mphone").val());
			}else{
				$("#orderName").val("");
				$("#post1").val("");
				$("#post2").val("");
				$("#addr1").val("");
				$("#addr2").val("");
				$("#phone").val("");
			}
		});
	});

</script>

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

<form name="myForm" action="OrderAllDoneServlet" onsubmit="return formCheck()">

	<table>
		<tr>
			<td><b>주문상품 확인</b></td>
		</tr>
		<tr>
			<td>
				<table>
					<tr>
						<td class="td_default" align="center"><strong>주문번호</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
						<td class="td_default" align="center"><strong>판매가</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
					</tr>
					
				<c:set var="total_cost" value="0"></c:set>
				<c:forEach var="cDTOlist" items="${cDTO}">
					<input type="hidden" name="cart_num" value="${cDTOlist.cart_num}">
					<input type="hidden" name="userid" value="${cDTOlist.userid}">
					<input type="hidden" name="gCode" value="${cDTOlist.gCode}">
					<input type="hidden" name="gName" value="${cDTOlist.gName}">
					<input type="hidden" name="gPrice" value="${cDTOlist.gPrice}">
					<input type="hidden" name="gSize" value="${cDTOlist.gSize}">
					<input type="hidden" name="gAmount" value="${cDTOlist.gAmount}">
					<input type="hidden" name="gImage1" value="${cDTOlist.gImage1}">
					<tr>
						<td class="td_default" width="80">${cDTOlist.cart_num}</td>
						<td class="td_default" width="80"><img
							src="images/items/${cDTOlist.gImage1}.jpg" border="0" align="center"
							width="80" /></td>
						<td class="td_default" width="300" style='padding-left: 30px'>${cDTOlist.gName}
							<br> <font size="2" color="#665b5f">[옵션 :
								사이즈(${cDTOlist.gSize}) ] </font>
						</td>
						<td class="td_default" align="center" width="110">${cDTOlist.gPrice}
						</td>
						<td class="td_default" align="center" width="90">${cDTOlist.gAmount}</td>
						<c:set var="total_cost" value="${total_cost+(cDTOlist.gPrice*cDTOlist.gAmount)}"></c:set>
					</tr>
				</c:forEach>

					<tr>
						<td height="30"></td>
						<td class="td_default" align="right">총 결제 금액 :</td>
						<td class="td_default" align='right'>${total_cost}원</td>
					</tr>
				</table>
		</td>
		</tr>
		<!--  고객 정보 시작-->
		<tr>
			<td><b>고객 정보</b></td>
		</tr>

		<tr>
			<td>
				<table>
					<tr>
						<td width="125" height="35" class="td_default">이 름</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="mname" size="20"
							maxlength="20" value="${mDTO.username}"></input></td>
					</tr>
					<tr>
						<td height="35" class="td_default">우편번호</td>
						<td height="35" class="td_default">
							<div class="input-field inline">
							<input class="input_default" type="text" id="mpost1" size="4"
							maxlength="3" value="${mDTO.post1}" readonly/></div>- 
							<div class="input-field inline">
							<input class="input_default" type="text" id="mpost2" size="4"
							maxlength="3" value="${mDTO.post2}" readonly/></div>
						</td>
					</tr>
					<tr>
						<td height="35" class="td_default">주 소</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="maddress1" size="35"
							maxlength="200" value="${mDTO.addr1}" readonly></input><br>
							<input class="input_default" type="text" id="maddress2" size="35"
							maxlength="200" value="${mDTO.addr2}" readonly></input></td>
					</tr>

					<tr>
						<td height="35" class="td_default">휴대전화</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="mphone" size="15"
							maxlength="15" value="${mDTO.phone1}${mDTO.phone2}${mDTO.phone3}"></input>

						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!--  고객 정보 끝-->

		<tr>
			<td class="td_default">
				<input type="checkbox" name="same" id="same"> 
				<label for="same">배송지가 동일할 경우 선택하세요.</label>
			</td>
		</tr>
		<!--  배송지 정보 시작-->
		<tr>
			<td><b>배송지 정보</b></td>
		</tr>

		<tr>
			<td>
				<table>
					<tr>
						<td width="125" height="35" class="td_default">이 름</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="orderName" name="orderName"
							size="20" maxlength="20" value=""></input></td>
					</tr>
					<tr>
						<td height="35" class="td_default">우편번호</td>
						<td height="35" class="td_default">
							<!-- 다음주소 시작--> 
							<div class="input-field inline">
								<input name="post1" id="post1" size="5" readonly="">
							</div>
							 - 
							<div class="input-field inline">
								<input name="post2" id="post2" size="5" readonly="">
							</div> 
							<div class="input-field inline">
							<input onclick="openDaumPostcode()" type="button" value="우편번호찾기"><br>
							</div>
							<input name="addr1" id="addr1" size="40" readonly="" placeholder="도로명주소"> <br> 
							<span style="line-height: 10%;"><br></span> 
							<input name="addr2" id="addr2" size="40" placeholder="지번주소"> 
							<!-- 다음주소 끝 -->
						</td>
					</tr>

					<tr>
						<td height="35" class="td_default">휴대전화</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="phone" name="phone"
							size="15" maxlength="15" value=""></input></td>
					</tr>
				</table>
			</td>
		</tr>
		<!--  배송지 정보 끝-->
		<tr>
			<td><b>결제수단</b></td>
		</tr>
		<tr>
			<td>
				<table>
					<tr>
						<td width="125" height="35" class="td_default">
						  <input type="radio" name="payMethod" id="payMethod1" class="with-gap" value="신용카드" checked></input> 
						  <label for="payMethod1">신용카드</label> 
						  <input type="radio" name="payMethod" id="payMethod2" class="with-gap" value="계좌이체"></input> 
						  <label for="payMethod2">계좌이체</label>
						  <input type="radio" name="payMethod" id="payMethod3" class="with-gap" value="무통장 입금"></input>
						  <label for="payMethod3">무통장 입금</label>
						 </td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td class="td_default" align="center">
				<button id="cancel">취소</button>
				<input type="submit" value="결제하기">
			</td>
		</tr>

	</table>

</form>
