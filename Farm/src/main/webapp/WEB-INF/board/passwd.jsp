<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀글 비밀번호</title>
<script type="text/javascript">
   function passwdCheck(board_num) {
	   var keyword = document.myForm.passwd.value;
	   console.log(keyword);
	   var pswd= ${retrieve.passwd};
	   if(keyword==pswd){
		   location.href="/app/boardSecret?board_num="+board_num;
	   }else{
		   alert("비밀번호 불일치");
	   }
 }  
</script>
<style>
.check {
    background-color: #008CBA;
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
</head>
<body>
	<div align="center">
   <form name="myForm" >
            <center>
         <table border="1" cellspacing="1" style="width: 300px;">
            <thead>
            <tr>
           <th  class="brand-logo center" style="size: 20px;">
            <i class="small material-icons" >network_locked</i>           
           등록한 비밀번호를 입력하세요.</th>
            </tr>
            </thead>
            <tbody>
            <tr>
               <td colspan="1">
                     <input type="text" id="passwd" name="passwd" />
               </td>
            </tr>
            </tbody>
         </table>
            <input type="button"  value="비밀번호확인"  class="check" onclick="passwdCheck('${retrieve.board_num}')"/> 
            <input type="reset"  value="다시쓰기" class="check"/>
            <input type="button" value="목록" onclick="history.back();"  class="check" />               
            </center>
   </form>
   </div>

</body>
</html>