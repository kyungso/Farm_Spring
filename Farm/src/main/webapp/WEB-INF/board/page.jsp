<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="xxx" value="${list }" />
<c:set var="curPage" value="${xxx.curPage }" />
<c:set var="perPage" value="${perPage }" />
<c:set var="totalCount" value="${xxx.getTotalCount()}" />
<fmt:parseNumber var="totalNum" integerOnly="true"
	value="${totalCount/perPage }" />
<c:if test="${totalCount%perPage!=0 }">
	<c:set var="totalNum" value="${totalNum+1}" />
</c:if>
<c:set var="searchName" value="${xxx.searchName }" />
<c:set var="searchValue" value="${xxx.searchValue }" />
<c:set var="perBlock" value="${xxx.perBlock }" />


<!-- 현재 페이지번호의 블럭번호 구하기 -->	
<fmt:parseNumber var="curBlock" integerOnly="true"
	value="${(curPage/perBlock)+1 }" />
<!-- 시작페이지번호 구하기  -->	
<fmt:parseNumber var="startPage" integerOnly="true"
	value="${(curBlock - 1)*xxx.perBlock+1}" />
<!-- 마지막페이지번호 구하기 -->	
<fmt:parseNumber var="endPage" integerOnly="true"
	value="${(startPage +xxx.perBlock)-1 }" />
<c:if test="${endPage > totalNum }">
	<c:set var="endPage" value="${totalNum}" />
</c:if>
<c:if test="${startPage <1 }">
	<c:set var="startPage" value="1" />
</c:if>

<!--  첫 페이지로 바로 이동 -->
<c:if test="${curPage==1 }">
[처음]
</c:if>
<c:if test="${curPage!=1 }">
	<a href="FreeBoardListServlet?curPage=1&searchName=searchName &searchValue= searchValue">[처음]</a>
</c:if>

<%-- <!--  이전 페이지 블럭으로 이동 -->
<c:if test="${startPage==1 }">
&lt;&lt;
</c:if>
<c:if test="${startPage!=1 }">
	<a href="FreeBoardListServlet?curPage=${(startPage-1)}&searchName=searchName &searchValue=searchValue">&lt;&lt;</a>
</c:if> --%>

<!-- 이전 페이지로 이동 -->
<c:if test="${curPage==1 }">
[이전]
</c:if>
<c:if test="${curPage!=1 }">
	<a href="FreeBoardListServlet?curPage=${(curPage-1)}&searchName=searchName &searchValue=searchValue">[이전]</a>
</c:if>

<!-- 페이지번호들 -->
<c:forEach begin="${startPage }" end="${endPage}" varStatus="status">
<c:if test="${curPage==status.index}">
${status.index }
</c:if>
<c:if test="${curPage!=status.index }">
		<a href='FreeBoardListServlet?curPage=${status.index}&searchName=searchName &searchValue=searchValue'>${status.index }</a>
</c:if>
</c:forEach>

<%-- <c:if test="${curPage==endPage }">
${endPage }
</c:if>
<c:if test="${curPage!=endPage }">
	<a href="FreeBoardListServlet?curPage=${endPage}&searchName=searchName &searchValue=searchValue">${endPage }</a>
</c:if> --%>

<!-- 다음 페이지로 이동 -->
<c:if test="${curPage==totalNum }">
[다음]
</c:if>
<c:if test="${curPage!=totalNum }">
	<a href="FreeBoardListServlet?curPage=${(curPage+1)}&searchName=searchName &searchValue=searchValue">[다음]</a>
</c:if>

<%-- <!-- 다음 페이지 블럭으로 이동   -->
<c:if test="${endPage==totalNum }">
&gt;&gt;
</c:if>
<c:if test="${endPage!=totalNum }">
	<a href="FreeBoardListServlet?curPage=${(endPage+1)}&searchName=searchName &searchValue=searchValue">&gt;&gt;</a>
</c:if> --%>

<!-- 마지막 페이지로 바로 이동 -->
<c:if test="${curPage==totalNum }">
[끝]
</c:if>
<c:if test="${curPage!=totalNum }">
	<a href="FreeBoardListServlet?curPage=${totalNum}&searchName=searchName &searchValue=searchValue">[끝]</a>
</c:if>
