<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<style>
	th,td {
            border-bottom: 1px solid black;
        }

        table {
            border-top: 2px solid black;
            border-collapse: collapse;
            text-align: center;
        }
        th,td {
            padding: 20px;
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
            width: 30px;
        }
        .title {
            width: 500px;
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
					<tr>
						<input type="hidden" name="${item.i_notice}"> 
						<td class="i_notice">${item.i_notice}</td>
						<td class="imporTitle title" onclick="moveToDetail(${item.i_notice})"><div class="imporMark">!</div>${item.title}</td>
						<td class="nm imporNm">${item.nm}</td>
						<td class="r_dt">${item.r_dt}</td>
					</tr>
				</c:forEach>			
			</table>
		</div>
	</div>
	
	<script>
		function moveToReg() {
			location.href="/notice/reg"	
		}
		
		function moveToDetail(i_notice) {
			location.href="/notice/detail?i_notice="+i_notice
		}
	</script>
</body>
</html>