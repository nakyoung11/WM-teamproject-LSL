<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WM �� ���ð�</title>
<style>
#container {
	display: flex;
	width: 1350px;
	height: 1356px;
	margin: 5px auto;
	justify-content: center;
}

.main {
	display: flex;
	justify-content: center;
	align-items: center;
}

.poster {
	flex-direction: column;
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
	display: flex;
	width: 1150px;
	flex-direction: column;
	margin-left: 140px;
}

.exhibition ul {
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
		<jsp:include page="../../header.jsp"></jsp:include>
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