<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
</head>
<style>
#headerWrap {
	flex: 1
}

body {
	padding-top: 250px;
}

#container {
	display: flex;
	width: 1000px;
	margin-bottom: 400px;
	justify-content: center;
	align-content: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	flex: 1;
	background-image:
}

#contents {
	display: flex;
	flex-flow: column;
	flex: 1;
	height: 100%;
}
/*----------------------- 추가 사항 ----------------- */
input, textarea {
	background: none;
}

#exhibit_list {
	width: 100%;
	margin: 5% auto;
}
#input_painting{position: relative;}
#exhibit_list table {
	border-collapse: separate;
	width: 100%;
	height: 280px;
	padding-bottom: 30px;
	margin-bottom: 5%;
	border-bottom: 1px solid #3f3d55;
}

}
#exhibit_list table:nth-last-child(1) {
	animation: fadeInDown;
	animation-duration: 1s;
}

#exhibit_list table tr:nth-child(1) td:nth-child(1) {
	width: 7%;
}

#exhibit_list table td:nth-child(1) button {
	border-style: none;
	color: white;
	text-align: center;
	font-size: 1em;
	padding-bottom: 10%;
	border-radius: 50%;
	cursor: pointer;
	background: #FF798A;
}

#exhibit_list table td:nth-child(1) button:hover {
	background-color: rgb(214, 18, 18);
	transition-duration: 0.7s;
}

#exhibit_list table td:nth-child(2) {
	position: relative;
	width: 25%;
}

#exhibit_list table td:nth-child(2) div {

	width: 90%;
	height: 100%;
	background-size: 100% 100%;
	cursor: pointer;
	display: table;
	background-image: url("/resource/exhibit/imgbox.JPG");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: 50% 50%;
}

#exhibit_list table td:nth-child(2) div:hover {
	opacity: 1;
	transition-duration: 0.3s;
	background-image: none;
}

#exhibit_list table td:nth-child(2) div span {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	font-size: 1.5em;
	font-weight: bold;
	color: black;
	opacity: 0;
}

#exhibit_list table td:nth-child(2) div span:hover {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	font-size: 1.5em;
	font-weight: bold;
	color: black;
	opacity: 1;
}

#exhibit_list table td:nth-child(3) {
	width: 12%;
	height: 5%;
	text-align: center;
	font-size: 1.2em;
	font-weight: bold;
	border: 0;
	margin: 0;
	font-weight: bolder;
}

#exhibit_list table td:nth-child(4) {
	position: relative;
	border: 0;
	width: 100%;
}

#exhibit_list table td:nth-child(4) input {
	position: absolute;
	top: 0;
	left: 5%;
	border: 0;
	font-size: 1.5em;
	font-weight: bold;
	width: 90%;
	height: 100%;
	border-bottom: 1px solid #3f3d55;
}

#exhibit_list table tr:nth-child(2) td:nth-child(1) {
	text-align: center;
	font-size: 1em;
	font-weight: bolder;
}

#exhibit_list table tr:nth-child(2) td:nth-child(2) {
	position: relative;
	width: 100%;
	height: 150px;
	font-weight: bold;
	border: 0;
	padding: 0;
}

#exhibit_list table tr:nth-child(2) td:nth-child(2) textarea {
	position: absolute;
	top: 5%;
	left: 5%;
	width: 90%;
	height: 90%;
	resize: none;
	border-bottom: 1px solid #3f3d55;
	font-weight: bolder;
	font-size: 1.3EM;
	border: none;
	padding: 30px 0 20px 0px;
}

#add_work_btn {
	display: block;
	border: none;
	width: 85px;
	height: 85px;
	border-radius: 50%;
	background-color: #ACA6CF;
	font-size: 4.5em;
	color: white;
	margin: 0% auto;
	cursor: pointer;
}

#add_work_btn:hover {
	transition-duration: 0.7s;
	background-color: #5a5095;
}

#exhibit_work_btn {
	display: block;
	border: none;
	width: 150px;
	height: 65px;
	border-radius: 10px;
	background-color: #92809B;
	font-size: 140%;
	padding: 0% 0%;
	color: white;
	margin: 10% auto;
	cursor: pointer;
}

