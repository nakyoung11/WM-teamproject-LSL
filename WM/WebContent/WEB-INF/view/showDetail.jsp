<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세페이지</title>
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
	margin-bottom: 250px;
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

#modal {
	text-align: center;
	color: white;
	font-size: 30px;
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}

#modal p {
	margin-top: 300px;
}
/*----------------------- 추가 사항 ----------------- */
.main {
	display: flex;
	flex-flow: column;
	justify-content: center;
	align-self: center;
	width: 85%;
}

#gallery {
	width: 100%;
	height: 350px;
	background: #8E9C9E;
	position: absolute;
	top: 0;
	left: 0;
	margin-right: 30px;
	/* border-radius: 20px; */
	justify-content: center;
	opacity: 0;
	transition: all ease 0.7s;
	display: flex;
	align-content: center;
	cursor: pointer;
}

#gallery:hover {
	opacity: 0.9
}

#gallery>p {
	align-self: center;
	font-size: 30px;
	font-weight: bolder;
}

.poster {
	flex-direction: column;
	position: relative;
}

#ex {
	margin-top: 30px;
	position: relative;
	display: flex;
	align-self: center;
	flex-flow: row nowrap;
	border: 1px solid black;
	width: 100%;
	/* height: 329px;*/
}

#barcode {
	width: 131px;
	align-self: center;
	/* height: 131px; */
	/* align-items: center; */
	transform: rotate(90deg);
}

#barcode img {
	width: 100%;
	height: 105px;
	align-self: flex-end;
	/* margin-right: 20px; */
}

.poster #poster {
	width: 350px;
	height: 350px;
	/* margin-bottom: 30px; */
	border-radius: 0 20px 20px 0;
	cursor: pointer;
	/* margin-top: 30px;*/
}

.main #title {
	display: block;
}

.main h3 {
	display: block;
}

.introduction {
	margin-top: 64px;
	display: flex;
}

.user_por {
	display: flex;
	flex-flow: column;
	justify-content: center;
	align-items: center;
}

#hr {
	border: 1px dashed black;
}

.por_img {
	width: 300px;
	margin-bottom: 15px;
	height: 300px;
}

.por_img img {
	width: 100%;
	height: 100%;
	border-radius: 15px;
}

.exhibition {
	display: flex;
	flex-direction: column;
	margin-left: 50px;;
}

.exhibition ul {
	margin-top: 15px;
	display: flex;
	flex-wrap: wrap;
	list-style: none;
}

.exhibition ul li {
	flex: 1 30%;
	/* width: 100px; */
	margin-bottom: 1em;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.introduction .profile_img {
	width: 250px;
	height: 250px;
	border-radius: 50%;
	margin-bottom: 10px;
}

#introduction {
	margin-left: 30px;
	margin-top: 20px;
	flex: 1;
}

#introduction>p {
	font-weight: bold;
	font-size: 17px
}
</style>
</head>

<body style="padding-top: 230px;">
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="modal">
		<p>전시회 창을 닫아주세요.</p>
	</div>

	<div id="container">
		<div id="contents">
			<div class="main">
				<div class="poster">
					<h2 id="title">전시 제목: ${showData.show_title}</h2>
					<div id="ex">
						<div id="gallery" onclick="move3dGallay(${showData.i_show})">
							<p>3D전시회관람</p>

						</div>
						<img src="${posterPath}${showData.show_poster}" id="poster">
						<div id="introduction">
							<p>전시회 설명</p>
							<p>${showData.show_ctnt}</p>
						</div>
						<div id="hr"></div>
						<div id=barcode>
							<img src="resource/main/images/pngwing.com.png">
						</div>
					</div>


				</div>

				<div class="introduction">
					<div class="user_por">
						<div class="por_img">
							<img id="profile_img" src="${profilePath}${userData.profile_img}">
						</div>
						<h3>작가: ${userData.nickname}</h3>

					</div>

					<div class="exhibition">

						<h3>작품목록</h3>
						<div id="exhibition_items">
							<ul>
								<c:set var="i" value="1" />
								<c:forEach items="${workList}" var="item">
									<li>${i}.${item.work_title}</li>
									<c:set var="i" value="${i+1}" />
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>

	<script type="text/javascript">
   	
	
	
	function move3dGallay(i_show) {
   		//모니터의 크기를 구한다.
   		var screenWidth = screen.availWidth*4/5;
   		var screenHeight = screen.availHeight*7/10;
   		var left = screenWidth*1/10
   		var top = screenHeight*3/20
   		
   		var uri = `gallay/gallay3d?i_show=\${i_show}`;
   		var popupName = '3D전시관';
   		var options = `height=\${screenHeight}, width=\${screenWidth}, top=\${top}, left=\${left}, location=no, scrollbars=no, resizable=no, toolbars=no, menubar=no`;
   	
   		//location.href = "/gallay/gallay3d?i_show=" + i_show;
   		modal.style.display = "block";
   		window.open(uri,popupName ,options)
   		
   		openDialog(uri, popupName, options, function(win) {
   			modal.style.display = "none";
		})

   	}
	
	//1초마다 오픈된 윈도우창의 상태를 받아옴
	var openDialog = function(uri, name, options, closeCallback) {
	    var win = window.open(uri, name, options);
	    var interval = window.setInterval(function() {
	        try {
	        	//만약 오픈된 윈도위 창이 없거나 closed되었다면 콜백함수를 실행
	            if (win == null || win.closed) {
	                window.clearInterval(interval);
	                closeCallback(win);
	            }
	        }
	        catch (e) {
	        }
	    }, 1000);
	    return win;
	};
	
	
	
	

   	
   	
   	
   	
   	
/*     var gallery = document.getElementById('gallery');
    var modal = document.getElementById('modal');
    gallery.onclick = function() {
        modal.style.display = "block";
    } */
   </script>
</body>
</html>