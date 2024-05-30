<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px 0;
	text-align: center;
}

section {
	padding: 20px;
	background-color: #fff;
	margin: 10px;
}

footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px 0;
}
</style>
</head>
<body>
	<header>
		<h1>홈페이지</h1>
	</header>
	<section>
		<h2>내용</h2>
		<p>여러가지 컨텐츠</p>
	</section>

	<section>
		<h1>오늘의 운세는 ?!</h1>
		<form action="fortunePro" method="post">
			이름: <input type="text" name="name"> <input type="submit"
				value="지금 바로 확인하기 ~!">
		</form>
	</section>

	<footer>
		<p></p>
	</footer>
</body>
</html>

