`+
 1	Q
 + <%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>	
	function ewrite(){
		 location.href="/app/write";
	}
	
	function searchBoard(f){
		f.action="boardForm";
	};	
</script>
<style>
table {
	margin: 40px;
	width: 60%;
	margin: auto;
}
th, td {
	padding: 8px;
	text-align: center;
}
.check {
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
.searchSubmit {
	background-color: #BCC2CA;
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
	div.center {
	width: 500px;
	margin: 0 auto;
}	

</style>
<body>
	<div align="center">
		<form name="myForm" >
						<table class="highlight" >
										<tr>
					<td align="left"><p>
							게시물 수 : <font color=red>${ list.getTotalCount()}</font></td>
				</tr>
				<tr>
							<tr bgcolor='#cecfce'>
								<td height='1' colspan='5'></td>
							</tr>
							<tr>
								<th bgcolor='#F0F0F0'>번 호</th>
								<th bgcolor='#F0F0F0'>제 목</th>
								<th bgcolor='#F0F0F0'>작성자</th>
								<th bgcolor='#F0F0F0'>등록일</th>
								<th bgcolor='#F0F0F0'>조회수</th>
							</tr><br>
							<c:if test="${list.getList().size()==0 }">
								<tr>
									<td>작성된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${list.getList().size()!=0 }">
								<c:forEach items="${list.getList() }" var="dto">
									<tr>
										<td >${dto.board_num}										
										<c:if test="${dto.secret==y}">
										<img src="images/write_default.gif">
										</c:if>
										<c:if test="${dto.secret!=y}">										
										<img src="images/write_lock.gif">
										</c:if>
										</td>
										<td id="retrieve${dto.board_num}">
													<a href="boardRetrieve?board_num=${dto.board_num}">${dto.title}</a></td>
										<td >${dto.author}</td>
										<td>${dto.writeday}</td>
										<td >${dto.readCnt}</td>
									</tr>
								</c:forEach>
							</c:if>
				
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="5"><jsp:include page="page.jsp"
							flush="true" /></td>
				</tr>
				<tr>
					<td>
					<br>
					<br>
									<select class="browser-default col s3 m6"  style="width: 150px; height: 30px; vertical-align: text-bottom;" 
										name="searchName" >
											<option value="title" >제목</option>
											<option value="author">작성자</option>
											<option value="content">내용</option>
										</select>
									<!-- </div> -->
									<span class="input-field inline" style="margin:0.09em 0; ">
										<input type="text" name="searchValue" placeholder="검색어를 입력해주세요">
									</span>
									<span class="input-field inline">
										<input type="submit" value="검색" class="searchSubmit"
										onclick="searchBoard(myForm)">
									</span>
					</td>
				</tr>
	</form>
	</div>
	<c:if test="${!empty sessionScope.login}">
		<center>
			<input type="button" value="글쓰기"
				onclick="ewrite()" class="check"/>			
		</center>
	</c:if>
<br>
</body>
