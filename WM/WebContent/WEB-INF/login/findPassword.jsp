<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	body {
		background-color: #dfe6e9;
	}
	.container {
            width: 100%;
        }
        input {
            height: 30px;
        }

        #user_email {
            margin-top: 10px;
            margin-bottom: 10px;
            width: 300px;
        }
        #joinFrm {
		    margin: 10%;
	    }

        .birth {
            width: 50px;
        }
        .birthLabel {
            margin-right: 10px;
        }
        .checkBtn {
            height: 35px;
            width: 50px;
            color: white;
            background-color: #927E9C;
            border: none;
            border-radius: 10%;
            margin-bottom: 10px;
        }
        #pw_guide {
            font-size: 0.8em;
            color: red;
        }
        #joinFrm > div > label {
            float: left;
            width: 100px;
            margin-top: 10px;
            margin-right: 10px;
        }
        #joinFrm > div > input {
            width: 190px;
            margin-bottom: 10px;
        }
        .changeBtn {
            color: white;
            background-color: #927E9C;
            border: none;
            border-radius: 10%;
            height: 35px;
            width: 60px;
            margin-left: 35%;
            margin-top: 20px;
        }
        .msg {
        	color: red;
        }
</style>
</head>
<body>
	<div class="container">
        <form id="joinFrm" action="/ajaxfindpass" method="post" onsubmit="return chk()">
            <h1>비밀번호 변경</h1>
            <h3>등록된 생년월일로 변경</h3>
			<div>
                생년월일을 인증 후 새비밀번호를 등록해주세요.
			</div>
			<label for="user_email"></label>
			<input type="email" name="user_email" id="user_email" placeholder="가입된 이메일 입력"><br>
			
			생년월일<br>
			<input class="birth" type="text" name="user_year" id="year" placeholder="예)1990"><label for="year" class="birthLabel">년</label>
	        <input class="birth" type="text" name="user_month" id="month" placeholder="예)12"><label for="month" class="birthLabel">월</label>
	        <input class="birth" type="text" name="user_date" id="date" placeholder="예)1"><label for="date" class="birthLabel">일</label>
	        <input class="checkBtn" type="button" value="검사" onclick="chkEmail()"> <br>
	        <input type="hidden" name="emailCheck" value="emailUnCheck">
            <div id="emailChkResult" class="msg"></div>
            
            <div>
            <label for="user_pw">새비밀번호</label>
                    <input type="password" name="user_pw" id="user_pw" required><br>
            
            <label for="user_pwre">새비밀번호확인</label>
                    <input type="password" name="user_pwre" id="user_pwre">
            </div>
            <span id="pw_guide">8~16자 영문, 숫자, 특수문자를 사용하세요.</span><br>
	        <input class="changeBtn" type="submit" value="변경하기">
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>
	function chk() {

		if(joinFrm.emailCheck.value != "emailCheck") {
			alert('검사를 해주세요.')
			return false
		}
		if (!joinFrm.user_pw.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/) || joinFrm.user_pw.value.length > 16) {
			alert("8~16자 영문, 숫자, 특수문자를 사용하세요.")
			joinFrm.user_pw.focus()
			return false
		} else if (joinFrm.user_pw.value != joinFrm.user_pwre.value) {
			alert("비밀번호를 확인해주세요.")
			joinFrm.user_pw.focus()
			return false
		} 
	}
	function chkEmail() {
		const user_email = joinFrm.user_email.value
		const user_year = joinFrm.user_year.value
		const user_month = joinFrm.user_month.value
		const user_date = joinFrm.user_date.value
		axios.get('/ajaxfindpass', {
			params: {
				user_email : user_email,
				user_year : user_year,
				user_month : user_month,
				user_date : user_date
			} 
		}).then(function(res) {
			console.log(res)
			if(joinFrm.user_email.value != '') {
				if(res.data == 3) { // 이메일 DB에 없음
					emailChkResult.innerText = '확인되지 않은 정보입니다.'
					joinFrm.emailCheck.value = "emailUnCheck"
				} else if(res.data == 2) { // 이메일 DB에 있음
					emailChkResult.innerText = '확인되었습니다.'
					joinFrm.emailCheck.value = "emailCheck"
				}
			} else {
				alert('이메일을 입력해주세요')
			}
			
		})
	}
	</script>
</body>
</html>