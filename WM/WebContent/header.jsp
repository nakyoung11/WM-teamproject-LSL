

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title></title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"

      rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/style.css">

</head>

<body>


    <div id="headerWrap">
        <header id="header">
            <h1><a href="">WM</a></h1> 
             <nav id="member">

                <h2 class="hidden">회원로그인/ 가입/ 로그아웃</h2>
                
       
            </nav>
            <nav id="menu">
                <h2 class="hidden">WM이용메뉴</h2>

                <ul>
                    <li id="li_1"  class="main_li"><a href="#">전시 둘러보기</a></li>
                    <li class="main_li"><a href="#">전시상세</a></li>
                    <li class="main_li"><a href="#">커뮤니티</a>
                       <ul class="sub_menu">
                          <li><a href="#">공지사항</a></li>
                          <li><a href="#">자유게시판</a></li>
                       </ul>
                    </li>
                    <li><a href="/writer/mypage_profile"  class="main_li">마이페이지</a>
                       <ul class="sub_menu_2">
                          <li><a href="#">프로필관리</a></li>
                     <li><a href="#">전시회관리</a></li>                       
                       </ul>
                    </li>
                  </ul>
            </nav>
<c:choose>
					<c:when test="${loginUser.nickname != null}">
						${loginUser.nickname}님 환영합니다.<a href="/logout">로그아웃</a></div>
					</c:when>
					<c:otherwise>
						  <ul>
	                    <li><a href="/login"><span class="material-icons md-36">login</samp></a></li>
	                    <li><a href="/join">JOIN</a></li>
	                	</ul>
					</c:otherwise>
				</c:choose>
        </header> 
    </div>  
</body>
</html>