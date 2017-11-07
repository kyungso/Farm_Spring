<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



 <div class="row" style="margin-top: 1%; margin: auto;">
    <div class="col s12">
    <ul>
    	<li class="col s3"><a class=" dropdown-button" href="#!" data-activates="dropdown2" style="color: black;"><i class="material-icons">menu</i>메뉴전체보기</a>
 		<ul id="dropdown2" class="dropdown-content">
    		<li><a href="/app/goodsList?gCategory=rice">쌀/잡곡</a></li>
   		    <li><a href="/app/goodsList?gCategory=fruit">과일</a></li>
    	 	<li><a href="/app/goodsList?gCategory=meat">축산물</a></li>
    	 	<li><a href="/app/goodsList?gCategory=source">가공식품</a></li>
  		</ul></li>
  		<li class="col s2"><a href="/app/goodsAllList" style="color: black;">쇼핑하기</a></li>
        <li class="col s2"><a href="" style="color: black;">베스트상품</a></li>
        <li class="col s2"><a href="boardForm" style="color: black;">자유게시판</a></li>
      </ul>
    </div>
</div> 