
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>
  <div id="headerWrap">
        <header id="header">
            <h1 class="hidden">WM</h1> 
             <nav id="member">
                <h2 class="hidden">회원로그인/ 가입/ 로그아웃</h2>
              <c:choose>
					<c:when test="${loginUser.nickname != null}">
						<ul><li style="font-size:13px">${loginUser.nickname}님 환영합니다. <a href="/logout"><span> 로그아웃</span></a></li></ul>  
					</c:when>
					<c:otherwise>
						  <ul>
	                    <li><a href="/login"><span class="material-icons md-36">login</samp></a></li>
	                    <li><a href="/join">JOIN</a></li>
	                	</ul>
					</c:otherwise>
				</c:choose>     
            </nav>
            <nav id="menu">
                <h2 class="hidden">WM이용메뉴</h2>
                <ul>
                <li><a href="/">메인</a></li>
                 <li><a href="/showlist">전시둘러보기</a></li>
                 <li><a href="/notice">공지사항</a></li>
                 <li id="mypage">
                 <a href="/writer/mypage_profile">마이페이지</a>                	    
		                <ul id="my_nav">
		                  <li id="pro">  <a href="/writer/mypage_profile">프로필 관리</li></a>                
		                    <li><a href="/exhibit_page2">나의 출품 관리</li></a>
		                </ul>                
                 </li>
                 <li><a href="">이용안내</a></li>
               	</ul>
            </nav>				
        </header>   
 </div>  

</body>

</html>