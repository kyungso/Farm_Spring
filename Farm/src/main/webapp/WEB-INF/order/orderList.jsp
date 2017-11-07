<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- datepicker시작  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- datepicker끝 -->

<c:set var="orderpageDTO" value="${orderpageList}"></c:set>
<c:set var="orderList" value="${orderpageDTO.list}"></c:set>

<script type="text/javascript">
	function delOrder(f) {
		if (confirm("삭제하시겠습니까?")) {
			f.action = "orderDel";
			f.submit();
		}
	}
	function keepShopping() {
		location.href = "goodsAllList";
	}

	function allCheck(chk) {
		var check = document.querySelectorAll(".check");
		for (var i = 0; i < check.length; i++) {
			console.log(check[i].checked);
			check[i].checked = chk.checked;
		}
	}
	function retrieve(order_num) {
		location.href = "orderListDetail?order_num=" + order_num;
	}
	
	// 달력 시작
	$(document).ready(function(){
		var today = new Date();
		
		$.datepicker.setDefaults({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
		  });
			
			$("#datepicker1").val('${orderpageDTO.start_date}');
			$("#datepicker2").val('${orderpageDTO.end_date}');
			//초기 달력 값 끝
			
		  $(function() {
		    $("#datepicker1, #datepicker2").datepicker();
		    
		    $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val());
		    $('#datepicker1').datepicker("option", "onSelect", function (selectedDate) {
		        $("#datepicker2").datepicker( "option", "minDate", selectedDate );
		        //console.log(selectedDate);
		    });
		
		    $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
		    $('#datepicker2').datepicker("option", "onSelect", function (selectedDate) {
		        $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
		        //console.log(selectedDate);
		    });
		    
		  });
		  var searchDate=null;//searchDate 오늘,1주일,1개월
		  $("#today").on("click",function(){
			 $("#datepicker1").val('${orderpageDTO.end_date}');
			 $("#datepicker2").val('${orderpageDTO.end_date}');
	
		  });
		  $("#week").on("click",function(){
			 var month = (today.getMonth() + 1);
			 var day = today.getDate()-7;
		     month = (month < 10) ? "0"+month : month;
			 day = (day < 10) ? "0"+day : day;
			 start_date = today.getFullYear() + "-" + month + "-" + day;
			 $("#datepicker1").val(start_date);
			 $("#datepicker2").val('${orderpageDTO.end_date}');
			
		  });
		  $("#month").on("click",function(){
			 var month = (today.getMonth());
			 var day = today.getDate();
			 month = (month < 10) ? "0"+month : month;
		     day = (day < 10) ? "0"+day : day;
			 start_date = today.getFullYear() + "-" + month + "-" + day;
			 $("#datepicker1").val(start_date);
			 $("#datepicker2").val('${orderpageDTO.end_date}');
			 
		  });
		  
		  $("#search").on("click", function() {
			  var y = $("#searchValue").val();
			  var s = $("#datepicker1").val();
			  var e = $("#datepicker2").val();
			  location.href = "orderList?&searchValue="+y+"&start_date="+s+"&end_date="+e;
		  });
		  
	});
	
</script>
<script type="text/javascript">
	function move_box(an, box) {
		//링크된 위치에서 부터의 설정값 지정
		var cleft = 20; //왼쪽마진  
		var ctop = -10; //상단마진
		var obj = an;
		while (obj.offsetParent) {
			cleft += obj.offsetLeft;
			ctop += obj.offsetTop;
			obj = obj.offsetParent;
		}
		box.style.left = cleft + 'px';
		ctop += an.offsetHeight + 8;
		if (document.body.currentStyle
				&& document.body.currentStyle['marginTop']) {
			ctop += parseInt(document.body.currentStyle['marginTop']);
		}
		box.style.top = ctop + 'px';
	}

	function show_hide_box(an, width, height, borderStyle) {
		var href = an.href;
		var boxdiv = document.getElementById(href);

		if (boxdiv != null) {
			if (boxdiv.style.display == 'none') {
				move_box(an, boxdiv);
				boxdiv.style.display = 'block';
			} else
				boxdiv.style.display = 'none';
			return false;
		}

		boxdiv = document.createElement('div');
		boxdiv.setAttribute('id', href);
		boxdiv.style.display = 'block';
		boxdiv.style.position = 'absolute';
		boxdiv.style.width = width + 'px';
		boxdiv.style.height = height + 'px';
		boxdiv.style.border = borderStyle;
		boxdiv.style.backgroundColor = '#fff';

		var contents = document.createElement('iframe');
		contents.scrolling = 'no';
		contents.frameBorder = '0';
		contents.style.width = width + 'px';
		contents.style.height = height + 'px';
		contents.src = href;

		boxdiv.appendChild(contents);
		document.body.appendChild(boxdiv);
		move_box(an, boxdiv);

		return false;
	}
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

