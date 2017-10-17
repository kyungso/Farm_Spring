<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정하기</title>
</head>
<script>

/* $(document).ready(function(){
    $("#listUpdate").click(function(){
        var title = $("#title").val();
        var content = $("#content").val();
        var author = $("#author").val();
        if(title == ""){
            alert("제목을 입력하세요");
            document.form.title.focus();
            return;
        }
        if(content == ""){
            alert("내용을 입력하세요");
            document.form.content.focus();
            return;
        }
        if(author == ""){
            alert("이름을 입력하세요");
            document.form.author.focus();
            return;
        } 
        document.form.action="${path}/Farm/FreeBoardUpdateServlet"
        // 폼에 입력한 데이터를 서버로 전송
        document.form.submit();
        
    });
});
 */
 function allList(){
	location.href="FreeBoardListServlet";
}
 
    function check() {
        if (document.myForm.author.value == "" || document.myForm.author.value == null) {
            alert("작성자이름을 입력하세요.");
            document.myForm.author.focus();
            return;
        }
        else if(document.myForm.title.value == "" || document.myForm.title.value == null) {
            alert("제목을 입력하세요.");
            document.myForm.title.focus();
            return;
        }
        else if(document.myForm.content.value == "" || document.myForm.content.value == null) {
            alert("내용을 입력하세요.");
            document.myForm.content.focus();
            return;
        } else{
        	document.myForm.action="FreeBoardUpdateWriteServlet";
            document.myForm.submit();
            }
        } 
/*    $(document).ready(function(){
    $("#listUpdate").click(function(){
             document.myForm.action="FreeBoardUpdateWriteServlet?board_num=${dto.board_num }";
             document.myForm.submit();         
        }); 
     */
</script>
<style>
table {
	margin: 15px;
	width: 90%;
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
</style>
<body>

<center>

<table bgcolor='#FFFFFF' style="width: 1000px;">
	<tr> 
		<td align='center' valign='top'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0' >

			<form name='myForm' method='post'  >
			<input type='hidden' name='userid' value="${dto.userid }"/>
		   <input type="hidden" name="board_num" value="${dto.board_num }" id="board_num"/> 

				<tr> 
					<td height='3' colspan='4' align='center' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td  height='25'  colspan='4'  bgcolor='#F0F0F0' align='center'  >글 수정하기</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td width='15%' height='25'  bgcolor='#F0F0F0' align='right'  > 작성자 </td>
					<td height='25' colspan='3'>&nbsp;<input name=author type='text' size='16' value="${dto.author }"></td>
				</tr>
				<tr> 

				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td height='25'  bgcolor='#F0F0F0'  align='right' class='b' > 제 목 </td>
					<td height='25' colspan='3'>
						&nbsp;<input name=title  type='text' size='50' value="${dto.title }">
					</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td align='center'   bgcolor='#F0F0F0' colspan=4>
						
					</td>
                                </tr>
				<tr> 
					<td height='25'   bgcolor='#F0F0F0' align='right'  > 내 용 <br>
	
					</td>
					<td height='25' colspan='3' valign='top'>
						&nbsp;<textarea name=content  type='text' cols='60' rows='20'  value="${dto.content }">${dto.content }</textarea>
					</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td height='25'  bgcolor='#F0F0F0' align='right' > 이미지 </td>
					<td height='25' colspan='3'>
						&nbsp;<input type=file name='userfile'  size='40'  >
					</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>

				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>

				<tr align='center'> 
				
					<td height='25' colspan='4'><input type="button" value="수정 완료" onclick="check()" id="listUpdate" class="check">  
                    <input type=reset  value="다시 수정" class="check"> 
					<input type="button" value="목록" onclick="allList()" class="check"/></td>
					
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

