<%@page import="java.util.List"%>
<%@page import="com.dto.QnaPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
table {
    margin: 50px;
    width : 80%;
}

.button {
	background-color: #64b5f6;
	border: none;
	color: white;
	padding: 8px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 2px 2px;
	cursor: pointer;
	transition-duration: 0.4s;
}

.button {
	background-color: white;
	color: black;
	border: 2px solid gray;
}

.button:hover {
	background-color: #64b5f6;
	color: white;
	border: 2px solid white;
}
</style>


	<c:set var="curPage" value="${qnaList.curPage}" />
<c:set var="perPage" value="${QnaPageDTO.getPerPage()}" />
<c:set var="totalCount" value="${qnaList.totalCount}" />
<c:out value="${totalCount}"/>
<fmt:parseNumber var="totalNum" integerOnly="true"	value="${qnaList.getList().size()/perPage}" />
<c:out value="${totalNum}"/>
<c:if test="${totalCount%perPage!=0}">
<c:set var="totalNum" value="${totalNum+1}"/>
</c:if>
<c:if test="${startPage <1 }">
	<c:set var="startPage" value="1" />
</c:if>

<!-- totalNum == 총 페이지수, totalCount = 총 레코드 갯수 -->
<!-- 현재 페이지번호의 블럭번호 구하기 -->	
<fmt:parseNumber var="curBlock" integerOnly="true" value="${(curPage/perPage)+1 }" />
<!-- 시작페이지번호 구하기  -->	
<fmt:parseNumber var="startPage" integerOnly="true"	value="${(curBlock - 1)*perPage+1}" />
<!-- 마지막페이지번호 구하기 -->	
<fmt:parseNumber var="endPage" integerOnly="true" value="${(startPage +perPage)-1 }" />
<c:if test="${endPage > totalNum }">
	<c:set var="endPage" value="${totalNum}" />
</c:if>



<h1>&nbsp;&nbsp;&nbsp;Q & A</h1>
<table>
<thead>
<tr>
<th>글번호</th>
<th>작성자</th>
<th>제목</th>
<th>작성일</th>
<th>처리상태</th>
</tr>
</thead>
<tbody>
<c:if test="${qnaList.getList().size()==0}">
	<tr><td>레코드가 없습니다.</td></tr>
</c:if>

<c:if test="${qnaList.getList().size()!=0}">
<c:forEach var="qna" items="${qnaList.getList()}">
<tr>
<td>${qna.qna_num }</td>
<td>${qna.username }</td>
<td><a href="QNARetrieve?qna_num=${qna.qna_num}&userid=${sessionScope.login.userid}">${qna.title }</a></td>
<td>${qna.writeday }</td>
<td>
  <c:if test="${qna.state =='처리중' }">
  <div class="progress">
    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:100%">
     ${qna.state }
    </div>
  </div>
  </c:if>
  <c:if test="${qna.state =='답변완료' }">
  <div class="progress">
  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100"
  aria-valuemin="0" aria-valuemax="100" style="width:100%">
    ${qna.state}
  </div>
</div>
</c:if>
</td>
</tr>
</c:forEach>
</c:if>
<tr> <td >

<c:forEach begin="${startPage}" end="${totalNum}" varStatus="status">
<c:if test="${curPage==status.index}">
${status.index }
</c:if>
<c:if test="${curPage!=status.index }">
<a href="QNAList?userid=${sessionScope.login.userid}&curPage=${status.index}">${status.index}</a>
</c:if>
</c:forEach>
     </td></tr>
<tr><td><button class='button' onClick="location.href='QNAWriteUI'">문의하기</button></td></tr>
</tbody>
</table>


</body>
</html>
<c:if test="${!empty mesg }">
<script>
alert("${mesg}");
</script>
</c:if>
