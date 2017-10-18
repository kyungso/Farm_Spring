<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function bUpdate(){
	 location.href="/app/boardUpdate";
	 f.submit();
}

function bDelete(board_num){
	 location.href="/app/delete?board_num="+board_num;
	 f.submit();
}

function bForm(){
	 location.href="/app/boardForm";
	 f.submit();
}

</script>
<style>
table {
	margin: 30px;
	width: 90%;
	overflow:auto;
}

th, td {
	padding: 0px;
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
button {
    background-color: #a1f461;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px 1px;
    cursor: pointer;
}
</style>
</head>


<form  method="post"  name="myForm"> 
<center>
	<input type="hidden" name="title" value="${retrieve.title}"/>
	<input type="hidden" name="author" value="${retrieve.author}"/>
	<input type="hidden" name="content" value="${retrieve.content}"/>
	<input type="hidden" name="image" value="${retrieve.image}"/>
<table width='95%' height='100%' border='0' cellpadding='0' cellspacing='0' >
	<tr>

	
		<td height='100%' valign='top'> 
			<table width='100%' height='500' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>
				<tr> 
					<td align='center' valign='top'>
						<table width='100%' border='0' cellpadding='5' cellspacing='0' class='b'>
							<tr align='center'> 
								<td height='3' colspan='4' align='center' bgcolor='#cecfce'> </td>
							</tr>
							<tr > 
							
								<td  width='50' height='25' align='center' bgcolor='#F0F0F0'><b>제목</b> </td>
								<td height='25' colspan='3'>
									<table width='100%' border='0' cellspacing='0' cellpadding='0' class='b'>
										<tr> 
											<td height='25'>${retrieve.title }</td>
											<td width='50' height='25' align='center' bgcolor='#F0F0F0' ><b>조회수</b></td>
								<td width='150' >${retrieve.readCnt } </td>
																			</tr>
									</table>
								</td>
							</tr>
							<tr align='center' bgcolor='#cecfce'> 
								<td height='1' colspan='4' align='center'></td>
							</tr>
							<tr > 
								<td width='50' height='29' align='center' bgcolor='#F0F0F0' ><b>작성자</b></td>
								<td width='150' >${retrieve.author }</td>
								<td width='50' align='center' bgcolor='#F0F0F0' ><b>등록일</b></td>
								<td width='150' >${retrieve.writeday }</td>
								
							</tr>
							<tr align='center' bgcolor='#cecfce'> 
								<td height='1' colspan='4' align='center'></td>
							</tr>
							<tr align='center' valign='top'> 
								<td colspan='4' align='center'  > 
								<div align='justify' class='text3'>
					      ${retrieve.content }<br>					       
					      <img src="images/${retrieve.image}">	
								</div>
								</td>
							</tr>
							<tr align='center' bgcolor='#cecfce'> 
								<td height='3' colspan='4' align='center'></td>
							</tr>					
						
							<tr align='center'> 
								<td colspan='4' align='center'></td>
							</tr>
							<tr>
						</table>
					</td>
				</tr>
				<tr> 
					<td>&nbsp;</td>
				</tr>
<%-- 				<c:if test="${isExistsFavoirteData }">
				<span id="favorite" style="color:red;">♥</span>
				</c:if>
				<c:if test="${!isExistsFavoirteData }">
				<span id="favorite" style="color:red;"></span>
				</c:if> --%>
								
			</table>
		</td>
	</tr>
<tr>
<td>
<center>
   <c:if test="${sessionScope.login.userid==retrieve.userid}">
                 <input type="button" value="수정" onclick="bUpdate()" />
                 <input type="button" value="삭제" 
                 onclick="bDelete('${retrieve.board_num}')"/>
                    <!-- <a href="boardWrite">수정</a> &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="delete">삭제</a> &nbsp;&nbsp;&nbsp;&nbsp; -->

    </c:if>
<input type="button" value="목록" onclick="bForm()" />
<!-- <a href="boardForm">목록</a> -->
</center>

</td>
</tr>

</table>
</center>

</form>
<center>

<form id="replyAction" action="CommentWriteServlet" method="post">
    <div class="reply_comment"  style="width:550px; ">
    <input type="hidden" name="board_num" value="${retrieve.board_num}">
    <input type="hidden" name="userid" value="${sessionScope.login.userid}">
        <textarea class="replyComment" id="replyComment" name="cocontent" rows="3" cols="30"
        placeholder="댓글을 작성해주세요" ></textarea>
    </div>

    <c:if test="${empty sessionScope.login}">
    <button type="submit" disabled="disabled">댓글쓰기</button>
     </c:if>
     <c:if test="${!empty sessionScope.login}">
    <button type="submit">댓글쓰기</button>
     </c:if>
</form>
</center>
		<br>
		<table>
			<tr>
				<td>작성자</td>
				<td>내용</td>
				<td>작성일</td>				
			</tr>
			<hr/>
      <c:if test="${list.size()!=0 }"> 
			<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.userid}</td>
				<td>${list.cocontent}</td>
				<td>${list.cowriteday}</td>
			</tr> 
			</c:forEach> 			
	</c:if>

				<c:if test="${list.size()==0 }">
		<table>
			<tr>
				<td>작성된 댓글이 없습니다.</td>
			</tr> 	
		</table>
		</c:if> 


