<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<<<<<<< HEAD
<script>
$(function(){
  $(".zeta-menu li").hover(function(){
    $('ul:first',this).show();
  }, function(){
    $('ul:first',this).hide();
  });

});
</script>

<style>

.zeta-menu li {
  float: left;
  list-style:none;
}

.zeta-menu a {
  color: black;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
} 

.zeta-menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  left: 0;
  top: 100%;
  width: 180px;
}
span:hover { color: hotpink;}
.zeta-menu ul li { float: none; }
.zeta-menu ul li:hover { background: #ddd; }
.zeta-menu ul li:hover a { color: hotpink; }

</style>

 <!-- <ul id="slide-out" class="side-nav">
  	<li>
  		<div class="user-view">
			<i class="medium material-icons">face</i>
			<a href="#!name">John Doe</a> 
			<a href="#!email">jdandturk@gmail.com</a>
		</div>
	</li>
    <li><a href="#!">쌀/잡곡</a></li>
    <li><a href="#!">과일</a></li>
    <li><a href="#!">축산물</a></li>
    <li><a href="#!">가공식품</a></li>
    <li><div class="divider"></div></li>
    <li><a href="#!">장바구니</a></li>
    <li><a href="#!">주문내역</a></li>
    <li><a href="#!">회원정보</a></li>
  </ul>
   -->
=======
>>>>>>> branch 'master' of https://github.com/kyungso/Farm_Spring.git
<div class="row" style="margin-top: 1%; margin: auto; ">
    <div class="col s12" >
<<<<<<< HEAD
      <ul class="zeta-menu" style="margin: auto; vertical-align: center; padding-left: 250px;">
=======
      <ul>
>>>>>>> branch 'master' of https://github.com/kyungso/Farm_Spring.git
        <li class="col s3">
        	<a class=" dropdown-button" href="#!" data-activates="dropdown2" style="color: black;"><i class="material-icons">menu</i>메뉴전체보기</a>
        	<ul id="dropdown2" class="dropdown-content">
		       <li><a href="/app/goodsList?gCategory=rice">쌀/잡곡</a></li>
		       <li><a href="/app/goodsList?gCategory=fruit">과일</a></li>
		       <li><a href="/app/goodsList?gCategory=meat">축산물</a></li>
		       <li><a href="/app/goodsList?gCategory=source">가공식품</a></li>
		    </ul>
        </li> 
        <li class="col s2"><a href="/app/goodsAllList" style="color: black;">쇼핑하기</a></li>
        <li class="col s2"><a href="" style="color: black;">베스트상품</a></li>
        <li class="col s2"><a href="boardForm" style="color: black;">자유게시판</a></li>
      </ul>
    </div>
</div>

</html>