<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>


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
	margin-bottom: 600px;
	justify-content: center;
	align-content: center;
	font-weight: 700;
	flex: 1;
}

#contents {
	display: flex;
	flex-flow: column;
	flex: 1;
	height: 100%;
}

.poster {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.poster img {
	margin: 10px auto;
	width: 900px;
	height: 1000px;
}

#people {
	position: absolute;
	top: 255px;
	left: 212px;
	font-size: 163px;
	color: rgba(243, 243, 238, 0.50);
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 500;
}

.sub_manu {
	flex-flow: column;
	justify-content: center;
	align-items: center;
	align-content: center;
	margin-top: 30px;
	width: 1200px;
	border-top: 1.5px solid rgba(55, 53, 53, 0.83);
	height: 300px;
}

.sub_manu ul {
	display: flex;
	width: 1200px;
	justify-content: center;
	align-content: center;
	margin-top: 30px;
	margin-bottom: 5px;
}

.sub_manu ul li {
	margin: 15px 130px;
	color: rgba(71, 60, 21, 1);
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 700;
	font-size: 20px
}

.listClass {
	align-items: center;
	align-self: center;
	width: 100%;
}

.smallPoster {
	width: 150px;
	height: 150px;
	margin: 0 40px 0 40px;
	border-radius: 20px;
}

.span {
	font-size: 18px;
}

.crown {
	display: inline-block;
	width: 150px;
	text-align: center;
	margin: 10px 40px 0 40px;
}

legend {
	font-size: 1.5em;
}

.crown1 {
	color: #f1c40f;
}

.crown2 {
	color: #7f8c8d;
}

.crown3 {
	color: #cd6133;
}

.showTitle {
	align-self: center;
	text-align: center;
}

.fav {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px
}

.btn, .btn_2 {
	position: relative;
	text-align: center;

}

.btn .btn1 {
	overflow: hidden;
	position: relative;
	display: inline-block;
	vertical-align: top;
	width: 200px;
	height: 200px;
	line-height: 200px;

	transition: all 0.5s;
	border-radius: 50%;
}

.btn .btn1:hover {
	color: #fff;
}

.btn .btn1:before {
	content: "";
	z-index: -1;
	position: absolute;
	background: #8576B8;
	transition: all 1s;
}

.btn .btn1:before {
	left: 0;
	top: 0;
	width: 100%;
	height: 0;
	border-bottom-left-radius: 50%;
	border-bottom-right-radius: 50%;
}

.btn .btn1:hover:before {
	height: 200%;
}

.btn_2 {
	position: relative;
	text-align: center;

}

.btn_2 .btn2 {
		overflow: hidden;
	position: relative;
	display: inline-block;
	vertical-align: top;
	width: 200px;
	height: 200px;
	line-height: 200px;
	
	transition: all 0.5s;
	border-radius: 50%;
}

.btn_2 .btn2:hover {
	color: #fff;
}

.btn_2 .btn2:before {
	content: "";
	z-index: -1;
	position: absolute;
	background: #8576B8;
	transition: all 1s;
}

.btn_2 .btn2:before {
	left: 0;
	bottom: 0;
	width: 100%;
	height: 0;
	border-top-left-radius: 50%;
	border-top-right-radius: 50%;
}

.btn_2 .btn2:hover:before {
	height: 200%;
}
</style>





</head>

<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="container">
		<div id="contents">
			<div class="poster">
				<a href="/showlist"><img src="resource/main/images/poster.JPG"
					id="main"></a> <span id="people">${userCnt}명</span>
			</div>

			<div class="sub_manu">
				<ul>
					<li><div class="btn">
							<div class="btn1">
								<a href="/exhibit_page0">전시회 열기</a>
							</div>
						</div></li>
					<li><div class="btn_2">
							<div class="btn2">
								<a href="/exhibit_page2">나의 전시관리</a>
							</div>
						</div></li>
				</ul>
				<div class="listClass">
					<fieldset>
						<legend>인기 전시회</legend>
						<div class="crown">
							<span class="material-icons crown1" style="font-size: 60px;">
								emoji_events </span>
						</div>
						<div class="crown">
							<span class="material-icons crown2" style="font-size: 50px;">
								emoji_events </span>
						</div>
						<div class="crown">
							<span class="material-icons crown3" style="font-size: 40px;">
								emoji_events </span>
						</div>
						<c:set var="i" value="0" />
						<c:set var="j" value="5" />
						<table>
							<c:forEach items="${list}" var="item">
								<c:if test="${i%j == 0 }">
									<tr>
								</c:if>
								<td class="posterName" onclick="moveDetail('${i}')"
									style="cursor: pointer;"><input type="hidden"
									value="${item.i_show}" id="idx_${i}"> <img
									src="${posterPath}${item.i_user}/${item.show_poster}"
									class="smallPoster">
									<div class="showTitle">
										<p>${item.show_title}</p>
									</div>
									<div class="fav">
										<p>
											<span class="material-icons" style="color: #EB6E5B">favorite</span>
											<span class="span">${item.likeCnt}</span> <span
												class="material-icons">comment</span> <span class="span">${item.cmtCnt}</span>
										</p>
									</div></td>
								<c:if test="${i%j == j-1 }">
									</tr>
								</c:if>
								<c:set var="i" value="${i+1}" />
							</c:forEach>
						</table>
					</fieldset>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		function moveDetail(i) {
			var i_show = document.getElementById(`idx_\${i}`).value;

			location.href = "/showDetail?i_show=" + i_show;
		}
	</script>
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>

</html>