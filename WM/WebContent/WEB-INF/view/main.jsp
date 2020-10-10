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



</style>


</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<div class="poster">
				<a href="/showlist"><img src="resource/main/images/poster.JPG"
					id="main"></a> <span id="people">000명</span>
			</div>

			<div class="sub_manu">
				<ul>
					<li><a href="">인기전시보기</a></li>
					<li><a href="/exhibit_page1">전시회 열기</a></li>
					<li><a href="/exhibit_page2">나의 전시관리</a></li>
				</ul>

			</div>

		</div>

	</div>
	<footer id="footer">
		<ul>
			<li>jumoney15@naver.com: 아이디어 제공, 3D</li>
			<li>dlehdud1653@kakao.com: 로그인 및 게시판</li>
			<li>nakihome@naver.com: 디자인</li>
		</ul>

	</footer>

</body>
</html>