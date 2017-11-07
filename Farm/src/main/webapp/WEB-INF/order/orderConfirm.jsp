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
</script>
<script>
 var result = true;
 function formCheck_direct(){	
	var result = true;
	var orderName =$.trim($('#orderName_d').val());	
	var post1 =$("#post1_d").val();			
	var phone = $.trim($("#phone_d").val());	
	
	if(orderName == '' || orderName.length == 0){
		alert("이름을 입력하시오");
		document.getElementById("orderName_d").focus();
		result = false;
	}else if(post1 == '' || post1.length == 0){
	 	alert("주소를 입력하시오");
	 	result = false;
	}else if(phone == '' || phone.length == 0){
	 	alert("휴대전화를 입력하시오");
	 	document.getElementById("phone_d").focus();
	 	result = false;
	}
		return result;
	}
</script>
<script>

	$(document).ready(function(){
		$("#cancel").on("click",function(){
			history.back();
		});
		$("#cancel_d").on("click",function(){
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
		

		$("#same_d").on("click",function(){
			console.log(this.checked);
			if(this.checked){
				$("#orderName_d").val($("#mname_d").val());
				$("#post1_d").val($("#mpost1_d").val());
				$("#post2_d").val($("#mpost2_d").val());
				$("#addr1_d").val($("#maddress1_d").val());
				$("#addr2_d").val($("#maddress2_d").val());
				$("#phone_d").val($("#mphone_d").val());
			}else{
				$("#orderName_d").val("");
				$("#post1_d").val("");
				$("#post2_d").val("");
				$("#addr1_d").val("");
				$("#addr2_d").val("");
				$("#phone_d").val("");
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
<c:if test="${!empty cDTO}">
<form action="orderDone" onsubmit="return formCheck()">
	<input type="hidden" name="cart_num" value="${cDTO.cart_num}">
	<input type="hidden" name="userid" value="${mDTO.userid}"> 
	<input type="hidden" name="gcode" value="${cDTO.gcode}"> 
	<input type="hidden" name="gname" value="${cDTO.gname}"> 
	<input type="hidden" name="gprice" value="${cDTO.gprice}"> 
	<input type="hidden" name="gamount" value="${cDTO.gamount}"> 
	<input type="hidden" name="gimage1" value="${cDTO.gimage1}">

	<table>
		<tr>
			<td><b>주문상품 확인</b></td>
		</tr>

		<tr>
			<td>
				<table>
					<tr>
						<td class="td_default">주문번호</td>
						<td class="td_default" colspan="2">상품정보</td>
						<td class="td_default" >판매가</td>
						<td class="td_default" colspan="2">수량</td>

					</tr>

					<tr>
						<td class="td_default" width="80">${cDTO.cart_num}</td>
						<td class="td_default" width="80"><img
							src="images/items/${cDTO.gimage1}.jpg" border="0" align="center"
							width="80" /></td>
						<td class="td_default" width="300" style='padding-left: 30px'>${cDTO.gname}
							<br> 
						</td>
						<td class="td_default" align="center" width="110">${cDTO.gprice}
						</td>
						<td class="td_default" align="center" width="90">${cDTO.gamount}</td>

					</tr>


					<tr>
						<td height="30"></td>
						<td class="td_default" align="right">총 결제 금액 :</td>
						<td class="td_default" align='right'>${cDTO.gprice*cDTO.gamount}원</td>
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
			<td class="td_default"><input type="checkbox" name="same" id="same"> 
			<label for="same">배송지가 동일할 경우 선택하세요.</label></td>
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
						<input type="radio" name="payMethod" id="payMethod1" class="with-gap" value="신용카드" checked/> 
						<label for="payMethod1">신용카드</label> 
						<input type="radio" name="payMethod" id="payMethod2" class="with-gap" value="계좌이체"/>
						<label for="payMethod2">계좌이체</label> 
						<input type="radio" name="payMethod" id="payMethod3" class="with-gap" value="무통장 입금"/> 
						<label for="payMethod3">무통장 입금</label></td>

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
</c:if>

<c:if test="${empty cDTO}">
<form action="orderDone_d" onsubmit="return formCheck_direct()">
	<input type="hidden" name="userid" value="${memDTO.userid}"> 
	<input type="hidden" name="gcode" value="${gDTO.gcode}"> 
	<input type="hidden" name="gname" value="${gDTO.gname}"> 
	<input type="hidden" name="gprice" value="${gDTO.gprice}"> 
	<input type="hidden" name="gamount" value="${gamount}"> 
	<input type="hidden" name="gimage1" value="${gDTO.gimage1}">

	<table>
		<tr>
			<td><b>주문상품 확인</b></td>
		</tr>

		<tr>
			<td>
				<table>
					<tr>
						<td class="td_default">주문번호</td>
						<td class="td_default" colspan="2">상품정보</td>
						<td class="td_default" >판매가</td>
						<td class="td_default" colspan="2">수량</td>

					</tr>

					<tr>
						<td class="td_default" width="80"></td>
						<td class="td_default" width="80"><img
							src="images/items/${gDTO.gimage1}.jpg" border="0" align="center"
							width="80" /></td>
						<td class="td_default" width="300" style='padding-left: 30px'>${gDTO.gname}
							<br>
						</td>
						<td class="td_default" align="center" width="110">${gDTO.gprice}
						</td>
						<td class="td_default" align="center" width="90">${gamount}</td>

					</tr>


					<tr>
						<td height="30"></td>
						<td class="td_default" align="right">총 결제 금액 :</td>
						<td class="td_default" align='right'>${gDTO.gprice*gamount}원</td>
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
							class="input_default" type="text" id="mname_d" size="20"
							maxlength="20" value="${memDTO.username}"></input></td>
					</tr>
					<tr>
						<td height="35" class="td_default">우편번호</td>
						<td height="35" class="td_default">
							<div class="input-field inline">
							<input class="input_default" type="text" id="mpost1_d" size="4"
							maxlength="3" value="${memDTO.post1}" readonly/></div>- 
							<div class="input-field inline">
							<input class="input_default" type="text" id="mpost2_d" size="4"
							maxlength="3" value="${memDTO.post2}" readonly/></div>
						</td>
					</tr>
					<tr>
						<td height="35" class="td_default">주 소</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="maddress1_d" size="35"
							maxlength="200" value="${memDTO.addr1}" readonly></input><br>
							<input class="input_default" type="text" id="maddress2_d" size="35"
							maxlength="200" value="${memDTO.addr2}" readonly></input></td>
					</tr>

					<tr>
						<td height="35" class="td_default">휴대전화</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="mphone_d" size="15"
							maxlength="15" value="${memDTO.phone1}${memDTO.phone2}${memDTO.phone3}"></input>

						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!--  고객 정보 끝-->
		<tr>
			<td class="td_default"><input type="checkbox" name="same" id="same_d"> 
			<label for="same_d">배송지가 동일할 경우 선택하세요.</label></td>
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
							class="input_default" type="text" id="orderName_d" name="orderName"
							size="20" maxlength="20" value=""></input></td>
					</tr>
					<tr>
						<td height="35" class="td_default">우편번호</td>
						<td height="35" class="td_default">
							<!-- 다음주소 시작--> 
							<div class="input-field inline">
								<input name="post1" id="post1_d" size="5" readonly="">
							</div>
							 - 
							<div class="input-field inline">
								<input name="post2" id="post2_d" size="5" readonly="">
							</div> 
							<div class="input-field inline">
							<input onclick="openDaumPostcode()" type="button" value="우편번호찾기"><br>
							</div>
							<input name="addr1" id="addr1_d" size="40" readonly="" placeholder="도로명주소"> <br> 
							<span style="line-height: 10%;"><br></span> 
							<input name="addr2" id="addr2_d" size="40" placeholder="지번주소"> 
							<!-- 다음주소 끝 -->
						</td>
					</tr>

					<tr>
						<td height="35" class="td_default">휴대전화</td>
						<td height="35" class="td_default"><input
							class="input_default" type="text" id="phone_d" name="phone"
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
						<input type="radio" name="payMethod" id="payMethod1_d" class="with-gap" value="신용카드" checked/> 
						<label for="payMethod1">신용카드</label> 
						<input type="radio" name="payMethod" id="payMethod2_d" class="with-gap" value="계좌이체"/>
						<label for="payMethod2">계좌이체</label> 
						<input type="radio" name="payMethod" id="payMethod3_d" class="with-gap" value="무통장 입금"/> 
						<label for="payMethod3">무통장 입금</label></td>

					</tr>

				</table>
			</td>
		</tr>

		<tr>
			<td class="td_default" align="center">
				<button id="cancel_d">취소</button> 
				<input type="submit" value="결제하기">
			</td>
		</tr>

	</table>

</form>
</c:if>
