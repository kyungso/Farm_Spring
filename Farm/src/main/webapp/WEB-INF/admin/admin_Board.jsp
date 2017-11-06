<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
	$(document).ready(function() {
		$("#allCheck").on("click",function(evnet){
			var check = $(".check");
			$.each(check,function(idx,ele){
				ele.checked = event.target.checked;
			});
		});
	});
</script>

<style>
table {
	margin: 35px;
	width: 90%;
}

th, td {
	padding: 0px;
	text-align: center;
}

button {
	background-color: #008CBA;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
<body>
	<div align="center">
		<form action="#">
			<table style="width: 1300px;">
				<tr>
					<td align='center' valign='top'>
						<table>
							<tr bgcolor='#cecfce'>
								<td height='3' colspan='10' align='center'></td>
							</tr>
							<tr>
								<td bgcolor='#F0F0F0' align='center'><strong>No.</strong></td>
								<td bgcolor='#F0F0F0' align='center'><input type="checkbox" name="allCheck" id="allCheck"/>
    								<label for="allCheck"></label></td>
								<td bgcolor='#F0F0F0' align='center'><strong>아이디</strong></td>
								<td bgcolor='#F0F0F0' align='center'><strong>제 목</strong></td>
								<td bgcolor='#F0F0F0' align='center'><strong>작성자</strong></td>
								<td bgcolor='#F0F0F0' align='center'><strong>내용</strong></td>
								<td bgcolor='#F0F0F0' align='center'><strong>이미지</strong></td>
								<td bgcolor='#F0F0F0' align='center'><strong>조회수</strong></td>
								<td bgcolor='#F0F0F0' align='center'><strong>등록일</strong></td>
							</tr>
							
							<c:if test="${list.size()==0 }">
								<tr>
									<td>작성된 글이 없습니다.</td>
								</tr>
							</c:if> 
							<c:if test="${list.size()!=0 }">
								<c:forEach items="${list}" var="dto" varStatus="status">
									<tr>
										<td height='1' colspan='10' align='center' bgcolor='#cecfce'></td>
									</tr>
									<tr bgcolor='#ffffff'>
										<td width='30' height='40' align='center'>${dto.board_num}</td>
										<td width='30' height='40' align='center'><input type="checkbox" name="check" id="check${status.index}" class="check" >
										<label for="check${status.index}"></label></td>
										<td width='50' height='40' align='center'>${dto.userid}</td>
										<td width='70' height='40' align='center'>${dto.title}</td>
										<td width='50' height='40' align='center'>${dto.author}</td>
										<td width='50' height='40' align='center'>${dto.content}</td>
										<td width='50' height='40' align='center'>${dto.image}</td>
										<td width='30' height='40' align='center'>${dto.readCnt}</td>
										<td width='90' height='40' align='center'>${dto.writeday}</td>
									</tr>
								</c:forEach>
							</c:if> 
							<tr>
								<td height='1' colspan='10' align='center' bgcolor='#cecfce'></td>
							</tr>
						</table>
					</td>
				</tr>
				
			</table>
	<br>
	</form>
	</div>

</body>

