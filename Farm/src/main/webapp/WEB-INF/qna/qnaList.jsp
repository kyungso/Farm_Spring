<%@page import="java.util.List"%>
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
</style>

<h1>&nbsp;&nbsp;&nbsp;Q & A</h1>
<table >
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
<c:if test="${qnaList.size()==0}">
	<tr><td>레코드가 없습니다.</td></tr>
</c:if>

<c:if test="${qnaList.size()!=0}">
<c:forEach var="qna" items="${qnaList}">
<tr>
<td>${qna.qna_num }</td>
<td>${qna.username }</td>
<td><a href="QNARetrieveServlet?qna_num=${qna.qna_num}&userid=${sessionScope.login.userid}">${qna.title }</a></td>
<td>${qna.writeday }</td>
<td>
<c:if test="${qna.state=='처리중'}">
  <div class="progress">
    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:100%">
     ${qna.state }
    </div>
  </div>
</c:if>  
  
<c:if test="${qna.state=='답변완료'}">
   <div class="progress">
<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
		      ${qna.state }
		    </div>
		  </div>
</c:if>  
</td>
</tr>
</c:forEach>
</c:if>
</tbody>
</table>
<button onClick="location.href='QNAWriteUIServlet'">문의하기</button>

</body>
</html>
<c:if test="${!empty qnaWrite }">
<script>
alert("${qnaWrite}");
</script>
</c:if>
<c:if test="${!empty qnaDelete }">
<script>
alert("${qnaDelete}");
</script>
</c:if>