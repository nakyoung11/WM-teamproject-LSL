<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이용안내</title>
<style>
#container #contents p{margin-bottom:10px;margin-top: 10px}
#container #contents p:last-child {
	margin-bottom: 100px;
}
#container #contents h3{font-size: 30px}

#container #contents h3:last-child {
	margin-top: 70px;
}
.bold{font-weight: bold; font-size: larger;}

.video{margin-top: 20px}

</style>


</head>

<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<h3>1.작품등록하기(회원만 가능)</h3>
			
			<video src='resource/main/menual/전시회 등록.mp4' class="video" width='100%' autoplay
				loop muted> 해당 브라우저는 video 태그를 지원하지 않습니다.
			</video>
			<p>1. 페이지 하단의 <span class="bold">"전시회 열기"</span> 버튼을 클릭</p>
			<p>2. 전시회 주제(제목)과 전시설명 전시회 포스터를 등록 한 후 <span class="bold">"작품추가"</span> 버튼을 클릭</p>
			<p>3. 페이지 하단의 <span class="bold">"전시회 열기"</span> 버튼을 클릭</p>
			<p>
				4. 전시회 안에 들어갈 작품의 <span class="bold">"제목", "작품설명"</span>을 작성후
				<span class="bold"> "이미지 등록/수정"</span> 버튼을 클릭하여<br>
				&nbsp&nbsp&nbsp&nbsp작품 이미지를 등록(작품 추가 시 경우 하단의 <span class="bold">'+'</span> 버튼을 클릭)
			</p>
			<p>5. 작품 등록 완료 후 <span class="bold">"출품하기"</span> 버튼 클릭</p>

			<h3 style="margin-top: 70px;">2.전시회 관람</h3>
			<video src='resource/main/menual/전시회 관람.mp4'  class="video" width='100%' autoplay
				loop muted> 해당 브라우저는 video 태그를 지원하지 않습니다.
			</video>
			<p>1. 홈페이지 메인 화면에서 상단의 <span class="bold">"전시둘러보기"</span>탭을 클릭</p>
			<p>2. 관람을 원하는 전시회의 포스터를 클릭</p>
			<p>3. 티켓모양의 전시회 포스터를 클릭</p>
		</div>
	</div>
		<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>