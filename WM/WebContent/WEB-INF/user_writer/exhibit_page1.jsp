<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
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
	position: absolute;
	top: 0;
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
</style>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<form action="/exhibit_page1" method="POST" name="exhibit_frm"
				enctype="multipart/form-data" accept-charset="UTF-8">
				<!-- 어느 전시회인지를  POST로 보내주기 위해 i_show정보를 담아놓는다. -->
				<input type="hidden" name="i_show" id="i_show"
					value="${data.i_show}"> <input type="hidden"
					name="list_cnt" id="list_cnt" value="">
				<div id="exhibit_list"></div>
				<button id="add_work_btn" onclick='insertWorkInfo();return false;'>+</button>
			</form>
			<button id="exhibit_work_btn" onclick="submitExihibit()">출품하기</button>
		</div>
	</div>

 <jsp:include page="../../footer.jsp"></jsp:include>
	<script>
		//등록 할수 있는 작품의 개수
		var max_workCnt = 25 - ${workCnt};
	
        /*작품정보를 받아와 콘텐츠영역안에 테이블을 생성하여 보여주는 함수*/
        function displayWorkInfo() {
           
            var exhibitList = document.getElementById('exhibit_list');
            exhibitList.innerHTML = "";
           
                var table = document.createElement('table');
                table.setAttribute('id', `idx_0`);
                table.innerHTML = `
                <tr>
                <td rowspan="2">
                <button id="min_work_btn_0" onclick="deleteWorkInfo(0); return false;" style="visibility:hidden">－</button>
                </td>
                <td rowspan="2">
                <div id="input_painting_0" onclick="document.all.file0.click()">
                <input type="file" name="file0" id="file0" style="display:none" accept="image/*" onchange="updatePainting(0)">
                <span>1. 이미지 등록/수정</span>
                <input id="work_image_idx_0" name="work_image_idx_0" type="hidden" value="">
                </div>
                </td>
                <td>제목</td>
                <td>
                <input type="text" name="input_title_0" id="input_title_0" value="" required autofocus></td>
                </tr>
                <tr>
                <td>작품설명</td>
                <td><textarea name="input_comment_0" id="input_comment_0"></textarea></td>
                </tr>`;
                exhibitList.append(table);
        }
   
        /*현재 까지의 입력사항을 검사하는 함수*/
        function checkInput() {
            var exhibitList = document.getElementById('exhibit_list');
           var listLastIndex = exhibitList.childElementCount;
            for (var i = 0; i < listLastIndex; i++) {
               
                  var work_title = document.getElementById(`input_title_\${i}`).value;
                    var work_ctnt = document.getElementById(`input_comment_\${i}`).value;
                    var work_image = document.getElementById(`work_image_idx_\${i}`).value;
                   
                  //제목, 작품설명, 그림선택 등의 길이(공백미포함)가 0이라면
                if(work_title.replace(/\s| /gi, "").length == 0 || 
                      work_ctnt.replace(/\s| /gi, "").length == 0 || 
                      work_image.replace(/\s| /gi, "").length == 0){
                        return false;
                    }
                  if(work_title.length > 50){
                	  alert('제목은 50자 이하로 작성해 주십시오.');
                	  return false;
                	  
                  }
                  if(work_ctnt.length > 1000) {
                	  alert('내용은 1000자 이하로 작성해 주십시오.');
                	  return false;
                  }
               
            }
            return true;
        }
      
        /*작품 목록을 지우는 함수*/
        function deleteWorkInfo(idx) {
         
               /*지울 작품의 타이틀을 가져옴*/
                var work_title = document.getElementById(`input_title_\${idx}`).value;
                var exhibitList = document.getElementById('exhibit_list');
                var listLastIndex = exhibitList.childElementCount;
               
                if(confirm(`제목: \${work_title} \n삭제하시겠습니까?`))
                {
                   
                      document.getElementById("idx_" + idx).remove();
                       
                         idx++;
                         //삭제한 idx보다 큰 idx들의 수를 1 줄여준다(줄을 맞춘다.)
                        for(var i=idx; i<listLastIndex; i++) {
                            var table = document.getElementById(`idx_\${i}`);
                             table.setAttribute('id', `idx_\${i - 1}`);
                             var button = document.getElementById(`min_work_btn_\${i}`);
                             button.setAttribute('id', `min_work_btn_\${i-1}`);
                             button.setAttribute('onclick', `deleteWorkInfo(\${i-1})`);
                             var div = document.getElementById(`input_painting_\${i}`);
                             div.setAttribute('id', `input_painting_\${i-1}`);
                             div.setAttribute('onclick', `document.all.file\${i-1}.click()`);
                             var input_img = document.getElementById(`work_image_idx_\${i}`);
                             input_img.setAttribute('id', `work_image_idx_\${i-1}`);
                             input_img.setAttribute('name', `work_image_idx_\${i-1}`);
                             var file = document.getElementById(`file\${i}`);
                             file.setAttribute('id', `file\${i-1}`);
                             file.setAttribute('name', `file\${i-1}`);
                             file.setAttribute('onchange', `updatePainting(\${i-1})`);
                             var input = document.getElementById(`input_title_\${i}`);
                             input.setAttribute('id', `input_title_\${i-1}`);
                             input.setAttribute('name', `input_title_\${i-1}`);
                             var textarea =  document.getElementById(`input_comment_\${i}`);
                             textarea.setAttribute('id', `input_comment_\${i-1}`);
                             textarea.setAttribute('name', `input_comment_\${i-1}`);
                   }

                }
              
        }
      
      
        /*추가버튼을 눌렀을시 공백의 입력란을 만들어주는 함수*/
        function insertWorkInfo() { 
           
            var exhibitList = document.getElementById('exhibit_list');
            var listLastIndex = exhibitList.childElementCount;
            console.log(listLastIndex);
            if(listLastIndex >= max_workCnt) {
               alert('25개 까지만 등록 가능합니다.');
               return;
            }
            
          
                var table = document.createElement('table');
                table.setAttribute('id', `idx_\${listLastIndex}`);
                table.innerHTML = `
                <tr>
                <td rowspan="2">
                <button id="min_work_btn_\${listLastIndex}" onclick="deleteWorkInfo(\${listLastIndex}); return false;">－</button>
                </td>
                <td rowspan="2">
                <div id="input_painting_\${listLastIndex}" onclick="document.all.file\${listLastIndex}.click()" >
                <input type="file" name="file\${listLastIndex}" id="file\${listLastIndex}" style="display:none" accept="image/*" onchange="updatePainting(\${listLastIndex})">
                <input type="hidden" name="input_image_\${listLastIndex}" id="input_image_\${listLastIndex}">
                <span>\${listLastIndex+1}. 이미지 등록/수정</span>
                <input id="work_image_idx_\${listLastIndex}" name="work_image_idx_\${listLastIndex}" type="hidden" value="">
                </div>
                </td>
                <td>제목</td>
                <td>
                <input type="text" name="input_title_\${listLastIndex}" id="input_title_\${listLastIndex}"></td>
                </tr>
                <tr>
                <td>작품설명</td>
                <td><textarea name="input_comment_\${listLastIndex}" id="input_comment_\${listLastIndex}"></textarea></td>
                </tr>`;
                exhibitList.append(table);
            
        }
      
        /*이미지 선택시 이미지 저장과 이미지 변경*/
        function updatePainting(idx) {
           
           console.log("이미지 변경 함수 실행")
           
           /*파일 선택시 미리보기 기능 구현부*/
         const file = document.getElementById('file' + idx).files[0];
         if(file){
               const reader = new FileReader();
               reader.readAsDataURL(file);
               console.log(reader.result);
               reader.onload = () => {
                  document.getElementById('input_painting_' + idx).style.backgroundImage = `url(\${reader.result})`;
               }
           }
         
           
            var work_image = document.getElementById('file' + idx).files[0].name;
           
            document.getElementById(`work_image_idx_\${idx}`).value = work_image;
            console.log( document.getElementById(`work_image_idx_\${idx}`).value);
            
        }
      
      
        /*출품하기 버튼 눌렀을때 페이지 이동하는 페이지*/
        function submitExihibit(){
           var exhibitList = document.getElementById('exhibit_list');
            var listLastIndex = exhibitList.childElementCount;
         if(checkInput()){
            //총 몇 개의 작품이 올라갔는지 보내주기 위해 list_cnt에 넣어준다.
            document.getElementById('list_cnt').value = listLastIndex;
            
                  alert('출품완료'); 
                  document.exhibit_frm.submit();
              }else {
                alert('작성이 완전치 않은 테이블이 존재합니다.\n작성 혹은 삭제 해주세요.');
              }
        }
        //엔터 적용 안되게
        document.addEventListener('keydown', function(event) {
        	  if (event.keyCode === 13) {
        	    event.preventDefault();
        	  };
        	}, true); 
        
        displayWorkInfo();
    </script>
</body>

</html>