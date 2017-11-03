<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


 <c:if test="${!empty qnaUpdate}">
<script>
alert('${qnaUpdate}');
</script>
</c:if>

  <style>
table {
    margin: 50px;
    width : 80%;
}
</style>
<form name="myForm" action="QNAUpdateForm" >

			<table width='100%' height='200' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>
				<tr> 
					<td align='center' valign='top'>
						<table width='100%' border='0' cellpadding='5' cellspacing='0' class='b'>
							<tr align='center'> 
								<td height='3' colspan='4' align='center' bgcolor='#cecfce'> </td>
							</tr>
							<tr><td><input type="hidden" name="qna_num" value="${qnaRetrieve.qna_num }"/>
<input type="hidden" name="userid" value="${qnaRetrieve.userid}"/></td></tr>
							<tr > 
							
								<td  width='50' height='25' align='center' bgcolor='#F0F0F0'><b>제목</b> </td>
								<td height='25' colspan='3'>
									<table width='100%' border='0' cellspacing='0' cellpadding='0' class='b'>
										<tr> 
											<td height='25'><input type="text" value='${qnaRetrieve.title }' name="title" readonly="readonly"></td>
											
											<td width='70' align='center' bgcolor='#F0F0F0'  ><b>상태</b></td>
								<td width='150' ><input type="text" value='${qnaRetrieve.state }' name="state" readonly="readonly"> </td>
																			</tr>
									</table>
								</td>
							</tr>
							<tr align='center' bgcolor='#cecfce'> 
								<td height='1' colspan='4' align='center'></td>
							</tr>
							<tr > 
								<td width='50' height='29' align='center' bgcolor='#F0F0F0' ><b>작성자</b></td>
								<td width='150' ><input style="text" name="username" value="${qnaRetrieve.username }" readonly="readonly"></td>
								<td width='50' align='center' bgcolor='#F0F0F0' ><b>등록일</b></td>
								<td width='150' ><input readonly value="${qnaRetrieve.writeday }" name="writeday"></td>	
								<c:set var="writeday" value="${qnaRetrieve.writeday}" scope="session"/>
							</tr>
								<tr align='center' bgcolor='#cecfce'> 
								<td height='1' colspan='4' align='center'></td>
							</tr>
							<tr>
								<td width='50' height='29' align='center' bgcolor='#F0F0F0' ><b>전화번호</b></td>
								<td width='150' ><input type="text" name="phone1" value="${qnaRetrieve.phone1}" readonly="readonly">-
								<input type="text" name="phone2" value="${qnaRetrieve.phone2}" readonly="readonly">-
								<input type="text" name="phone3" value="${qnaRetrieve.phone3}" readonly="readonly"></td>
								<td width='50' align='center' bgcolor='#F0F0F0' ><b>이메일</b></td>
								<td width='150' ><input type="text" name="email" readonly="readonly" value="${qnaRetrieve.email }"></td>	
							</tr>
							<tr align='center' bgcolor='#cecfce'> 
								<td height='1' colspan='4' align='center'></td>
							</tr>
							<tr align='center' valign='top'> 
								<td colspan='4' align='center'> 
								<div align='justify' class='text3'>
					    <textarea rows="50" cols="50" name="content" readonly="readonly"> ${qnaRetrieve.content }</textarea>
								</div>
								</td>
							</tr>
							<tr align='center' bgcolor='#cecfce'> 
								<td height='3' colspan='4' align='center'></td>
							</tr>
						
							<tr align='center'> 
								<td colspan='4' align='center'>&nbsp;</td>
							</tr>
							<tr>
							<c:if test="${qnaRetrieve.userid==sessionScope.login.userid}">
								<td><input type="submit" id="qnaUpdate" value="수정" /></td>
								<td><input type="button" id="qnaDelete" value="삭제"></td>
								</c:if>
								<td><input type="button" id="qnaReply" value="댓글"></td>
							</tr>
							</table>
							</td>
							</tr>
							</table>
							</form>
						
<script>
$(document).ready(function(){
		
	$("#qnaDelete").on("click",function(){
		
        document.myForm.action="QNADelete";
        document.myForm.submit();  
		});
	
	
	$("#qnaReply").on("click",function(){
		
        document.myForm.action="QNAReplyForm";
        document.myForm.submit();    
		
	});
});

</script>
