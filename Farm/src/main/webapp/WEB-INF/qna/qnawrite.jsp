<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<style>
table {
    margin: 30px;
    width : 80%;
}
</style>
</head>
<body>
<center>

<table width='95%' height='500' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>
	<tr> 
		<td align='center' valign='top'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0' >

			<form action='QNAWriteServlet'>
			<input type="hidden" name="state" value="처리중">
			<input type="hidden" name="userid" value="${sessionScope.login.userid}">
				<tr> 
					<td height='1' colspan='4' align='center' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td  height='20'  colspan='4'  bgcolor='#F0F0F0' align='center'  >글쓰기</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td width='15%' height='25'  bgcolor='#F0F0F0' align='right'  >작성자 : </td>
					<td height='25' colspan='3'>&nbsp;<input name='username' type='text' size='16' readonly="readonly" value='${sessionScope.login.username }'></td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
					<tr> 
					<td width='15%' height='25'  bgcolor='#F0F0F0' align='right'  >이메일 : </td>
					<td height='25' colspan='3'>&nbsp;<input name='email' type='email' size='16' value='${sessionScope.login.email}'></td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
					<tr> 
					<td width='15%' height='25'  bgcolor='#F0F0F0' align='right'  >전화번호 : </td>
					<td ><input name='phone1' type='text' size='16' value='${sessionScope.login.phone1}'>
					-<input name='phone2' type='text' size='16' value='${sessionScope.login.phone2}'>
					-<input name='phone3' type='text' size='16' value='${sessionScope.login.phone3}'></td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td height='25'  bgcolor='#F0F0F0'  align='right' class='b' >제 목 : </td>
					<td height='25' colspan='3'>
						&nbsp;<input name='title' type='text' size='50'>
					</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td height='25'   bgcolor='#F0F0F0' align='right'  >내 용 : <br>
	
					</td>
					<td height='25' colspan='3' valign='top'>
						&nbsp;<textarea name='content' cols='60' rows='20' wrap='VIRTUAL' ></textarea>
					</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>

				<tr align='center'> 
					<td height='25' colspan='4'><input type="submit" value="글쓰기"></td>
				</tr>
				<tr> 
					<td colspan='4'>&nbsp;</td>
							</form>
				</tr>

			</table>
			
		</td>
	</tr>
	<tr> 
		<td>&nbsp;</td>
	</tr>
</table>


</body>
</html>