<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>	
	function ewrite(){
		 location.href="/app/write";
		 f.submit();
	}
</script>
<style>
table {
	margin: 35px;
	width: 80%;
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
		<form action="FreeBoardListServlet">
			<table style="width: 1000px;">
				<tr>
					<td align="left"><p>
							게시물 수 : <font color=red>${ list.getTotalCount()}</font></td>
				</tr>
				<tr>
					<td align='center' valign='top'>
						<table>
							<tr bgcolor='#cecfce'>
								<td height='3' colspan='5' align='center'></td>
							</tr>
							<tr>
								<td bgcolor='#F0F0F0'><strong>글번호</strong></td>
								<td bgcolor='#F0F0F0'><strong>제 목</strong></td>
								<td bgcolor='#F0F0F0'><strong>작성자</strong></td>
								<td bgcolor='#F0F0F0'><strong>등록일</strong></td>
								<td bgcolor='#F0F0F0'><strong>조회수</strong></td>
							</tr>
							<c:if test="${list.getList().size()==0 }">
								<tr>
									<td>작성된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${list.getList().size()!=0 }">
								<c:forEach items="${list.getList() }" var="dto">
									<tr>
										<td height='1' colspan='5' align='center' bgcolor='#cecfce'></td>
									</tr>
									<tr bgcolor='#ffffff'>
										<td width='50' height='25' align='center'><p>${dto.board_num}</td>
										<td width='280' height='25'><p>
												<a href="retrieve/board_num/${dto.board_num}">${dto.title}</a></td>
										<td width='60' height='25' align='center'><p>${dto.author}</td>
										<td width='65' height='25' align='center'><p>${dto.writeday}</td>
										<td width='50' height='25' align='center'><p>${dto.readCnt}</td>
									<%-- 	<input type="hidden" name="userid" value="${dto.userid }" /> --%>
									</tr>
								</c:forEach>
							</c:if>
							<tr>
								<td height='1' colspan='5' align='center' bgcolor='#cecfce'></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="5"><jsp:include page="page.jsp"
							flush="true" /></td>
				</tr>
				<tr>
					<td>
							<center>
							<div style="width: 500px; height: 20px;">
								<form action="FreeBoardListServlet" class="aa">
									<div class="input-field inline">
										<select name="searchName"
											style="background: #FDFF62; color: black; font-size: 50pt">
											<option value="title">제목</option>
											<option value="author">작성자</option>
											<option value="content">내용</option>
										</select>
									</div>
									<div class="input-field inline">
										<input type="text" name="searchValue">
									</div>
									<div class="input-field inline">
										<input type="submit" value="검색" class="searchsubmit">
									</div>
								</form>
						</div>
						</center>
					</td>
				</tr>
			</table>
	<br>
	</form>
	</div>
	<c:if test="${!empty sessionScope.login}">
		<center>
			<!-- <a href="write">글쓰기</a>  -->
			<input type="button" value="글쓰기"
				onclick="ewrite()" />
			
		</center>
	</c:if>

</body>
