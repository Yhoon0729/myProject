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
    display: flex;
    flex-direction: column;
    align-items: center;
    background: no-repeat center center fixed;
    background-size: cover;
    color: #fff;
}

header, footer {
    background-color: rgba(0, 0, 0, 0.7);
    color: #ffc107;
    padding: 10px 0;
    text-align: center;
    width: 100%;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
}

section {
    background-color: rgba(0, 0, 0, 0.7);
    margin: 10px;
    padding: 20px;
    width: 80%;
    max-width: 600px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    text-align: center;
}

h1, h2 {
    color: #ffc107;
    font-weight: bold;
    text-shadow: 2px 2px 4px #000;
}

p {
    color: #ffc107;
    font-weight: bold;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

input[type="text"] {
    margin-bottom: 10px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"] {
    background-color: #ffc107;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    color: #343a40;
    font-weight: bold;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #e0a800;
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
				value="지금 바로 확인하기 !!">
		</form>
	</section>

	<footer>
		<p></p>
	</footer>
</body>
</html>

