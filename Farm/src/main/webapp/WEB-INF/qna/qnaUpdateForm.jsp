<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<form name='myForm' action="QNAUpdate">
	<input type='hidden' name='userid' value="${sessionScope.login.userid }"/>
		   <input type="hidden" name="qna_num" value="${qdto.qna_num }"/> 
			<input type='hidden' name='username' value="${qdto.username }"/>
		   <input type="hidden" name="state" value="${qdto.state }"/> 
		   <input type="hidden" name="writeday" value="${qdto.writeday }"/> 
<table width='95%' height='500' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>
	<tr> 
		<td align='center' valign='top'>
			<table width='100%' border='0' cellpadding='0' cellspacing='0' >
				<tr> 
					<td height='3' colspan='4' align='center' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td  height='25'  colspan='4'  bgcolor='#F0F0F0' align='center'  >글 수정하기</td>
				</tr>
				<tr> 
<tr> 
					<td height='25'  bgcolor='#F0F0F0'  align='right' class='b' >email : </td>
					<td height='10' colspan='3'>
						&nbsp;<input name='email'  type='text' size='50' value="${qdto.email }">
					</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td height='25'  bgcolor='#F0F0F0'  align='right' class='b' >phone : </td>
					<td>
						<input name='phone1'  type='text' value="${qdto.phone1 }">-<input name='phone2'  type='text' value="${qdto.phone2 }">-<input name='phone3'  type='text' value="${qdto.phone3 }">
					</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				<tr> 
					<td height='25'  bgcolor='#F0F0F0'  align='right' class='b' >제 목 : </td>
					<td height='25' colspan='3'>
						&nbsp;<input name='title'  type='text' size='50' value="${qdto.title }">
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
					<td height='25'   bgcolor='#F0F0F0' align='right'  >내 용 : <br>
	
					</td>
					<td height='25' colspan='3' valign='top'>
						&nbsp;<textarea name='content' cols='60' rows='50'>${qdto.content }</textarea>
					</td>
				</tr>
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>
				
				<tr> 
					<td height='1' colspan='4' bgcolor='#cecfce'></td>
				</tr>

				<tr align='center'> 
				
					<td height='25' colspan='4'><input type="submit" value="수정 완료">  
                    <input type=reset  value="다시 수정"> 
					<input type="button" value="목록" onclick="#"/></td>
					
				</tr>
				<tr> 
					<td colspan='4'>&nbsp;</td>				
				</tr>
			</table>		
		</td>
	</tr>
	<tr> 
		<td>&nbsp;</td>
	</tr>
</table>
	</form>
<script>
$(document).ready(function(){
    $("#").on("click",function(){
     document.myForm.action="QNAUpdate?qna_num=${qdto.qna_num}&userid=${sessionScope.login.userid}";
     document.myForm.submit();         
        }); 
}); 
</script>

