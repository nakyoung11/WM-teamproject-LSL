<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WM 웹 전시관</title>
    <style>

#container{
    position: relative;
    width: 1382px;
    height: 1356px;
    left: calc(50% - 1382px/2);
    top: calc(50% - 1356px/2 + 42px);
    
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
            float: left;
            margin-left: 40%;
            width: 50%;
        }
        .main input {
            float: left;
            border-top: none;
            border-left: none;
            border-right: none;
            width: 70%;
            background-color: #F9F9F9;
            font-size: 1em;
            height: 3em;
        }
        .main div {
            margin-top: 10%;
        }
        #nick {
            width: 50%;
        }
        #conf {
            width: 10%;
            height: 3em;
            margin-left: 5%;
            background-color: #927E9C;
            border-radius: 50%;
        }
        #btn {
            margin-left: 10%;
            width: 100%;
        }
        #btn button {
            margin-left: 20%;
            height: 3em;
            width: 10%;
            background-color: #927E9C;
        }
        #pro {
           background-color:  #927E9C;
       }
    </style>
</head>
<body>
 
	<div id="container">
        <div id="contents">
            <div class="side">
                <ul type="none">
                    <a href="mypage-both-profile.html"><li id="pro">프로필 관리</li></a>                
                    <a href="mypage-artist-his.html"><li>나의 출품 목록</li></a>
                </ul>
            </div>
            <div class="main">
                <form id="frm" action="/changePw" method="post" onsubmit="return chkChangePw()">
                	<div>
                    	이메일 : ${data.user_email}
                    </div>
                    <div class="nickname">
                    	<label for="nick">닉네임</label> <br>
	                    <input type="text" name="nickname" id="nick" value="${data.nickname}">
	                    <input id="conf" type="button" value="중복확인" id="double_check" onclick="chkNickname()">
                    	<div id="nicknameChkResult" class="msg"></div>
                    	<div>닉네임만 변경시 기존의 비밀번호를 그대로 입력해주세요.</div>
                    </div>
                    <div>
                        <label for="pw">변경 비밀번호</label><br>
                        <input type="password" name="pw" id="pw"><br>
                    </div>
                    <div>
                        <label for="pwc">변경 비밀번호 확인</label><br>
                        <input type="password" name="pwc" id="pwc"><br>
                    </div>
                    <div id="btn">
                      	<input type="submit" value="변경하기">
                    </div> 
                </form>
                 
            </div>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>


function chkChangePw() {
	if(frm.pw.value != frm.pwc.value) {
		alert('비밀번호를 확인해 주세요.')
		frm.pw.focus()
		return false
	}

	if(!frm.pw.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/) || frm.user_pw.value.length > 16) {
		alert("8~16자 영문, 숫자, 특수문자를 사용하세요.")
		frm.pw.focus()
		return false
	}
}

function chkNickname() {
	const nickname = frm.nickname.value
	axios.get('/ajaxnickname', {
		params: {
			nickname : nickname
		} 
	}).then(function(res) {
		console.log(res)
		if(frm.nickname.value != '') {
			if(res.data == 1) { // 닉네임 DB에 없음
				nicknameChkResult.innerText = '사용할 수 있는 닉네입니다.'
			} else if(res.data == 0) { // 닉네임 DB에 있음
				nicknameChkResult.innerText = '이미 사용중입니다.'
			}
		} else {
			alert('닉네임을 입력해주세요')
		}
		
	})
}
</script>
</html>