<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
	margin-bottom: 100px;
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
	justify-content: center;
	align-content: center;
	height: 100%;

}
/*----------------------- 추가 사항 ----------------- */
input {
	background: none;
	border: none;
	cursor: pointer;
	font-size: 16px;
}

form {
	align-self: center;
    width: 100%;
    display: flex;
    flex-flow: column;
}



#input_title_div input {
 	
	border-bottom: 1px solid gray;
	width: 100%;
	margin-top: 20px;
	margin-bottom: 30px;
	padding: 7px
}

#input_image {
	cursor:pointer;
	width: 300px;
	height: 300px;
	position:relative;
	background-image: url("/resource/exhibit/imgbox.JPG");
	 background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    border-radius: 30px
	
}
#input_imge_div{margin-right: 20px;}
#input_image #add{
position: absolute;
bottom: 73px;
left: 59px;
display:flex;
font-weight: bold;
font-size: 15px;
opacity: 0;
justify-content: center;

}

#submit_button_div{
    margin-top:100px;
    display: flex;
    justify-content: center;
    align-self: center;
    width:160px;
    height:60px;
    background: #92809B;
    border-radius: 10px;
    }
#submit_button_div:hover{
 background: #8C60A1;
}   
    
#submit_button_div input{color:white}

#add p{

    align-self: center;
}

#input_image:hover>#add{
opacity: 1;
padding:7px;
width: 150px;
height:150px;
background: rgba(244, 244, 243, 0.8);
border-radius: 50%
}


#show_ctnt {
	width: 409px;
    height: 300px;
    background: none;
    border: none;
    padding: 30px 0 20px 0px;
}

form h4{padding-left:10px; margin-bottom: 10px }


#input_img_ctnt_div {
    display: flex;
    flex-flow: row nowrap;
    justify-content: start;
}
</style>
</head>

<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<form action="/exhibit_page0" method="POST" name="exhibit_frm"
				enctype="multipart/form-data">
				<div id="input_title_div">
					<h4>전시회 주제(제목)</h4>
					<input type="text" id="show_title" name="show_title" required autofocus>
				</div>
				<div id="input_img_ctnt_div">
					<div id="input_imge_div">
						<h4>대표이미지</h4>
						<div id="input_image" onclick="document.all.file.click()">
							<input type="file" name="file" id="file" style="display: none"
								accept="image/*" onchange="updatePainting()">
								<div id="add">
								<p>이미지	등록/수정</p>
								</div>
								<input id="show_image" name="show_image" type="hidden"
								value="">
								</div>
					</div>
					<div id="input_ctnt_div">
						<h4>전시설명</h4>
						<textarea id="show_ctnt" name="show_ctnt"> </textarea>
					</div>
				</div>
				<div id="submit_button_div">
					<input type="button" onclick="submitExihibit()" value="작품추가">
				</div>
			</form>

		</div>
	</div>
	<footer id="footer">
		<ul>
			<li>jumoney15@naver.com: 아이디어 제공, 3D</li>
			<li>dlehdud1653@kakao.com: 로그인 및 게시판</li>
			<li>nakihome@naver.com: 디자인</li>
		</ul>

	</footer>
	<script type="text/javascript">
	
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
            	document.getElementById('input_image').style.backgroundImage = `url(\${reader.result})`;
            }
        }
     
       
        var work_image = document.getElementById('file').files[0].name;
       
        document.getElementById(`show_image`).value = work_image;
        console.log( document.getElementById(`show_image`).value);
        
    }
    
    /*현재 까지의 입력사항을 검사하는 함수*/
    function checkInput() {
            var show_title = document.getElementById(`show_title`).value;
             var show_ctnt = document.getElementById(`show_ctnt`).value;
                var show_image = document.getElementById(`show_image`).value;
               
              //제목, 작품설명, 그림선택 등의 길이(공백미포함)가 0이라면
            if(show_title.replace(/\s| /gi, "").length == 0 || 
                 show_ctnt.replace(/\s| /gi, "").length == 0 || 
                  show_image.replace(/\s| /gi, "").length == 0){
                    return false;
             }
           
        
        return true;
    }
    
    /*출품하기 버튼 눌렀을때 페이지 이동하는 페이지*/
    function submitExihibit(){
    	if(checkInput())
    		{
    		  document.exhibit_frm.submit();
    		}else {
    			alert('작성이 완료되지 않았습니다.')
    		}
       
       
    }
    
    </script>
</body>
</html>