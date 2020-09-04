<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
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

#loginFrm {
    width: 80%;
    margin:10% auto; 
    text-align: center;
 
}
label {
    margin-top: 1%;
    padding-left: 1em;
    margin-right: 2%;
    display:inline-block;
    margin-bottom: 3em;
    font-size: 1.4em;
    font-size-adjust:0.6em
}

input {
    width: 40%;

    margin-bottom: 3.5em;
    height: 1.8em;
    font-size: 1.2em;
    border-top: 0px;
    border-left: 0px;
    border-right: 0px;
    border-bottom: 1px solid black;
    background: #F9F9F9;
    padding-left: 1em;
    font-size-adjust:0.6em;
    cursor:pointer;
}


#login_title{
    position: relative;
    color: #4C3C50;
    font-size:2em;
    text-align: center;}





#submit_btn {
    display:block;
    margin: 2em auto;
    width: 60%;
    height:3.5em;
    background: #927E9C;
    border: none;
    border-radius:1em;
    font-size: 1em;
    padding:10px;
    color: white;

}
    
    </style>
</head>
<body>
    <div id="container">
        <div id="header">
            <nav>                
                <a href="#"><img src="/wm (3)/img/logo.png" id="logo"></a>
                <a href="#"><img src="/wm (3)/img/login.png" id="login"></a>
                <div class="menu">
                    <ul>
                        <li id="m1">전시일정</li>
                        <li id="m3">커뮤니티</li>
                        <li id="m4">이전전시</li>
                        <li id="m5">마이페이지</li>
                        
                        <hr> 
                    </ul>      
                     
                </div>       
            </nav>
           
        </div> 
       
        <div id="contents">
            <h2 id="login_title">로그인</h2>
            <form action="" id="loginFrm" method="post" onsubmit="return chk()">
              
               <div class="user_email"><label for="user_email">이메일</label>
                    <input type="email" name="user_email" id="user_email" required autofocus>
                </div>
              
                <div class="user_pw"><label for="user_pw">비밀번호</label>
                    <input type="password" name="user_pw" id="user_pw" required>
                </div>
                <div class="submit_btn">
                    <input type="submit" value="로그인" id="submit_btn">
                </div>
                </form>
        </div>
        <div id="footer">
            <h3>푸터 영역</h3>
        </div>
    </div>

</body>
</html>