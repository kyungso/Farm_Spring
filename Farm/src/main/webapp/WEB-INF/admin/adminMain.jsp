<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row" style="margin-top: 2%">
<div class="col s3 offset-s2" align="center" style="border-style: ridge; margin-right: 4%">
<a href="admin_Member">
<br>
<h5>회원수</h5>
<b>${memberCount} 명</b>
<br>
<br>
</a>
</div>
<div class="col s3 " align="center" style="border-style: ridge;">
<a href="admin_Order">
<br>
<h5>오늘 주문 내역</h5>
<b>${orderCount} 건</b>
<br>
<br>
</a>
</div>
</div>