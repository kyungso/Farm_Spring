<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<form action="QNAReplyWrite" method="POST">
<input type="hidden" name="state" value="답변완료">
<input type="hidden" name="username" value="${sessionScope.login.username}">
<input type="hidden" name="phone1" value="${sessionScope.login.phone1}">
<input type="hidden" name="phone2" value="${sessionScope.login.phone2}">
<input type="hidden" name="phone3" value="${sessionScope.login.phone3}">
<input type="hidden" name="email" value="${sessionScope.login.email}">
<table style="margin:50px;width:80%;">
<tr>
<td>글번호 : <input type="text" value="${qna_num}" name="qna_num" readonly="readonly"></td>
<td>작성자 : <input type="text" value="${sessionScope.login.userid}" name="userid" readonly="readonly"></td>
</tr>
<tr><td>글제목 : <input type="text" value='└──RE:&nbsp;${title}' name="title" readonly style="font-weight:bold"></td></tr>
<tr><td>답변 내용</td></tr>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<textarea name="content" rows="500" cols="30" style="width:80%;"></textarea><br>
<input type="submit" value="답변쓰기">
</form>