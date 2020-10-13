<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
#input_iamge_div {
	float: left;
}

#input_ctnt_div {
	float: left;
}

#submit_button_div {
	clear: both;
}

#input_painting_0 {
	height: 200px;
}
</style>
</head>
<body>
	<form action="/exhibit_page0" method="POST" name="exhibit_frm"
		enctype="multipart/form-data">
		<div id="input_title_div">
			<h3>전시회 계획 및 주제</h3>
			<input type="text" id="show_title" name="show_title">
		</div>
		<div id="input_iamge&ctnt_div">
			<div id="input_iamge_div">
				<h3>대표이미지</h3>
				<div id="input_image" onclick="document.all.file.click()">
					<input type="file" name="file" id="file" style="display: none"
						accept="image/*" onchange="updatePainting()"> <span>이미지
						등록/수정</span> <input id="show_image" name="show_image" type="hidden"
						value="">
				</div>
			</div>
			<div id="input_ctnt_div">
				<h3>전시설명</h3>
				<textarea id="show_ctnt" name="show_ctnt" cols="30" rows="10">
                </textarea>
			</div>
		</div>
		<div id="submit_button_div">
			<input type="button" onclick="submitExihibit()" value="전시회 추가하기">
	</form>
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