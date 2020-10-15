<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <style>
body{width:100%; height:100%; background-image:url('/resource/background/background.png'); 
display: flex; justify-content: center;align-items: center;}
 
 a {
	text-decoration: none;
	color: #333;
}
#loginFrm {
    width: 300px;
    margin: 40% auto;
    padding: 40px;
    background-color: rgba(255, 255, 255, 0.911);
  
}

label {
    padding-left: 15px;
    display:inline-block;
    margin-bottom:15px;
    font-size: 18px;
    font-size-adjust:0.6em;
}
 
input {
    clear: both;
    width: 280px;
    margin-bottom: 20px;
    height: 1.8em;
    font-size: 18px;
    border: 0;
    background: none;
    border-bottom: 1px solid black;
    padding-left: 10px;
    font-size-adjust:0.6em;
    cursor:pointer;
}
  
#login_title{
    position: relative;
    color: #4C3C50;
    font-size:25px;
    text-align: center;}
  
#submit_btn {
   display:block;
    margin: 15px auto;
    width: 250px;
    height:40px;
    background: #927E9C;
    border: none;
    border-radius:1em;
    font-size: 1em;
    padding:10px;
    color: white;
 }

#msg{margin-bottom: 20px; margin-left: 10px;}
#join{margin: 10px auto; text-align: center;}
#forget{margin: 10px auto; text-align: center; cursor: pointer; width: 107px}
#main{margin: 10px auto; text-align: center; cursor: pointe}
a:hover{background: linear-gradient(to top, #8F84A3 50%, transparent 10%)}
#forget:hover {
	background: linear-gradient(to top, #8F84A3 50%, transparent 10%)
}
    </style>
</head>
<body>
        <div id="contents">
                 <form action="/login" id="loginFrm" method="post" onsubmit="return chk()">      
              <h2 id="login_title">로그인</h2>
                 <div id="msg">${msg}</div> 
                  <div class="user_email"><label for="user_email">이메일</label><br>
                    <input type="email" name="user_email" id="user_email" value="${user_email}" required autofocus>
                </div>            
                <div class="user_pw"><label for="user_pw">비밀번호</label><br>
                    <input type="password" name="user_pw" id="user_pw" required>
                </div>   
              
                <div class="submit_btn">
                    <input type="submit" value="로그인" id="submit_btn">
                </div>
                   <div id="join"><a href="/join" >회원가입</a></div>
                   <div id="forget" onclick="window.open('/findpassword','비밀번호 변경' ,'height=500, width=500, top=200, left=500, scrollbars=no, resizable=no, toolbars=no, menubar=no')">비밀번호 찾기</div>
            	 <div id="main"><a href="/main" >메인으로</a></div>
                </form>
        </div>
 
        <div id="footer">
     
        </div>
</body>
</html>