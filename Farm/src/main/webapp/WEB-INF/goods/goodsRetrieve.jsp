<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${!empty cart}">
	<script>alert('${cart}')</script>
</c:if>

<style>
 #total{
 	font-size: x-large;
 	font-weight: bold;
 	color: #37474f;
 }
 #a{
 	font-size: medium;
 	font-weight: bold;
 }
</style>

<script>
	$(document).ready(function(){
		$("#cartButton").on("click",function(){
			/* document.goodRetrieveForm.action ="CartAddServlet"; */
			$("form").attr('action','cartAdd');
		});
		
		$("#orderButton").on("click",function(){
				/* document.goodRetrieveForm.action ="OrderConfirmServlet"; */
				$("form").attr('action','orderConfirm_d');
		});
		
		$("#up").on("click",function(){
			var amount = parseInt($("#gamount").val());
			amount+=1;
			$("#gamount").val(amount);
			$("#total").text(numberWithCommas(($("#gprice").val())*amount));
			
			$("#total").css({"font-weight":"bold","font-size":"x-large","color":"#37474f"});
			$("#a").css({"font-weight":"bold","font-size":"medium"});
		});
		
		$("#down").on("click",function(){
			var amount = parseInt($("#gamount").val());
			amount-=1;
			 if(amount==0){
				 amount=1;
			 }
			 $("#gamount").val(amount);
			 $("#total").text(numberWithCommas(($("#gprice").val())*amount));
			 
			 $("#total").css({"font-weight":"bold","font-size":"x-large","color":"#37474f"});
			 $("#a").css({"font-weight":"bold","font-size":"medium"});
		});
		
		// bottomFix의 button
		$("#bottom_home").on("click",function(){
			/* location.href = "home.jsp"; */
			$(location).attr('href','/app/');
		});
		
		$("#bottom_order").on("click",function(){
			/* document.goodRetrieveForm.action ="OrderConfirmServlet";
			document.goodRetrieveForm.submit(); */
			$("form").attr('action','orderConfirm_d').submit();
		});
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

	}); //ready end
	
</script>

<form name="goodRetrieveForm" >
	<input type="hidden" name="gimage1" value="${goodsRetrieve.gimage1}">
	<input type="hidden" name="gcategory" value="${goodsRetrieve.gcategory}">
	<input type="hidden" name="gcode" value="${goodsRetrieve.gcode}">
	<input type="hidden" name="gname" value="${goodsRetrieve.gname}">
	<input type="hidden" name="gprice" id="gprice" value="${goodsRetrieve.gprice}">

	
 	<table style='margin-left: 15%'>
		<tr>
			<td>
				<table style="width: 70%;">
					<tr>
						<td><font size="5"><b>- 상품 정보 -</b></font>&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="8">
						 <img src="images/items/${goodsRetrieve.gimage1}.jpg" width="400" />
						   <img src="/images/${goodsRetrieve.gimage1}"border="0" align="center" width="400"   ></td>
						<%-- <td class="td_title">제품코드</td>
						<td class="td_default" colspan="2">${goodsRetrieve.gcode}</td> --%>
					</tr>
					<tr>
						<td colspan="2"><font size="5">${goodsRetrieve.gname}</font></td>
					</tr>
					<tr>
						<td>가격</td>
						<td colspan="2"><fmt:formatNumber value="${goodsRetrieve.gprice}" type="number" />원</td>
					</tr>
					<tr>
						<td>배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"><b> 무료배송</b> </font> <font size="2">(도서 산간지역 별도 배송비 추가)</font></td>
					</tr>
					<tr>
						<td>주문수량</td>
						
						 <!--  <td><img src="images/down.PNG" id="down"></td> -->
						  <td class="row">
						   	<img class="col s2" src="images/down.PNG" id="down">
						  	<input class="input-field col s2" type="text"
							     name="gamount" value="1" id="gamount"
							     style="text-align: right; height: 18px">&nbsp;&nbsp;
							<img class="col s2" src="images/up.PNG" id="up">
							<!-- <img src="images/up.PNG" id="up">  -->
						  </td>
						
					</tr> 
					<tr>
						<td colspan="2"><hr style="border: solid 1px lightgrey;"></td>
					</tr>
					<tr>
						<td><b>총 상품금액</b></td>
						<td style="text-align: right;">
							<b id="total"><span><fmt:formatNumber  value="${goodsRetrieve.gprice}" type="number" /></span></b>
							<font id="a">원</font>
						</td>
					</tr>
					<tr>
					 <td colspan="3">
					
					  <button id="orderButton" class="btn white black-text">구매</button>&nbsp;&nbsp;
					  <button id="cartButton" class="btn white black-text">장바구니</button>
					 </td>
					</tr>
				</table>
			</td>
		</tr>
	</table> 
</form>

<hr style="border: solid 1px lightgrey;">
 <div align="center" style="margin-top: 50px">
  <img src="images/items/${goodsRetrieve.gimage2}.jpg" border="0" align="center" />
   <img src="/images/${goodsRetrieve.gimage2}" border="0" align="center"  >	</td>
 </div>
 