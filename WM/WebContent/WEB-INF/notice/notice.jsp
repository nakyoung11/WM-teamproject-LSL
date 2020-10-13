<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<style>
#headerWrap {
	flex: 1
}

body {
	padding-top: 250px;
}

#container {
	display: flex;
	width: 1000px;
	margin-bottom: 600px;
	justify-content: center;
	align-content: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	flex: 1;
	background-image:
}

#contents {
	display: flex;
	flex-flow: column;
	flex: 1;
	height: 100%;
}
/*----------------------- 추가 사항 ----------------- */
th, td {
	border-bottom: 1px solid black;
}

table {
	align-self:center;
	border-top: 2px solid black;
	border-collapse: collapse;
	text-align: center;
	width: 80%;
}

th, td {
	padding:10px;
}

.imporTitle {
	font-weight: 900;
}

.imporMark {
	display: inline-block;
	width: 20px;
	height: 20px;
	background-color: red;
	color: white;
	margin-right: 10px;
	border-radius: 50%;
}

.i_notice {
	width: 50px;
}

.title {
	width: 500px;
	cursor: pointer;
}

.hoverColor:hover {
	background-color: #dfe6e9;
}

.nm {
	width: 50px;
}

.imporNm {
	font-weight: 900;
	color: tomato;
}
}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<table>
				<tr>
					<th class="i_notice">번호</th>
					<th class="title">제목</th>
					<th class="nm">작성자</th>
					<th class="r_dt">등록시간</th>
				</tr>
				<c:if test="${i_user == 1}">
					<button onclick="moveToReg()">글쓰기</button>
				</c:if>
				<c:forEach items="${list}" var="item">
					<tr class="hoverColor">
						<input type="hidden" name="${item.i_notice}">
						<td class="i_notice">${item.i_notice}</td>
						<td class="imporTitle title"
							onclick="moveToDetail(${item.i_notice})"><div
								class="imporMark">!</div>${item.title}</td>
						<td class="nm imporNm">${item.nm}</td>
						<td class="r_dt">${item.m_dt}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>

	<script>
		function moveToReg() {
			location.href="/notice/regmod"	
		}
		
		function moveToDetail(i_notice) {
			location.href="/notice/detail?i_notice="+i_notice
		}
	</script>
</body>
</html>