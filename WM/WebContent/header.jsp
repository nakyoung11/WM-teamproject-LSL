<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>

		<div id="header">
			<nav>
				<a href="/main"><img src="/resource/main/images/logo.png" id="logo"></a> 
				<a href="/login"><img src="/resource/main/images/login.png" id="login"></a>
				<c:choose>
					<c:when test="${loginUser.nickname != null}">
						${loginUser.nickname}님 환영합니다.
					</c:when>
					<c:otherwise>
						손님 환영합니다.
					</c:otherwise>
				</c:choose>
				<a href="/logout">로그아웃</a>
				<div class="menu">
					<ul>
						<li id="m1"><a href="/calendar">전시일정</a></li>
						<li id="m2"><a>기관소개</a></li>
						<li id="m3"><a>커뮤니티</a></li>
						<li id="m4"><a>이전전시</a></li>
						<li id="m5"><a href="/writer/mypage_profile">마이페이지</a></li>		
					</ul>
					<hr>
				</div>
			</nav>
		</div>
	
</body>
</html>