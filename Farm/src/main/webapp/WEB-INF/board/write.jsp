<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>

 
<script type="text/javascript">
 
/* function bWrite(){
	 location.href="/app/boardWrite";
	 f.submit();
} */

function bForm(){
	 location.href="/app/boardForm";
	 f.submit();
}
  
/*  function check() {
    if (document.post.author.value == "" || document.post.author.value == null) {
        alert("작성자이름을 입력하세요.");
        document.post.author.focus();
        return;
    } else if (document.post.title.value == "" || document.post.title.value == null) {
        alert("제목을 입력하세요.");
        document.post.title.focus();
        return;
    } else if (document.post.content.value == "" || document.post.content.value == null) {
        alert("내용을 입력하세요.");
        document.post.content.focus();
        return;
    }   else if (document.post.image.value == "" || document.post.image.value == null) {
        alert("이미지를 첨부하세요.");
        document.post.image.focus();
        return;
    }  else {
        document.post.submit();
    }
}  */
 
 
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

.xx{
  color:red;
}
</style>
</head>
 
<body>
  <center>
    <table summary="글쓰기 전체 테이블" >
        <form:form name="post" method="post" action="boardWrite" 
        modelAttribute="xxx" enctype="multipart/form-data">
 			<input type="hidden" name="userid" value="${dto.userid }"/>			
            <input type="hidden" name="board_num" value="${dto.board_num }"/> 
            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>
 

            <table summary="테이블 구성" style="width: 800px;">
                <caption>게시판 글쓰기</caption>
                <tr>
                    <td>작성자</td>
                    <td><input type=text name=author size=10 maxlength=8>
                    <form:errors cssClass="xx" path="author" /></td>
                </tr>
                <tr>
                    <td>제 목</td>
                    <td><input type=text name=title>
                     <form:errors cssClass="xx" path="title" /></td>
                </tr>
                <tr>
                    <td>내 용</td>
                    <td><textarea name=content rows="30" cols="100"></textarea>
                     <form:errors cssClass="xx" path="content" /></td>
                </tr>
                    <tr>
                    <td>이미지</td>
                    <td><center><input type=file name=image size='40'  ></center>
                    <form:errors cssClass="xx" path="image" />
                    </td>
                </tr>
                
                
                
                <tr>
                    <td colspan=2><hr size=1></td>
                </tr>
                <tr>
                    <td colspan="3"><div align="center">
                 <input type="submit" value="등록"  />
                 <input type="button" value="목록" onclick="bForm()" />
                 <!--    <a href="boardWrite">등록</a> &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="boardForm">목록</a> &nbsp;&nbsp;&nbsp;&nbsp; -->
                        </div>  </td>
                </tr>
            </table>
        </form:form>
    </table>
    </center>
 
</body>
</html>