label {
	color: black;
}

#table {
	width: 3%;
}

.td {
	text-align: left;
	border-bottom: 1px solid #ddd;
}
</style>
	
<table>
	<tr>
		<td colspan="8" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>- 주문내역 -</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td>조회기간</td>
		<td colspan="15">
			<input type="submit" name="searchDate" id="today" value="오늘">&nbsp; 
			<input type="submit" name="searchDate" id="week" value="1주일">&nbsp; 
			<input type="submit" name="searchDate" id="month" value="1개월">&nbsp;
			<br>
			<div class="input-field inline">
  				<input type="text" id="datepicker1" value="${orderpageDTO.start_date}"> 
  			</div>~
  			<div class="input-field inline">
 				<input type="text" id="datepicker2" value="${orderpageDTO.end_date}">
			</div><br>
			<div class="input-field inline">
				<input type="text" name="searchValue" id="searchValue"
					placeholder="주문 상품명을 검색!">
			</div>
			<div class="input-field inline">
				<input type="submit" id="search" value="조회하기">
			</div></td>
	<tr>
		<td class="td_default"><input type="checkbox" name="allCheck"
			id="allCheck" onclick="allCheck(this)" /> <label for="allCheck"></label>
		</td>
		<td class="td_default" colspan="2">주문일자</td>
		<td class="td_default" colspan="2">주문 상품 정보</td>
		<td class="td_default">상품금액</td>
		<td class="td_default">주문상태</td>
	</tr>

	<c:if test="${orderList.size()==0}">
		<tr>
			<td colspan="8">최근 주문 내역이 없습니다.</td>
		</tr>
	</c:if>

	<form name="myForm">
		<c:forEach var="list" items="${orderList}">

			<input type="hidden" name="order_num${list.order_num}"
				value="${list.order_num}">
			<input type="hidden" name="userid${list.order_num}"
				value="${list.userid}">
			<input type="hidden" name="gcode${list.order_num}"
				value="${list.gcode}">
			<input type="hidden" name="gimage1${list.order_num}"
				value="${list.gimage1}">
			<input type="hidden" name="gname${list.order_num}"
				value="${list.gname}">
			<input type="hidden" name="gprice${list.order_num}"
				value="${list.gprice}">
			<input type="hidden" name="gamount${list.order_num}"
				value="${list.gamount}">
			<input type="hidden" name="orderName${list.order_num}"
				value="${list.orderName}">
			<input type="hidden" name="phone${list.order_num}"
				value="${list.phone}">
			<input type="hidden" name="post1${list.order_num}"
				value="${list.post1}">
			<input type="hidden" name="post2${list.order_num}"
				value="${list.post2}">
			<input type="hidden" name="addr1${list.order_num}"
				value="${list.addr1}">
			<input type="hidden" name="addr2${list.order_num}"
				value="${list.addr2}">
			<input type="hidden" name="payMethod${list.order_num}"
				value="${list.payMethod}">
			<input type="hidden" name="orderDay${list.order_num}"
				value="${list.orderDay}">

			<tr>
				<td class="td_default">
					<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. --> <input
					type="checkbox" name="check" id="check${list.order_num}"
					class="check" value="${list.order_num}"> <label
					for="check${list.order_num}"></label>
				</td>
				<td class="td_default" colspan="2"><a>${list.orderDay}</a><br>
					<input type="button" onclick="retrieve('${list.order_num}')"
					value="상세보기"></td>
				<td class="td_default"><img
					src="images/items/${list.gimage1}.jpg" border="0" width="80" /></td>
				<td class="td_default" width="300"><a
					href="modal?gname=${list.gname}&gimage1=${list.gimage1}&gprice=${list.gprice}&gcode=${list.gcode}"
					onClick="return show_hide_box(this,440,300,'1px solid')">
						${list.gname}</a> <br> </td>

				<td class="td_default" align="center" width="110">${list.gprice}<br>
					<font size="2" color="#665b5f">[ (${list.gamount}개) ] </font>
				</td>
				<td>구매확정</td>
			</tr>
		</c:forEach>

	</form>
	<tr>
		<td colspan="7" align="center"><jsp:include page="orderPage.jsp"
				flush="true" /></td>
	</tr>
	<tr>
		<td colspan="10">
			<button onclick="javascript:delOrder(myForm)">삭제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button onclick="javascript:keepShopping()">계속 쇼핑하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>


