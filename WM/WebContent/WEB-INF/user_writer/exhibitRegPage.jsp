<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<work_title>��ǰ ���� ������</work_title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
</head>
<style>
#container {
	width: 100%;
	margin: 0 auto;
	border: 1px solid black;
}
/*----------------------- �߰� ���� ----------------- */
#exhibit_list {
	width: 100%;
	margin: 5% auto;
}

#exhibit_list table {
	border-collapse: separate;
	width: 100%;
	height: 280px;
	margin-bottom: 5%;
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
	background-color: rgb(241, 113, 113);
	color: white;
	font-weight: bold;
	text-align: center;
	font-size: 2em;
	padding-bottom: 10%;
	border-radius: 50%;
	cursor: pointer;
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
}

#exhibit_list table td:nth-child(2) div:hover {
	opacity: 0.8;
	transition-duration: 0.5s;
}

#exhibit_list table td:nth-child(2) div span {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	font-size: 1.5em;
	font-weight: bold;
	color: black;
	opacity: 0%;
}

#exhibit_list table td:nth-child(2) div span:hover {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	font-size: 1.5em;
	font-weight: bold;
	color: black;
	opacity: 100%;
}

#exhibit_list table td:nth-child(3) {
	width: 12%;
	height: 5%;
	text-align: center;
	font-size: 1.2em;
	background-color: #DCD3C0;
	border: 0;
	margin: 0;
	font-weight: bolder;
}

#exhibit_list table td:nth-child(4) {
	position: relative;
	border: 0;
	width: 100%;
	background-color: rgba(235, 230, 230, 0.5);
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
	background-color: rgba(235, 230, 230, 0.5);
}

#exhibit_list table tr:nth-child(2) td:nth-child(1) {
	background-color: rgba(255, 255, 255, 0.37);
	text-align: center;
	font-size: 1.2em;
	font-weight: bold;
}

#exhibit_list table tr:nth-child(2) td:nth-child(2) {
	position: relative;
	background-color: #FAF7F1;
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
	background-color: #FAF7F1;
	font-weight: bolder;
	font-size: 2em;
	border: 0;
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
	<div id="container">
		<div id="contents">
			<div>
				<img src="${imagePath}${data.show_poster}">
				<h1>����ȸ ����: ${data.show_title}</h1>
				<h2>����ȸ ����: ${data.show_ctnt}</h2>
				<h3>����ȸ �Ⱓ: ${data.start_dt} ~ ${data.end_dt}</h3>
			</div>
			<form action="/exhibitRegPage" method="POST" name="exhibit_frm"
				enctype="multipart/form-data" accept-charset="UTF-8">
				<!-- ��� ����ȸ������  POST�� �����ֱ� ���� i_show������ ��Ƴ��´�. -->
				<input type="hidden" name="i_show" id="i_show"
					value="${data.i_show}"> <input type="hidden"
					name="list_cnt" id="list_cnt" value="">
				<input type="hidden" name="i_work" id="i_work"
					value="${workData.i_work}"> <input type="hidden"
					name="list_cnt" id="list_cnt" value="">
				<div id="exhibit_list">
					<table>
						<tr>
						  <td rowspan="2">
                			<button id="min_work_btn_\${listLastIndex}" style="visibility:hidden">��</button>
                			</td>
							<td rowspan="2">
								<div id="input_painting" onclick="document.all.file.click()" style="background-image:url('${workPath}${workData.work_image}')">
									<input type="file" name="file" id="file"
										style="display: none" accept="image/*"
										onchange="updatePainting()"> <span>�̹��� ���/����</span> <input
										id="work_image" name="work_image" type="hidden"
										value="">
								</div>
							</td>
							<td>����</td>
							<td><input type="text" name="input_title"
								id="input_title" value="${workData.work_title}"></td>
						</tr>
						<tr>
							<td>��ǰ����</td>
							<td><textarea name="input_comment" id="input_comment">${workData.work_ctnt}</textarea></td>
						</tr>
					</table>
				</div>
			</form>
			<button id="exhibit_work_btn" onclick="submitExihibit()">�����ϱ�</button>
		</div>
		<div id="footer">
			<h3>Ǫ�� ����</h3>
		</div>
	</div>
	<script>
     
       
        /*���� ������ �Է»����� �˻��ϴ� �Լ�*/
        function checkInput() {
        
            	
            		var work_title = document.getElementById(`input_title`).value;
                    var work_ctnt = document.getElementById(`input_comment`).value;
                    var work_image = document.getElementById(`work_image`).value;
                   
            		//����, ��ǰ����, �׸����� ���� ����(���������)�� 0�̶��
    				if(work_title.replace(/\s| /gi, "").length == 0 || 
    						work_ctnt.replace(/\s| /gi, "").length == 0){
                        return false;
                    }
            	
            
            return true;
        }
		
        /*�̹��� ���ý� �̹��� ����� �̹��� ����*/
        function updatePainting() {
           
        	console.log("�̹��� ���� �Լ� ����")
        	
        	/*���� ���ý� �̸����� ��� ������*/
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
		
		
        /*��ǰ�ϱ� ��ư �������� ������ �̵��ϴ� ������*/
        function submitExihibit(){
        	
			if(checkInput()){
				
               	alert('��ǰ�Ϸ�'); 
               	document.exhibit_frm.submit();
           	}else {
                alert('�ۼ��� ����ġ ���� ���̺��� �����մϴ�.\n�ۼ� Ȥ�� ���� ���ּ���.');
           	}
        }
			
    </script>
</body>

</html>