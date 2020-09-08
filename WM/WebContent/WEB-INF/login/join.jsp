<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <style>

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
#news {
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
 
        <div id="contents">
            <h2 id="join_title">회원가입</h2>
            <form action="" id="joinFrm" method="post">
              
               <div class="user_email"><label for="user_email">이메일</label>
                    <input type="email" name="user_email" id="user_email" required autofocus>
                </div>
                <div class="nickname">
                    <label for="nickname">닉네임</label>
                    <input type="text" name="nickname" id="nickname" placeholder="5글자 이하">
                    <input type="button" value="중복확인" id="double_check">
                    <div id="idChkResult" class="msg"></div>
                </div>
                <div class="user_pw"><label for="user_pw">비밀번호</label>
                    <input type="password" name="user_pw" id="user_pw" required>
                    <span id="pw_guide">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
                </div>
                <div class="user_pwre"> <label for="user_pwre">비밀번호확인</label>
                    <input type="password" name="user_pwre" id="user_pwre"></label>
                </div>
                <div class="birthday">
                    <p id="birthday">생년월일</p>
                    <input type="text" name="user_year" id="year" placeholder="예)1990"><label for="year">년</label>
                    <input type="text" name="user_month" id="month" placeholder="예)12"><label for="month">월</label>
                    <input type="text" name="user_date" id="date" placeholder="예)1"><label for="date">일</label>
                </div>
                <div class="news">
                	<label id="news_guide" for="news"> <input type="checkbox" name="news" value="1" id="news">전시회 정보 및 소식 받기</label>
                </div> 
                <div class="submit_btn">
                    <input type="submit" value="가입하기" id="submit_btn">
                </div>
                </form>
        </div>
        <div id="footer">
            <h3>푸터 영역</h3>
        </div>

		<script>
			function chk() {
				if (joinFrm.user_pw.value.length < 8) {
					alert("비밀번호는 8글자 이상이어야 합니다.")
					joinFrm.user_pw.focus()
					return false
				} else if (joinFrm.user_pw.value != joinFrm.user_pwre.value) {
					alert("비밀번호를 확인해주세요.")
					joinFrm.user_pw.focus()
					return false
				}
	
				if (joinFrm.user_email.value.length > 0) {
					const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
					if (!email.test(frm.email.value)) {
						alert("이메일을 확인해 주세요.")
						joinFrm.nm.focus()
						return false
					}
				}
	
			}
		</script>

</body>
</html>