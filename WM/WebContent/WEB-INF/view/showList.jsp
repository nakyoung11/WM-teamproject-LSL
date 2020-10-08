<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 목록</title>
<style>
	#container {
		display: flex;
		width: 1000px;
		margin: 5px auto;
		justify-content: center;
		font-family: 'RIDIBatang';
		font-weight: 300;
	}
	#contents {
		position: relative;
		width: 900px;
		margin-top: 280px;
	}
	.poster {
		width: 200px;
		height: 200px;
		margin-left: 100px;
	}
	.showTitle {
		margin-left: 100px;
	}
	.pageCnt {
		margin-top: 10%;
		margin-left: 50%;
		margin-bottom: 10%;
	}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<div>
				<form action="/showlist">
				<select>
					<option>전시회</option>
				</select>
					<input type="search" name="searchText" value="${param.searchText}">
					<input type="submit" value="검색">			
				</form>
				<div class="listClass">
				<c:set var="i" value="0" /> 
				<c:set var="j" value="3" />
				<table>		  
					<c:forEach items="${list}" var="item">
						<c:if test="${i%j == 0 }">
						<tr>
						</c:if>
						<td class="posterName">
							<img src="/resource/show/images/posters/1/고전명화작품전 포스터.jpg" class="poster">
							<br>
							<div class="showTitle">전시회 : ${item.show_title}</div>
						</td>
						<c:if test="${i%j == j-1 }">
						  </tr>
						 </c:if>
						<c:set var="i" value="${i+1}" />
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
		<input type="hidden" name="page" value="${page}">
		
		
	</div>
	<div class="pageCnt">
		<c:forEach var="item" begin="1" end="${pagingCnt}" step="1">
		<c:if test="${page != item}"><span><a href="/showlist?page=${item}&searchText=${param.searchText}">${item}</a></span></c:if>
		<c:if test="${page == item}"><span style="color:red">${item}</span></c:if>
		</c:forEach>
	</div>
</body>
</html>