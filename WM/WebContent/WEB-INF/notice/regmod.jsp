<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록/수정</title>
</head>
<body>
<div>${list == null ? '글등록' : '글수정'}</div>
	<form action="/notice/regmod" method="post">
			<input type="hidden" name="i_notice" value="${list.i_notice}">
			<div>제목 : <input type="text" name="title" value="${list.title}"> </div>
			<div>내용 : <textarea name="ctnt">${list.ctnt}</textarea></div>
			<div><input type="submit" value="${list == null ? '글등록' : '글수정'}"></div>
		</form>
</body>
</html>