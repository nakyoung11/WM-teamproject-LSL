<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WM 웹 전시관</title>
<style>
body {
	background: #F9F9F9
}

#container {
	position: relative;
	width: 1382px;
	height: 1356px;
	left: calc(50% - 1382px/ 2);
	top: calc(50% - 1356px/ 2 + 42px);
}

#header {
	position: fixed;
	width: 1440px;
	height: 215px;
	left: calc(50% - 1440px/ 2);
	top: 0px;
	background: #F9F9F9;
	z-index: 9999;
}

#contents {
	position: absolute;
	width: 907px;
	height: 620px;
	right: 99px;
	top: calc(53% - 633px/ 2 + 41px);
}

#footer {
	position: absolute;
	width: 1382px;
	height: 78px;
	left: 0px;
	top: 870px;
}

#logo {
	position: relative;
	width: 30%;
}

#login {
	position: absolute;
	width: 88.15px;
	height: 47px;
	left: 1221px;
	top: 43px;
}

.menu {
	position: absolute;
	width: 837px;
	height: 51px;
	left: 433px;
	top: 110px;
}

.menu ul {
	list-style: none;
}

.menu li {
	float: left;
	margin-left: 5%;
	font-size: 1.5em;
	font-weight: bold;
	margin-top: 5%;
	margin-bottom: 2%;
	cursor: pointer;
}

.menu li:first-child {
	margin-left: 13%;
}

hr {
	width: 912px;
	height: 0px;
	left: 397px;
	top: 199px;
	border: 2px solid rgba(39, 47, 89, 0.29);
	box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.1);
}

.side {
	clear: both;
	width: 350px;
	text-align: center;
	float: left;
}

.side h4 {
	margin-left: 80px;
	font-size: x-large;
	color: coral;
	text-decoration: underline;
	margin-bottom: 50px;
}

.side ul {
	list-style: none;
	margin-left: 30px;
}

.side ul li {
	margin-bottom: 40px;
}

.etc {
	margin-left: 120px;
	text-align: center;
	font-weight: 900;
	background-color: rgb(245, 190, 170);
	width: 50px;
	border-radius: 50%;
	line-height: 15px;
}

.main img {
	width: 1000px;
	margin-left: 40px;
	margin-top: 100px;
}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<nav>
				<a href="#"><img src="/image/logo.png" id="logo"></a> <a
					href="#"><img src="/image/login.png" id="login"></a>
				<div class="menu">
					<ul>
						<li id="m1">전시일정</li>
						<li id="m2">기관소개</li>
						<li id="m3">커뮤니티</li>
						<li id="m4">이전전시</li>
						<li id="m5">마이페이지</li>

						<hr>
					</ul>

				</div>


			</nav>

		</div>
		<div id="contents">
			<div class="side">
				<h4>NOW</h4>
				<ul>
					<li>2020. 08. 22 ~ 2020. 09. 22<br>&lt;반 고흐 특별전&gt;</span>
					</li>
					<br>
					<li>2020. 09. 22 ~ 2020. 10. 22<br> &lt;루브르 전&gt;</span></li>
					<br>
					<li>2020. 08. 22 ~ 2020. 09. 22<br>&lt;팝아트&gt;</span></li>
					<br>
					<div class="etc">
						<div>.</div>
						<div>.</div>
						<div>.</div>
					</div>
				</ul>
			</div>
			<div class="main">
				<a href="/introduce"><img src="image/main.png" id="main"></a>
			</div>
		</div>
	</div>

</body>
</html>
