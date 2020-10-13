<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 등록</title>
</head>
<style>
#headerWrap{flex: 1}

body{padding-top: 250px;}
#container {
    display: flex;
    width: 1000px;
 	margin-bottom:400px;
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
   	align-items: center;
    flex: 1;
	height:100%;

}

.msg {display: flex;
	flex-flow: column;
   	justify-content: center;
   	align-items: center;}
.add{margin-top:100px; display: flex; justify-content: center; align-content: center;
background: #625569; width: 100px; height: 100px; border-radius: 50%}
.add>a{padding-top: 40px; color: #FFFFFC}

/*----------------------- 추가 사항 ----------------- */
</style>


<body>
	<jsp:include page="../../header.jsp"></jsp:include>
   <div id="container">
      <div id="contents">
	      <div class="msg">
	        <p>등록된 작품이 없습니다.</p>   
	        <p class="material-icons" style="margin: 10px;font-size: 80px;">mood_bad</span>  
	      </div> 
	       <div class="add"><a href="/exhibit_page0">작품등록</a></div>
      </div>  

      </div>
   
		<footer id="footer">
		<ul>
			<li>jumoney15@naver.com: 아이디어 제공, 3D</li>
			<li>dlehdud1653@kakao.com: 로그인 및 게시판</li>
			<li>nakihome@naver.com: 디자인</li>
		</ul>

	</footer>
</body>
</html>