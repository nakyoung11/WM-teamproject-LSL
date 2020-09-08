<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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

#joinFrm {
    width: 100%;
    margin:5% auto;
    
 
}

label {
    padding-left: 1em;
    display: block;
    margin: 10px;
    font-size: 1.4em;
    font-size-adjust:0.6em
}

#pw_guide {
    display: block;
    padding-left: 2em;
    margin-bottom: 2em;
    font-size: 1em;
    color: rgb(170, 14, 14);
    font-size-adjust:0.6em
}

input {
    width: 55%;
    height: 2.5em;
    margin-left: 3%;
    margin-bottom: 2em;
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

#birthday {
    padding-left: 1em;
    display: block;
    margin: 10px;
    font-size: 1.4em;
    font-size-adjust:0.6em
}

.birthday>label {
    display: inline-block;
    width: 5%;
    margin-right: 10px;
    padding-left: 0;
    font-size-adjust:0.6em
}

.birthday>input {
    width: 15%;

  
}

.birthday>#month, #date {
    width: 10%;
    margin-left: 3px;
    
}

#join_title{
    position: relative;
    color: #4C3C50;
    font-size:2em;
    margin: 1% 0% 10% 3%}

.nickname>input{width:45%}
.news{height: 10%;}
#user_pw{margin-bottom: 0.8em;}
#checkbox {
    font-size:1.3em;
    height: 1em;
    width: 1.3em;
    margin-right: 0.5em;

   
}

#news_guide {
    font-size: 1.3em;
    
   
}

#double_check {
    display: inline-block;
    width: 13%;
    height: 2.5em;
    border: none;
    background: #544E57;
    border-radius:1em;
    font-size: 1em;
    padding:10px;
    color: white;

}

#submit_btn {
    display:block;
    margin: 4em auto;
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
            <h2 id="join_title">회원가입</h2>
            <form action="" id="joinFrm" method="post" onsubmit="return chk()">
              
               <div class="user_email"><label for="user_email">이메일</label>
                    <input type="email" name="user_email" id="user_email" required autofocus>
                </div>
                <div class="nickname">
                    <label for="nickname">닉네임</label>
                    <input type="text" name="nickname" id="nickname" placeholder="5글자 이하">
                    <input type="button" value="중복확인" id="double_check">
                </div>
                <div class="user_pw"><label for="user_pw">비밀번호</label>
                    <input type="password" name="user_pw" id="user_pw" required>
                    <span id="pw_guide">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
                </div>
                <div class="user_pwre"> <label for="urpwr">비밀번호확인</label>
                    <input type="password" name="user_pwre" id="user_pwre"></label>
                </div>
                <div class="birthday">
                    <p id="birthday">생년월일</p>
                    <input type="text" name="year" id="year" placeholder="예)1990"><label for="year">년</label>
                    <input type="text" name="month" id="month" placeholder="예)12"><label for="month">월</label>
                    <input type="text" name="date" id="date" placeholder="예)1"><label for="date">일</label>
                </div>
                <div class="news">
                    <input type="checkbox" name="news" value="yes" id="checkbox"><span id="news_guide">전시회 정보 및 소식 받기</label>
                </div>
                <div class="submit_btn">
                    <input type="submit" value="가입하기" id="submit_btn">
                </div>
                </form>
        </div>
        <div id="footer">
            <h3>푸터 영역</h3>
        </div>
    </div>

    <script>
		function chk() {
			if (frm.user_id.value.length < 5) {
				alert("아이디는 5글자 이상이어야 합니다.")
				frm.user_id.focus()
				return false
			} else if (frm.user_pw.value.length < 8) {
				alert("비밀번호는 5글자 이상이어야 합니다.")
				frm.user_pw.focus()
				return false
			} else if (frm.user_pw.value != frm.user_pwre.value) {
				alert("비밀번호를 확인해주세요.")
				frm.user_pw.focus()
				return false
		    } 
			
			if (frm.user_email.value.length > 0) { 
				const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
				if (!email.test(frm.email.value)) {
					alert("이메일을 확인해 주세요.")
					frm.nm.focus()
					return false
				}
			} 

		}
	</script>

</body>
</html>