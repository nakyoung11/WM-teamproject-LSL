<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
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
	body {
            display: flex;
            flex-flow: column;
            justify-content: center;
            position: relative;
            align-items: center;
            padding-top: 220px;
            font-family: 'NanumBarunGothic';
            background: #FCFBF7;
        }
        th,td {
            border-bottom: 1px solid black;
        }

        table {
            border-top: 2px solid black;
            border-collapse: collapse;
            text-align: center;
        }
        th {
            border-right: 1px solid black;
        }
        th,td {
            padding: 20px;
        }
        .title {
            width: 50px;
        }
        .ctnt {
            width: 700px;
        }
        .listBtn {
            border-style: none;
            margin-top: 10px;
            padding: 5px;
            background-color: #927E9C;
            border-radius: 10%;
        }
</style>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<table>
				<tr>
					<th class="title">제목</th>
					<td class="ctnt">${list.title}</td>
				</tr>
				<tr>
					<th class="title">내용</th>
					<td class="ctnt">${list.ctnt}</td>
				</tr>
            </table>
            <button class="listBtn" onclick="moveToList()">목록</button>
            <c:if test="${i_user == 1}">
            	<a href="/notice/regmod?i_notice=${list.i_notice}">수정</a>
            </c:if>
		</div>
	</div>
	 <jsp:include page="../../footer.jsp"></jsp:include>
	<script>
		function moveToList() {
			location.href = "/notice"
		}
	</script>
</body>
</html>