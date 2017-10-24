<%@page import="com.dto.OrderPageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="dto" value="${orderpageList}"/>
<c:set var="curPage" value="${dto.curPage}"/>
<c:set var="perPage" value="${OrderPageDTO.getPerPage()}"/>
<c:set var="totalCount" value="${dto.totalCount}"/>
<fmt:parseNumber var="totalNum" value="${totalCount/perPage}" integerOnly="true"></fmt:parseNumber>
<c:if test="${(totalCount%perPage)!=0}">
	<c:set var="totalNum" value="${totalNum+1}"></c:set>
</c:if>
<c:set var="searchValue" value="${dto.searchValue}"></c:set>
<c:set var="start_date" value="${dto.start_date}"></c:set>
<c:set var="end_date" value="${dto.end_date}"></c:set>
<c:set var="perBlock" value="${dto.perBlock}"></c:set>

<!-- 현재 페이지번호의 블럭번호 구하기 -->	
<fmt:parseNumber var="fmt" value="${Math.ceil(curPage/perBlock)}" integerOnly="true"></fmt:parseNumber>
<c:set var="curBlock" value="${fmt}"></c:set>
<fmt:parseNumber var="startPage" value="${(curBlock-1)*perBlock+1}"></fmt:parseNumber>
<fmt:parseNumber var="endPage" value="${startPage+perBlock-1}"></fmt:parseNumber>
<c:if test="${endPage>totalNum}">
	<c:set var="endPage" value="${totalNum}"></c:set>
</c:if>
<c:if test="${startPage <1 }">
	<c:set var="startPage" value="1" />
</c:if>
<%-- <fmt:parseNumber var="curBlock" integerOnly="true"
	value="${(curPage/perBlock)+1 }" /> 
<!-- 시작페이지번호 구하기  -->	
<fmt:parseNumber var="startPage" integerOnly="true"
	value="${(curBlock - 1)*dto.perBlock+1}" />
<!-- 마지막페이지번호 구하기 -->	
<fmt:parseNumber var="endPage" integerOnly="true"
	value="${(startPage +dto.perBlock)-1 }" />
<c:if test="${endPage > totalNum }">
	<c:set var="endPage" value="${totalNum}" />
</c:if>
<c:if test="${startPage <1 }">
	<c:set var="startPage" value="1" />
</c:if>--%>

<!--  첫 페이지로 바로 이동 -->
<c:if test="${curPage==1 }">
[처음]
</c:if>
<c:if test="${curPage!=1 }">
	<a href="orderList?curPage=1&searchValue=${searchValue}">[처음]</a>&nbsp;
</c:if>
&nbsp;

<!--  이전 페이지 블럭으로 이동 -->
<c:if test="${startPage==1 }">
&lt;&lt;
</c:if>
<c:if test="${startPage!=1 }">
	<a href="orderList?curPage=${(startPage-1)}&searchValue=${searchValue}">&lt;&lt;</a>&nbsp;
</c:if> 
&nbsp;

<!-- 이전 페이지로 이동 -->
<c:if test="${curPage==1 }">
&lt;
</c:if>
<c:if test="${curPage!=1 }">
	<a href="orderList?curPage=${(curPage-1)}&searchValue=${searchValue}">&lt;</a>&nbsp;
</c:if>
&nbsp;

<!-- 페이지번호들 -->
<c:forEach begin="${startPage}" end="${endPage}" var="i">
	<c:choose>
		<c:when test="${curPage==i}">
			${i}
		</c:when>
		<c:otherwise>
			<a href='orderList?curPage=${i}&searchValue=${searchValue}'>${i}</a>&nbsp;
		</c:otherwise>
	</c:choose>
</c:forEach>
&nbsp;

<!-- 다음 페이지로 이동 -->
<c:if test="${curPage==totalNum }">
&gt;
</c:if>
<c:if test="${curPage!=totalNum }">
	<a href="orderList?curPage=${(curPage+1)}&searchValue=${searchValue}">&gt;</a>&nbsp;
</c:if>
&nbsp;

<!-- 다음 페이지 블럭으로 이동   -->
<c:if test="${endPage==totalNum }">
&gt;&gt;
</c:if>
<c:if test="${endPage!=totalNum }">
	<a href="orderList?curPage=${endPage+1}&searchValue=${searchValue}">&gt;&gt;</a>&nbsp;
</c:if> 
&nbsp;

<!-- 마지막 페이지로 바로 이동 -->
<c:if test="${curPage==totalNum }">
[끝]
</c:if>
<c:if test="${curPage!=totalNum }">
	<a href="orderList?curPage=${totalNum}&searchValue=${searchValue}">[끝]</a>&nbsp;
</c:if>
&nbsp;

<%-- <c:forEach var="i" begin="1" end="${totalNum}">
	<c:choose>
		<c:when test="${curPage==i}">
		${i}&nbsp;
		</c:when>
		<c:otherwise>
		 	<a href="orderList?curPage=${i}&searchValue=${searchValue}&start_date=${start_date}&end_date=${end_date}">${i}</a>&nbsp;
		</c:otherwise>
	</c:choose>
</c:forEach> --%>
