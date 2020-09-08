<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WM 웹 전시관</title>
    <style>
body{ background: #F9F9F9}
#container{
    position: relative;
    width: 1382px;
    height: 1356px;
    left: calc(50% - 1382px/2);
    top: calc(50% - 1356px/2 + 42px);
    
}
#header {
    position: fixed;
    width: 1440px;
    height: 215px;
    left: calc(50% - 1440px/2);
    top: 0px;
    background: #F9F9F9;
    z-index: 9999;
}
#contents {
       
    position: absolute;
    width: 907px;
    height: 620px;
    right: 99px;
    top: calc(53% - 633px/2 + 41px);
            
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
.menu{
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
.menu li:first-child{
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
            float: left;
            position: fixed;
            top: 40%;
        }
        .side li {
            color: black;
            width: 130%;
            margin-top: 50%;
            font-size: 1.5em;
            padding: 10%;
            text-align: center;
            border-radius: 50%;
        }
        .side li:hover {
            background-color: #927E9C;
            cursor: pointer;
        }
        .side a {
            text-decoration: none;
        }
       .main {
           margin-left: 40%;
           margin-top: 15%;
           font-size: 2em;
       }
       .main input {
           width: 40%;
           height: 1.5em;
           border-top: none;
            border-left: none;
            border-right: none;
            background-color: #F9F9F9;
            font-size: 1em;
       }
       .main button {
           width: 15%;
           height: 3em;
           background-color: #927E9C;
       }

    </style>
</head>
<body>
<div id="container">
        <div id="header">
            <nav>
                <div class="top">
                <a href="#"><img src="/image/logo.png" id="logo"></a>
                <a href="#"><img src="/image/login.png" id="login"></a>
                <div class="menu">
                    <ul>
                        <li id="m1">전시일정</li>
                        <li id="m2">기관소개</li>
                        <li id="m3">커뮤니티</li>
                        <li id="m4">이전전시</li>
                        <li id="m5"><a href="mypage_both_conf.jsp">마이페이지</a></li>                     
                        <hr> 
                    </ul>                 
                </div> 
            </div>   
            </nav>     
        </div> 
        </div>
        <div id="contents">
            <div class="side">
                <ul type="none">
                    <a href="mypage-both-profile.html"><li>프로필 관리</li></a>                
                    <a href="mypage-artist-his.html"><li>나의 출품 목록</li></a>
                </ul>
            </div>
            <div class="main">
                    <label for="passCon">비밀번호 확인 : </label>
                    <input type="password" name="passCon" id="passCon">
                    <a href="mypage-both-profile.html"><button>확인</button></a>
            </div>
        </div>
</body>
</html>