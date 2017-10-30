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
 function bUpdate(f){
	 f.action ="/app/boardUpdateWrite";
	 f.submit();
} 
function bForm(){
	 location.href="/app/boardForm";
}
      function bUpdate(f) {
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
            document.myForm.submit();
            }
        }   
</script>
<style>

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
   <table summary="글수정하기 전체 테이블" >
        <form name="myForm" method="post" action="boardUpdateWrite" enctype="multipart/form-data">
			 <input type='hidden' name='userid' value="${dto.userid}"/>
		   <input type="hidden" name="board_num" value="${dto.board_num}" id="board_num"/>  
            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>
             <table summary="테이블 구성" style="width: 800px;">
                <caption>게시글 수정하기</caption>
				 <tr>
                    <td>작성자</td>
                    <td><input type="text" name="author"   value="${dto.author }">
                  </td>
                </tr>
                 <tr>
                    <td>제 목</td>
                    <td><input type="text" name="title"  value="${dto.title }"></td>
                </tr>
                 <tr>
                    <td>내 용</td>
                    <td>
               <div class="row">
          <div class="input-field col s12">
            <textarea id="textarea1" class="materialize-textarea" data-length="500"
            name="content" value="${dto.content }">${dto.content }</textarea>
            <label for="textarea1"></label>
          </div>
          </div>
                   </td>
                </tr>                    
                    <tr>
                    <td>이미지</td>
                    <td>
                     <div class="file-field input-field">
                   <div class="btn">
                   <span>File</span>
                <input type="file" name="image" multiple>
              </div>
                <div class="file-path-wrapper">
               <input class="file-path validate" type="text" placeholder="Upload file">
                 </div>
                 </div>    
                    </td>
                </tr>
		          <tr>
                <td>비밀번호 </td>
                <td>
                 <center>
                <input type="checkbox" id="test5"  name="secret"  value="Y"/>
                <label for="test5">비밀글설정시에만 입력해주세요</label>
                <center> 
                <input type="text" name="passwd" >
             </td>
                </tr>		
                <tr>
                    <td colspan=2><hr size=1></td>
                </tr>
				<tr>
				<td colspan="3"><div align="center">
                      <input type="button" value="수정" onclick="bUpdate(myForm)" class="check" />
                    <input type=reset  value="다시 수정" class="check"> 
                    <input type="button" value="목록" onclick="bForm()"  class="check"/>
				</div></td>					
				</tr>
			</table>
			</form>
</table>
</body>
</html>

