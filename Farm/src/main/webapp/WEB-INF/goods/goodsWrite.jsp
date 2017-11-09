<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"> 
function gForm(){
	 location.href="/app/goodsAllList";
}  
/* function gWrite(f){
	 f.action ="/app/goodsWrite";
	 f.submit();
}  */
function gWrite(f) {
    if (document.myForm.gcategory.value == "" || document.myForm.gcategory.value == null) {
        alert("카테고리를 입력하세요.");
        document.myForm.gcategory.focus();
        return;
    } else if (document.myForm.gcode.value == "" || document.myForm.gcode.value == null) {
        alert("상품코드를 입력하세요.");
        document.myForm.gcode.focus();
        return;
    } else if (document.myForm.gname.value == "" || document.myForm.gname.value == null) {
        alert("상품이름을 입력하세요.");
        document.myForm.gname.focus();
        return;
    } else if (document.myForm.gprice.value == "" || document.myForm.gprice.value == null) {
        alert("상품가격을 입력하세요.");
        document.myForm.gprice.focus();
        return;
    } else if (document.myForm.gcontent.value == "" || document.myForm.gcontent.value == null) {
        alert("상품설명을 입력하세요.");
        document.myForm.gcontent.focus();
        return;
    } else {
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
</head>
<body>
  <center>
    <table summary="글쓰기 전체 테이블" >
        <form name="myForm" method="post" action="goodsWrite" enctype="multipart/form-data">
            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>
            <table summary="테이블 구성" style="width: 800px;">
              <br> <b><caption>상품 올리기</caption></b>
                <tr>
                    <td>카테고리</td>
                    <td> <select class="browser-default col s3" size="1" name="gcategory" >
								<option disabled selected>카테고리선택</option>
								<option value="rice">쌀/잡곡</option>
								<option value="fruit">과일/채소</option>
								<option value="meat">축산물</option>
								<option value="source">가공식품</option>
						  </select>
                  </td>
                </tr>
                <tr>
                    <td>상품코드</td>
                    <td><input type="text" name="gcode" 
						placeholder="영문과 숫자만 입력해주세요"></td>
                </tr>
                <tr>
                    <td>상품명</td>
                    <td><input type="text" name="gname"> </td>
                </tr>          
                    <tr>
                    <td>가격</td>
                    <td><input type="text" name="gprice"
                    placeholder="숫자만 입력해주세요"></td>
                </tr>
                <tr>
                <td>상품정보</td>
                <td><input type="text" name="gcontent"
                 placeholder="간략하게 한줄로 설명해주세요">        
             </td>
                </tr>
                 <tr>
						<td class="td_title">메인이미지</td>
						<td class="row">
					<div class="file-field input-field">
                    <div class="btn">
                    <span>File</span>
                    <input type="file" name="image" >
                    </div>
                    <div class="file-path-wrapper">
                    <input class="file-path validate" type="text" placeholder="Upload file">
                    </div>
                     </div>
						</td>
					</tr> 
 				<tr>
					<td >상세이미지</td>
						<td>
					<div class="file-field input-field">
                    <div class="btn">
                    <span>File</span>
                    <input type="file" name="image" >
                    </div>
                    <div class="file-path-wrapper">
                    <input class="file-path validate" type="text" placeholder="Upload file">
                    </div>
                     </div>
						</td>
					</tr>		 
                <tr>
                    <td colspan=2><hr size=1></td>
                </tr>
                <tr>
                    <td colspan="3"><div align="center">
                 <input type="button" value="등록" onclick="gWrite(myForm)" class="check" />
                 <input type="button" value="목록" onclick="gForm()" class="check"/>
                        </div>  </td>
                </tr>
            </table>
            </form>
    </table>
    </center>
    </body>
    
    </html>