<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div>
현재 ${sessionScope.login.username} 님의 포인트는  ${sessionScope.login.point} 점 입니다.
</div>
<table>
<tr><td>최근 주문내역</td></tr>
<tr><td></td></tr>
</table>