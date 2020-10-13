<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
 

<style>
#headerWrap{flex: 1}
body{padding-top: 250px;}

#container {
    display: flex;
    width: 1000px;
    margin-bottom: 292px;
    justify-content: center;
    align-content: center;
    font-family: 'RIDIBatang';
    font-weight: 300;
    flex: 1;
}

#contents {
	display: flex;
	flex-flow: column;
    flex: 1;
	height:100%;
}

.poster {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}


.poster img {
	margin: 10px auto;
	width: 900px;
	height: 1000px;
}

#people {
	position: absolute;
	top: 255px;
	left: 212px;
	font-size: 163px;
	color: rgba(243, 243, 238, 0.50);
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 500;
}

.sub_manu {
    display:flex;
    flex-flow: column;
	margin-top: 30px;
	width: 1200px;
	border-top: 1.5px solid rgba(55, 53, 53, 0.83);
	height: 300px;

}


.sub_manu ul {
	display: flex;
	width: 1200px;
 	justify-content: center;
	align-content: center;
	margin-top: 30px;
	margin-bottom: 5px;
}

 
.sub_manu ul li {
	margin: 15px 130px;
	color: rgba(71, 60, 21, 1);
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 700;
	font-size: 20px

}
 
.listClass{margin-left: 10%; display: flex; align-items: stretch;}
.smallPoster {
	width: 300px;
	height: 300px;
	margin-right:30px;
	border-radius: 20px;
	}
	.span {
	font-size: 18px;
	}
</style>

 

 

</head>

<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<div class="poster">
				<a href="/showlist"><img src="resource/main/images/poster.JPG"
					id="main"></a> <span id="people">${userCnt}명</span>
			</div>
 
			<div class="sub_manu">
				<ul>
					<li><a href="">인기작품보기</a></li>
					<li><a href="/exhibit_page0">전시회 열기</a></li>
					<li><a href="/exhibit_page2">나의 전시관리</a></li>
				</ul>
				<div class="listClass">
						<c:set var="i" value="0" /> 
						<c:set var="j" value="3" />
						<table>		  
						<c:forEach items="${list}" var="item">
								<c:if test="${i%j == 0 }">
								<tr>
								</c:if>
								<td class="posterName" onclick="moveDetail('${i}')" style="cursor: pointer;">
									<input type="hidden" value="${item.i_show}" id="idx_${i}">
									<img src="${posterPath}${item.i_user}/${item.show_poster}" class="smallPoster">
									<div class="showTitle"><p>${item.show_title}</p></div>
									<p><span class="material-icons">favorite</span>
									<span class="span">${item.likeCnt}</span>
									<span class="material-icons">comment</span>
									<span class="span">${item.cmtCnt}</span></p>
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
	</div>
				
<jsp:include page="../../footer.jsp"></jsp:include>
</body>

</html>