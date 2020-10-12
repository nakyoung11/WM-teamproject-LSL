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
 	margin-bottom:400px;
    justify-content: center;
    align-content: center;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300; 
    flex: 1;
}
	

#contents {
	display: flex;
	flex-flow: column;

	height:100%;

}

select, input{border: none; background: none;cursor: pointer;}
.posterName{position: relative;}
.poster {
	width: 300px;
	height: 300px;
	margin-right:30px;
	border-radius: 20px;
	}
	
.showTitle{position: absolute; top:0; left:0;width: 301px;
	height: 301px;
	margin-right:30px;
	border-radius: 20px;text-align: center;
	background: #484661;
	opacity: 0; 
	transition: all ease 0.7s}
	
.showTitle>p{margin-top:120px; padding: 10px}

.showTitle:hover{opacity: 0.9; color:white;}
.selectbox{margin: 40px 0 30px 0; align-self: center; display: flex; align-items: center; width: 75%}
#search_input{width: 900px; padding: 5px; border-bottom: 1px solid gray;}	
.listClass{margin: 0; display: flex; align-items: stretch;}
.pageCnt {
		margin-top: 10%;
		margin-left: 50%;
		margin-bottom: 10%;
	}
</style>
</head>
<body style="padding-top: 197px;">
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
	
				<form action="/showlist" class="selectbox">
				<select>
					<option>전시회</option>
				</select>
					<input type="search" name="searchText" value="${param.searchText}" id="search_input">
					<input type="submit" class="material-icons" value="search">	

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
							<img src="${posterPath}${item.i_user}/${item.show_poster}" class="poster">
							<div class="showTitle"><p>${item.show_title}</p></div>
						</td>
						<c:if test="${i%j == j-1 }">
						  </tr>
						 </c:if>
						<c:set var="i" value="${i+1}" />
			</c:forEach> 
					
	
				</table>
				</div>
			<div class="pageCnt">
		<c:forEach var="item" begin="1" end="${pagingCnt}" step="1">
		<c:if test="${page != item}"><span><a href="/showlist?page=${item}&searchText=${param.searchText}">${item}</a></span></c:if>
		<c:if test="${page == item}"><span style="color:red">${item}</span></c:if>
		</c:forEach>
	</div>
		</div>
		<input type="hidden" name="page" value="${page}">
		
		
	</div>

</body>
</html>