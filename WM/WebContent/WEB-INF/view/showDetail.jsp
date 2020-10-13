<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세페이지</title>
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
	margin-bottom: 250px;
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
.main {
	display: flex;
	justify-content: center;
	align-items: center;
}

.main .poster> #3d {
	width: 450px;
	height: 450px;
	background: #8E9C9E;
	position: absolute;
	top: 0;
	left: 0;
	margin-right: 30px;
	border-radius: 20px;
	text-align: center;
	opacity: 1;
	transition: all ease 0.7s;
}

.poster {
	flex-direction: column;
	margin-left: 50px;
	position: relative;
}

.poster #poster {
	width: 450px;
	height: 450px;
	margin-bottom: 30px;
	border-radius: 20px;
	cursor: pointer;
}

.main #title {
	display: block;
}

.main h3 {
	display: block;
}

.introduction {
	flex-direction: column;
	margin-left: 50px;
	width: 430px;
}

.exhibition {
	display: flex;
	width: 1150px;
	flex-direction: column;
	margin-left: 140px;
}

.exhibition ul {
	display: flex;
	flex-wrap: wrap;
	list-style: none;
}

.exhibition ul li {
	flex: 1 1 30%;
	margin-bottom: 1em;
}

.introduction .profile_img {
	width: 250px;
	height: 250px;
	border-radius: 50%;
	margin-bottom: 10px;
}
</style>
</head>
<body style="padding-top: 230px;">
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">

			<div class="main">
				<div class="poster">
					<h2 id="title">${showData.show_title}</h2>
					<img src="${posterPath}${showData.show_poster}" id="poster" onclick="move3dGallay(${showData.i_show})">
					<div id="3d">
						<p>3D전시회관람</p>
					</div>
				</div>


				<div class="introduction">
					<h3>작가: ${userData.nickname}</h3>
					<img id="profile_img" src="${profilePath}${userData.profile_img}">

					<div id="introduction">
						<p>
							전시회 설명: <br>${showData.show_ctnt}
						</p>
					</div>
				</div>
			</div>

			<div class="exhibition">
				<h3>작품목록</h3>
				<div id="exhibition_items">
					<ul>
						<c:set var="i" value="1" />
						<c:forEach items="${workList}" var="item">
							<li>${i}.${item.work_title}</li>
							<c:set var="i" value="${i+1}" />
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>

	<script type="text/javascript">
   	function move3dGallay(i_show) {
   		//모니터의 크기를 구한다.
   		var screenWidth = screen.availWidth*4/5;
   		var screenHeight = screen.availHeight*7/10;
   		var left = screenWidth*1/10
   		var top = screenHeight*3/20
   		//location.href = "/gallay/gallay3d?i_show=" + i_show;
   		window.open(`/gallay/gallay3d?i_show=\${i_show}`,'3D전시관' ,`height=\${screenHeight}, width=\${screenWidth}, top=\${top}, left=\${left}, scrollbars=no, resizable=no, toolbars=no, menubar=no`)
   	}
   </script>
</body>
</html>