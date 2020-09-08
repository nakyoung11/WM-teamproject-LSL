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
    background: #FFFCFE
}

#container {
    display: flex;
    width: 1350px;
    height: 1356px;
    margin: 5px auto;
    justify-content: center;
}

#header {
    position: fixed;
    width: 1440px;
    height: 215px;
    height: 248px;
    left: calc(50% - 1440px/ 2);
    margin-bottom: 50px;
    top: 0px;
    background: #FFFCFE;
    z-index: 9999;
}

#contents {
    position: relative;
    width: 1398px;
    margin-top: 260px;
}

#footer {
    position: absolute;
    width: 1440px;
    height: 78px;
    left: 0px;
    top: 1740px;
}

#logo {
    width: 320px;
    height: 228px;
}

#login {
    position: absolute;
    width: 88.15px;
    height: 47px;
    left: 1221px;
    top: 43px;
}

.menu ul {
    position: absolute;
    width: 837px;
    height: 51px;
    left: 400px;
    top: 134px;
    list-style: none;
}

.menu li {
    float: left;
    margin-left: 60px;
    font-size: 1.3em;
    font-weight: bold;
    margin-bottom: 1%;
    cursor: pointer;
}

hr {
    clear: both;
    float: right;
    width: 940px;
    margin-left: 10%;
    border: 1px solid rgba(39, 47, 89, 0.29);
    box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.1);
}

#schedua {display: flex;
    justify-content: space-between;
    width: 1200px;}
#schedua li{font-size:1.2em}

#now{
    background: cornflowerblue; 
    padding: 10px;
}

.now {
display: flex;
flex-direction: column;


}

.now .title {
    text-align: center;
    font-size: 1.5em;
}



#now_schedua {
    
}

#now_schedua ul {

    list-style: none;
}

#now_schedua li {

}

#now_schedua p {

}



</style>
</head>
<body>
    <div id="container">
        <div id="header">
            <nav>
                <a href="/main"><img src="/image/logo.png" id="logo"></a> <a
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
   
    </style>
</head>
<body>
    <div id="container">
        <div id="header">
            <nav>
                <a href="/main"><img src="image/logo.png" id="logo"></a> <a
                    href="#"><img src="image/login.png" id="login"></a>
                <div class="menu">
                    <ul>
                        <a><li id="m1">전시일정</li></a>
                        <a><li id="m2">기관소개</li></a>
                        <a><li id="m3">커뮤니티</li></a>
                        <a><li id="m4">이전전시</li></a>
                        <a><li id="m5">마이페이지</li></a>

                        <hr>
                    </ul>
                </div>
            </nav>
        </div>
<div id="contents">
    <div id="schedua">
        <div id="now">
            <div class="now">
                <p class="title">NOW</p>
            </div>
            <div id="now_schedua">
                <ul>
                    <li>2020. 08. 22 ~ 2020. 09. 22
                        <p>고흐전
                        <p>
                    </li>
                    <li>2020. 09. 22 ~ 2020. 10. 22
                        <p>현대미술
                        <p>
                    </li>
                    <li>2020. 08. 22 ~ 2020. 09. 22
                        <p>하이선</p>
                    </li>
                </ul>
            </div>
        </div>
        <div id="coming_soon">
            <div class="coming_soon">
                <p class="title">Coming Soon</p>
        </div>
            <div id="coming_schedua">
                <ul>
                    <a href="/introduce"><li>2020. 08. 22 ~ 2020. 09. 22
                        <p>고흐전
                        <p>
                    </li></a>
                    <li>2020. 09. 22 ~ 2020. 10. 22
                        <p>현대미술
                        <p>
                    </li>
                    <li>2020. 08. 22 ~ 2020. 09. 22
                        <p>하이선</p>
                    </li>
                </ul>
            </div>
        </div>
        <div id="recruitment">
            <div class="recruitment">
                <p class="title">Recruitment</p>
            </div>
            <div id="recruitment_schedua">
                <ul>
                    <li>2020. 08. 22 ~ 2020. 09. 22
                        <p>고흐전
                        <p>
                    </li>
                    <li>2020. 09. 22 ~ 2020. 10. 22
                        <p>현대미술
                        <p>
                    </li>
                    <li>2020. 08. 22 ~ 2020. 09. 22
                        <p>하이선</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
</div>

</body>
</html>