<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			</div>
		</div>
	</div>
		
</body>
</html>