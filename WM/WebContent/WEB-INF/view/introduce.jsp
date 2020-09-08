<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WM �� ���ð�</title>
<style>
body {
	background: #FFFCFE
}

#container {
	display: flex;
	width: 1350px;
	height: 1356px;
	margin: 5px auto;
	justify-content: center;
}

#header {
	position: fixed;
	width: 1440px;
	height: 215px;
	height: 248px;
	left: calc(50% - 1440px/ 2);
	margin-bottom: 50px;
	top: 0px;
	background: #FFFCFE;
	z-index: 9999;
}

#contents {
	position: relative;
	width: 1398px;
	margin-top: 260px;
}

#footer {
	position: absolute;
	width: 1440px;
	height: 78px;
	left: 0px;
	top: 1740px;
}

#logo {
	width: 320px;
	height: 228px;
}

#login {
	position: absolute;
	width: 88.15px;
	height: 47px;
	left: 1221px;
	top: 43px;
}

.menu ul {
	position: absolute;
	width: 837px;
	height: 51px;
	left: 400px;
	top: 134px;
	list-style: none;
}

.menu li {
	float: left;
	margin-left: 60px;
	font-size: 1.3em;
	font-weight: bold;
	margin-bottom: 1%;
	cursor: pointer;
}

hr {
	clear: both;
	float: right;
	width: 940px;
	margin-left: 10%;
	border: 1px solid rgba(39, 47, 89, 0.29);
	box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.1);
}

.main {
	display: flex;
	justify-content: center;
	align-items:center;
}
.poster{	flex-direction: column;
	margin-left: 50px;
}
#poster {
	width: 625px;
	height: 299px;
	margin-bottom: 30px
}

.main #title {
	display: block;
}

.main h3 {
	display: block;
}

.introduction {
	flex-direction: column;
	margin-left: 50px;
	width: 430px
}
.exhibition {
	display:flex;
	width: 1150px;
	flex-direction: column;
	margin-left: 140px;
}
.exhibition ul{
	display: flex;
	flex-wrap: wrap;
	list-style: none;
}
.exhibition ul li {
flex: 1 1 30%;
margin-bottom: 1em


}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<nav>
				<a href="/main"><img src="/image/logo.png" id="logo"></a> <a
					href="#"><img src="/image/login.png" id="login"></a>
				<div class="menu">
					<ul>
						<li id="m1">��������</li>
						<li id="m2">����Ұ�</li>
						<li id="m3">Ŀ�´�Ƽ</li>
						<li id="m4">��������</li>
						<li id="m5">����������</li>
						<hr>
					</ul>
				</div>
			</nav>
		</div>
		<div id="contents">
		
			<div class="main">
				<div class="poster">
					<h2 id="title">�ݰ��� Ư����</h2>
					<img src="image/main.png" id="poster">
				</div>
				<div class="introduction">
					<h3>���üҰ�</h3>
					<div id="introduction">
						<p>������ȭ�����ڹ�ȸ���� �������������� ��Ÿ �ʿ��� ������ ������ ���Ѵ�. ������ ���ּ�������������ġ�� �߸���
							�� ������ �������� ������ ���ϴ� �ٿ� ���Ͽ� ����ȴ�. ��� ������ ����� ������ ������. ��1���� ���Ӱ��Ǵ�
							��ȸ�����ǿ� 3���� 1 �̻��� ���ǿ� ���Ͽ� ��ȸ�����ǿ� ���ݼ��� ������ �־�� �Ѵ�.</p>
					</div>
				</div>
			</div>

			<div class="exhibition">
				<h3>������ǰ �� �����۰�</h3>

				<div id="exhibition_items">
					<ul>
						<li>������� �����ǰų� ���� ���Ͽ� ������...</li>
						<li>������Ǽ��� ������ � ��Ÿ �ʿ��� ��...</li>
						<li>������� ������ �����̸�, �ܱ��� ���Ͽ� ...</li>
						<li>ȯ����� ����� ��翡 ���Ͽ��� ������ ...</li>
						<li>�������� ü�� �Ǵ� ������ ���� ������ ��...</li>
						<li>���ſ� ������ǥ�� ������ ���� �� ���翡 ...</li>
						<li>������ ���� ��ȣ�� ���Ͽ� ����Ͽ��� ...</li>
						<li>��� ������ ����� ������ ���� ������ ��...</li>
						<li>�� ����� �������� �ӱ� �Ǵ� �������ѿ� ...</li>
						<li>������� �ӱ�� 6������ �ϸ�, ������ ��...</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>