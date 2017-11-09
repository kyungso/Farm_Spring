<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>   

<script type="text/javascript">
	 $(document).ready(function(){
		$(".updateBtn").on("click",function(event){
			var num = $(this).attr("data-num");
			var amount = $("#CART_AMOUNT"+num).val();
			$("#sum"+num).text(($("#gPrice"+num).text())*amount);
			
			$.ajax({
				type:"get",
				url:"cartAmountUpdate",
				data:{
					cart_num:num,
					gAmount:amount
				},
				dataType:"text",
				success:function(responseData,status,xhr){
					console.log(responseData);
				},
				error:function(xhr,status,e){
					console.log(status,e);
				}
			});
		});
		
		$(".delBtn").on("click",function(event){
			var num = $(this).attr("data-num");
			$.ajax({
				type:"get",
				url:"delCart",
				data:{
					cart_num:num
				},
				dataType:"text",
				success:function(responseData,status,xhr){
					$("#tr"+num).remove();
				},
				error:function(xhr,status,e){
					console.log(status,e);
				}
			});
		});
		
		$("#delAllBtn").on("click",function(event){
			$.ajax({
				type:"get",
				url:"delAllCart",
				data:$("#myForm").serialize(),
				dataType:"text",
				success:function(responseData,status,xhr){
					console.log(responseData);
					
				},
				error:function(xhr,status,e){
					console.log(status,e);
				}
			});
			//체크된 값
			var check = $(":checked");
			$.each(check,function(idx,ele){
				console.log(ele.value);
				$("#tr"+ele.value).remove();
			});
		});
		
		$("#allCheck").on("click",function(evnet){
			var check = $(".check");
			$.each(check,function(idx,ele){
				ele.checked = event.target.checked;
			});
		});
		
		$("#keepShopping").on("click",function(event){ 
			$(location).attr('href','/app/goodsAllList');
		});
		
		$("#orderAllConfirm").on("click",function(event){
			$("form").attr('action','orderAllConfirm');
		}); 
		
		$(".order").on("click",function(evnet){
			var num = $(this).attr("data-num");
			var userid = $(this).attr("data-userid");
			
			$(location).attr('href',"orderConfirm?cart_num="+num+"&userid="+userid);
		});
		
	}); 
	 
 /* function orderAllConfirm(f){
	 f.action="orderAllConfirm";
	 f.submit();
 } 
 function order(num,userid){
	 location.href="orderConfirm?cart_num="+num+"&userid="+userid;
 }  */
 /* function keepShopping(){
	 location.href="/app/goodsAllList";
 }  */
 /* function delCart(num){
	if(confirm("삭제하시겠습니까?")){
		location.href="delCart?num="+num;
	}
	 
 } */
/*  function amountUpdate(num){
	 var amount = document.getElementById("CART_AMOUNT"+num).value;
	 location.href="cartAmountUpdate?cart_num="+num+"&gAmount="+amount;
 } */
 
 /* function allCheck(chk){
	var check = document.querySelectorAll(".check");
	for(var i=0; i<check.length; i++){
	    console.log(check[i].checked);
		check[i].checked=chk.checked;
	}
 } */
 
 /* function delAllCart(f){
	 if(confirm("전체 삭제하시겠습니까?")){
	 	f.action="delAllCart";
	 	f.submit();
	 }
 }
  */
 
</script>

<style>
table {
	width: 90%;
}

th, td {
	padding: 10px;
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
		<td colspan="10" class="td_default">&nbsp;&nbsp;&nbsp; 
			<font size="5"><b>- 장바구니-</b></font> &nbsp;
		</td>
	</tr>
	<tr>
		<td class="td_default">
			<input type="checkbox" name="allCheck" id="allCheck"/>
      		<label for="allCheck">전체선택</label>
		</td>
		<td class="td_default">주문번호</td>
		<td class="td_default" colspan="2">상품정보</td>
		<td class="td_default">판매가</td>
		<td class="td_default"colspan="2">수량</td>
		<td class="td_default">합계</td>
		<td colspan="2"></td>
	</tr>
	<c:if test="${cartList.size()==0}">
		<tr>
			<td colspan="10">장바구니에 담긴 상품이 없습니다.</td>
		</tr>
	</c:if>
<form name="myForm" id="myForm">
		<input type="hidden" name="userid" id="userid" value="${cartList[0].userid}">   
		<c:forEach var="list" items="${cartList}">
		 <%-- <input type="hidden" name="num${list.cart_num}" value="${list.cart_num}" id="num${list.cart_num}">
		 <input type="hidden" name="gCategory${list.cart_num}" value="${list.gCategory}" id="num"${list.cart_num}">
		 <input type="hidden" name="gImage1${list.cart_num}" value="${list.gImage1}" id="gImage1${list.cart_num}">
		 <input type="hidden" name="gName${list.cart_num}" value="${list.gName}" id="gName${list.cart_num}">
		 <input type="hidden" name="gPrice${list.cart_num}" value="${list.gPrice}" id="gPrice${list.cart_num}">--%>
		<%--  <input type="hidden" name="userid" id="userid" value="${list.userid}"> --%>
		 
		<tr id="tr${list.cart_num}">
			<td class="td_default">
				<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. --> 
				<input type="checkbox" name="check" id="check${list.cart_num}" class="check" value="${list.cart_num}">
				<label for="check${list.cart_num}"></label>
			</td>
			<td class="td_default" width="80">${list.cart_num}</td>
			<td class="td_default" width="80">
				<img src="images/items/${list.gimage1}.jpg" border="0" align="center" width="80" /></td>
			<td class="td_default" width="300" style='padding-left: 30px'>
				${list.gname} <br> 
			</td>
			<td class="td_default" align="center" width="110">
				<span id="gprice${list.cart_num}">${list.gprice}</span></td>
			<td class="td_default" align="center" width="90"><input
				class="input_default" type="text" name="CART_AMOUNT"
				id="CART_AMOUNT${list.cart_num}" style="text-align: right" maxlength="3" size="2"
				value="${list.gamount}"></input></td>
			<td><input type="button" value="수정" class="updateBtn" data-num="${list.cart_num}" /></td>
			<td class="td_default" align="center" width="80"
				style='padding-left: 5px'><span id="sum${list.cart_num}"> ${list.gprice*list.gamount} </span></td>
			<td><input type="button" value="구매" 
				class="order" data-num="${list.cart_num}" data-userid="${list.userid}"></td>
			<td class="td_default" align="center" width="30">
				<input type="button" value="삭제" 
				class="delBtn" data-num="${list.cart_num}"></td>
			<td height="10"></td>
		</tr>
		</c:forEach>

		<tr>
			<td colspan="10">
				<button id="orderAllConfirm">전체주문하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="delAllBtn">전체 삭제하기</button>&nbsp;&nbsp;&nbsp;&nbsp; 
				<button id="keepShopping">계속 쇼핑하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
	</form>
</table>
