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

<c:forEach var="i" begin="1" end="${totalNum}">
	<c:choose>
		<c:when test="${curPage==i}">
		${i}&nbsp;
		</c:when>
		<c:otherwise>
		 	<a href="OrderListServlet?curPage=${i}&searchValue=${searchValue}&start_date=${start_date}&end_date=${end_date}">${i}</a>&nbsp;
		</c:otherwise>
	</c:choose>
</c:forEach>
<%-- <!-- <c:set var="curPage" value="${dto.curPage}">
	<c:set var="perPage" value="${OrderPageDTO.perPage}">
	<c:set var="totalCount" value="${dto.totalCount}">--> --%>
	<%-- 
	int totalNum = totalCount/perPage;
	if(totalCount%perPage!=0)totalNum++;
	int perBlock = pagedto.getPerBlock();

	String searchName = pagedto.getSearchName();
	String searchValue = pagedto.getSearchValue();
	
	 for(int i=1; i<=totalNum; i++){
		if(curPage == i){
			out.print(i+"&nbsp;");
		}else{
			out.print("<a href='MyBoardListServlet?curPage="+i+"&searchName="+searchName+"&searchValue="+searchValue+"'>"+i+"</a>&nbsp;");
		}
	} 
	 --%>