<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	#joinFrm {
		margin: 25%;
	}
	.alert {
		color: red;
	}
</style>
</head>
<body>
	<div class="container">
		<form id="joinFrm" action="/ajaxfindpass" method="post" onsubmit="return chk()">
			<div class="alert">
				비밀번호는 변경만 가능합니다.
			</div>
			<label for="user_email">이메일</label>
			<input type="text" name="user_email" id="user_email"><br>
			생년월일<br>
			<input class="birth" type="text" name="user_year" id="year" placeholder="예)1990"><label for="year">년</label><br>
	        <input class="birth" type="text" name="user_month" id="month" placeholder="예)12"><label for="month">월</label><br>
	        <input class="birth" type="text" name="user_date" id="date" placeholder="예)1"><label for="date">일</label><br>
	        <input type="button" value="검사" onclick="chkEmail()"> <br>
	        <input type="hidden" name="emailCheck" value="emailUnCheck">
            <div id="emailChkResult" class="msg"></div>
             <div class="user_pw"><label for="user_pw">비밀번호</label>
                    <input type="password" name="user_pw" id="user_pw" required><br>
                    <span id="pw_guide">8~16자 영문, 숫자, 특수문자를 사용하세요.</span>
                </div>
                <div class="user_pwre"> <label for="user_pwre">비밀번호확인</label>
                    <input type="password" name="user_pwre" id="user_pwre">
                </div>
	        <input type="submit" value="변경하기">
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