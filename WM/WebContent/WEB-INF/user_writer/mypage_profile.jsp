<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WM 웹 전시관</title>
    <style>
#headerWrap{flex: 1; height: 179px;}
body{padding-top: 250px;}

#container {
    display: flex;
    width: 1000px;
 	margin-bottom:400px;
   justify-content: center;
    align-content: center;
    align-items:center;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300; 
    flex: 1;
}

#contents {
	margin-top: 40px;
	display: flex;
	flex-flow: column;

}

/*----------------------- 추가 사항 ----------------- */

.main{display: flex;
	flex-flow: row nowrap;
	align-items:center;
	height:100%;}

.left{display: flex; flex-flow: column; justify-content:center;   align-items: center;
 margin-right: 50px}
#double_check{font-size: small;}
input{background: none; border:none ; cursor: pointer;font-size: 16px}
#profile{display: flex; flex-flow:column;justify-content: center; text-align: center;}
#profile input:first-child{overflow: hidden; }
#profile .align{display: flex; flex-flow: row nowrap; align-items: center; }
.material-icons{transition: all ease 0.5s; }
.material-icons:hover {transform: rotate( 90deg ); color: red}
.btn{margin-right: 5px; margin-left: 5px; font-size: small;transition: all ease 0.8s;}
.right{margin-bottom: 40px}


.profile_img img{
	width: 250px;
	height: 250px;
	border-radius: 10px;
	margin-bottom: 10px;
}

.btn:hover{background: linear-gradient(to top, #DE9849 10%, transparent 10%)}
.right label, input{margin-top: 20px}
.nickname, .pwc_box {display: flex; flex-flow: row;margin-top: 15px;}
.pwc_box {margin: 0}
.pw_box{display: flex; flex-flow: column;}
.pw_box{margin: 0}
.msg{color: red; font-size:small; margin-left: 5px}
.nickname #nick{margin-left: 5px; border-bottom: 1px solid gray;}
.right #pw, #pwc{border-bottom: 1px solid gray; width:260px; font-size: 18px}
#imgchange{width: 220px}

  </style>

</head>

<body>
 	<jsp:include page="../../header.jsp"></jsp:include>

    <div id="container">
      <div id="contents">
      <div class="main">
		<div class="left">
            <div class="profile_img"> 
				<c:choose>
					<c:when test="${data.profile_img != null}">
						<img src="/img/user/${loginUser.i_user}/${data.profile_img}">
					</c:when>
					<c:otherwise>
						<img src="/resource/profile/default_profile.jpg">
					</c:otherwise>
				</c:choose>
			</div>

			<form action="/profile" method="post" enctype="multipart/form-data" id="profile">
				 <label for="imgchange">프로필이미지 바꾸기 </label>
					<br>
					<div class="align">
						<input type="file" name="profile_img" accept="image/*" id="imgchange">
					    <input type="submit" value="변경하기" class="btn" >
					</div>				
				</form>
			</div>

				<div class="right">
	               	<div>
                    	이메일 : ${data.user_email}
                    </div>
                    <form id="nicknameFrm" action="/changeNickname" method="post" onsubmit="return chkChangeNickname()"> 

	                    <div class="nickname">
	                    	<label for="nick">닉네임 : </label>
		                    <input type="text" name="nickname" id="nick" value="${data.nickname}"> 
		                    <input type="button" value="중복확인" class="btn" id="double_check" onclick="chkNickname()">
		                   	<input type="hidden" name="nicknameCheck" value="nicknameUnCheck">
	                    	<div id="btn">
	                      		<input type="submit" value="변경하기" class="btn">
	                   	 	</div> 
	                    </div>	 	<div id="nicknameChkResult" class="msg"></div> 
                    </form>
                   	<br>
	                <form id="pwFrm" action="/changePw" method="post" onsubmit="return chkChangePw()">
                   <div class="pw_box">
	                        <label for="pw">변경 비밀번호</label>
	                        <input type="password" name="pw" id="pw">	                             
	                        <label for="pwc">변경 비밀번호 확인</label>
	                        
	                   <div class="pwc_box">
	                        <input type="password" name="pwc" id="pwc">               
	                      	<input type="submit" value="변경하기" class="btn"> 
	                  </div> 
	              </div>  
	                    </div>
	                   </div> 
	                  

	                </form>
       </div>

    </div>

  <jsp:include page="../../footer.jsp"></jsp:include>

</body>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

 
function chkChangePw() {
	if(pwFrm.pw.value != pwFrm.pwc.value) {
		alert('비밀번호를 확인해 주세요.')
		pwFrm.pw.focus()
		return false
	}

 	if(!pwFrm.pw.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/) || pwFrm.user_pw.value.length > 16) {
		alert("8~16자 영문, 숫자, 특수문자를 사용하세요.")
		pwFrm.pw.focus()
		return false
	}
}


function chkChangeNickname() {
	if(nicknameFrm.nicknameCheck.value != "nicknameCheck") {
		alert('닉네임 중복확인을 해주세요.')
		return false
	}
}


function chkNickname() {
	const nickname = nicknameFrm.nickname.value
	axios.get('/ajaxnickname', {
		params: {
			nickname : nickname
		} 
	}).then(function(res) {
		console.log(res)
		if(nicknameFrm.nickname.value != '') {
			if(res.data == 1) { // 닉네임 DB에 없음
				nicknameChkResult.innerText = '사용할 수 있는 닉네입니다.'
				nicknameFrm.nicknameCheck.value = "nicknameCheck"
			} else if(res.data == 0) { // 닉네임 DB에 있음
				nicknameChkResult.innerText = '이미 사용중입니다.'
				nicknameFrm.nicknameCheck.value = "nicknameUnCheck"
			}
		} else {
			alert('닉네임을 입력해주세요')
		}
	
	})

}

</script>

</html>