#exhibit_work_btn:hover {
	transition-duration: 0.7s;
	background-color: #70348e;
}

input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}

button:focus {
	outline: none;
}
#add{
position: absolute;
bottom: 34px;
left: 29px;
display:flex;
font-weight: bold;
font-size: 15px;
opacity: 0;
justify-content: center;

}
#add p{

    align-self: center;
}

#input_painting:hover>#add{
opacity: 1;
padding:7px;
width: 150px;
height:150px;
background: rgba(244, 244, 243, 0.8);
border-radius: 50%;
display: flex;
}
</style>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<form action="/exhibitRegPage" method="POST" name="exhibit_frm"
				enctype="multipart/form-data" accept-charset="UTF-8">
				<!-- 어느 전시회인지를  POST로 보내주기 위해 i_show정보를 담아놓는다. -->
				<input type="hidden" name="i_show" id="i_show" value="${data}">
				<input type="hidden" name="list_cnt" id="list_cnt" value="">
				<input type="hidden" name="i_work" id="i_work"
					value="${workData.i_work}"> <input type="hidden"
					name="list_cnt" id="list_cnt" value="">
				<div id="exhibit_list">
					<table>
						<tr>
							<td rowspan="2">
								<button id="min_work_btn_\${listLastIndex}"
									style="visibility: hidden">－</button>
							</td>
							<td rowspan="2">
								<div id="input_painting" onclick="document.all.file.click()"
									style="background-image:url('${workPath}${workData.work_image}')">
									<input type="file" name="file" id="file" style="display: none"
										accept="image/*" onchange="updatePainting()">
									<div id="add">
										<p>이미지 등록/수정</p>
									</div>
									<input id="work_image" name="work_image" type="hidden" value="">
								</div>
							</td>
							<td>제목</td>
							<td><input type="text" name="input_title" id="input_title"
								value="${workData.work_title}"></td>
						</tr>
						<tr>
							<td>작품설명</td>
							<td><textarea name="input_comment" id="input_comment">${workData.work_ctnt}</textarea></td>
						</tr>
					</table>
				</div>
			</form>
			<button id="exhibit_work_btn" onclick="submitExihibit()">수정하기</button>
		</div>

	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
	<script>
     
       
        /*현재 까지의 입력사항을 검사하는 함수*/
        function checkInput() {
        
            	
            		var work_title = document.getElementById(`input_title`).value;
                    var work_ctnt = document.getElementById(`input_comment`).value;
                    var work_image = document.getElementById(`work_image`).value;
                   
            		//제목, 작품설명, 그림선택 등의 길이(공백미포함)가 0이라면
    				if(work_title.replace(/\s| /gi, "").length == 0 || 
    						work_ctnt.replace(/\s| /gi, "").length == 0){
                        return false;
                    }
            	
            
            return true;
        }
		
        /*이미지 선택시 이미지 저장과 이미지 변경*/
        function updatePainting() {
           
        	console.log("이미지 변경 함수 실행")
        	
        	/*파일 선택시 미리보기 기능 구현부*/
			const file = document.getElementById('file').files[0];
			if(file){
	            const reader = new FileReader();
	            reader.readAsDataURL(file);
	            console.log(reader.result);
	            reader.onload = () => {
	            	document.getElementById('input_painting').style.backgroundImage = `url(\${reader.result})`;
	            }
	        }
         
           
            var work_image = document.getElementById('file').files[0].name;
           
            document.getElementById(`work_image`).value = work_image;
            console.log( document.getElementById(`work_image`).value);
            
        }
		
		
        /*출품하기 버튼 눌렀을때 페이지 이동하는 페이지*/
        function submitExihibit(){
        	
			if(checkInput()){
				
               	alert('출품완료'); 
               	document.exhibit_frm.submit();
           	}else {
                alert('작성이 완전치 않은 테이블이 존재합니다.\n작성 혹은 삭제 해주세요.');
           	}
        }
			
    </script>
</body>

</html>