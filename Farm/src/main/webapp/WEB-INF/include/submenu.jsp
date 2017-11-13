<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	$(document).ready(function(){
	
		$('.dropdown-button').dropdown({
		      inDuration: 300,
		      outDuration: 225,
		      constrainWidth: false, // Does not change width of dropdown to that of the activator
		      hover: true, // Activate on hover
		      gutter: 0, // Spacing from edge
		      belowOrigin: true, // Displays dropdown below the button
		      alignment: 'left', // Displays dropdown with edge aligned to the left of button
		      stopPropagation: false // Stops event propagation
		    }
		  );
	});
</script>

 <div class="row" style="margin-top: 1%; margin: auto;">
    <div class="col s12">
    <ul  style="margin: auto;  padding-left: 300px;">
    	<li class="col s3"><a class=" dropdown-button" href="#!" data-activates="dropdown2" style="color: black;"><i class="material-icons">menu</i>메뉴전체보기</a>
 		<ul id="dropdown2" class="dropdown-content">
 			<c:if test="${!empty sessionScope.login}">
 			<li><a href="/app/main_mypage" style="color: #37474f;"><i class="material-icons">person</i>마이페이지</a></li>
 			<li class="divider"></li>
 			<li><a href="/app/main_mypage" style="color: #37474f;"><i class="material-icons">shopping_basket</i>장바구니</a></li>
 			<li class="divider"></li>
 			</c:if>
 			<li><a href="/app/goodsAllList" style="color: #37474f;"><i class="material-icons">view_module</i>쇼핑하기</a></li>
    		<li><a href="/app/goodsList?gcategory=rice" style="color: #37474f; text-align: center;">쌀/잡곡</a></li>
   		    <li><a href="/app/goodsList?gcategory=fruit" style="color: #37474f; text-align: center;">과일</a></li>
    	 	<li><a href="/app/goodsList?gcategory=meat" style="color: #37474f; text-align: center;">축산물</a></li>
    	 	<li><a href="/app/goodsList?gcategory=source" style="color: #37474f; text-align: center;">가공식품</a></li>
    	 	<li class="divider"></li>
  		</ul></li>
  		<li class="col s2"><a href="/app/goodsAllList" style="color: black;">쇼핑하기</a></li>
        <li class="col s2"><a href="" style="color: black;">베스트상품</a></li>
        <li class="col s2"><a href="boardForm" style="color: black;">자유게시판</a></li>
      </ul>
    </div>
</div> 