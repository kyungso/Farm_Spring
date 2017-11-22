<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function closeMe(){
	
	window.opener = self;
    window.close();
	
}
</script>
<!-- 사업자번호 조회  -->
<script language="JavaScript">
function onopen()
{
var url =
"http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no="+frm1.bizNo.value;
window.open(url, "communicationViewPopup", "width=750, height=700;");
}
</script>

<img src="../images/reg.bmp"/><br>
<form name="frm1" >
*사업자번호를 쓰고 버튼을 클릭해주세요<span style="color:red;font-size:14px;">ex>2208183676</span><br>
<input name="bizNo" type="text" placeholder="사업자번호 입력.." required/>
<input type="button" value="조회" onclick="onopen();"/><br>
<br>
*문자가 전송될 전화번호를 적어주세요<br>
<input type="text" id="phone1" name="phone1" required maxlength="3">-
<input type="text" id="phone2" name="phone2" maxlength="4">-
<input type="text" id="phone3" name="phone3" maxlength="4"><br>
<input type="checkbox">회원정보와 같으면 체크!<br>

<input type="submit" value="신청하기" onclick="javascript:send()"/>
</form>
<script>
function send(){
	alert("신청 되었습니다.");
document.forms[0].action="../register";
window.close();
}


$(document).ready(function(){	

$("input:checkbox").click(function(){
	if($(this).prop('checked')){
	  $("#phone1").val('${sessionScope.login.phone1}');
	  $("#phone2").val('${sessionScope.login.phone2}');
	  $("#phone3").val('${sessionScope.login.phone3}');
	}else{
		  $("#phone1").val(' ');
		  $("#phone2").val(' ');
		  $("#phone3").val(' ');	
	}
});
});
</script>
