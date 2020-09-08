<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
   	<style>
   	
   	</style>
</head>
<body>
    <div id="container">
        <div id="header">
            <nav>                
                <a href="#"><img src="/img/logo.png" id="logo"></a>
                <a href="#"><img src="/img/login.png" id="login"></a>
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
            <h2 id="singUp_title">회원가입</h2>
            <form action="" id="singUp" method="get">
                <div>
                    <input type="submit" name="member" id="member" value="멤버로가입하기">
                </div>
        
                </div>
                <div class="submit_btn">
                    <input type="submit" name="artist" id="artist" value="작가로가입하기" >
                </div>
                </form>
        </div>
        <div id="footer">
            <h3>푸터 영역</h3>
        </div>
    </div>

</body>
</html>