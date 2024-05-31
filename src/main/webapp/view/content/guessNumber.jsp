<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>숫자 맞추기 게임</title>
<style>
body {
    min-height: 100vh;
    background:  no-repeat center center fixed;
    background-size: cover;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0;
    color: #fff;
}

.container {
    background-color: rgba(0, 0, 0, 0.7);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    width: 90%;
    max-width: 600px;
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

label {
    color: #ffc107;
    font-weight: bold;
}

.btn-primary {
    background-color: #ffc107;
    border-color: #ffc107;
    color: #343a40;
    font-weight: bold;
}

.btn-primary:hover {
    background-color: #e0a800;
    border-color: #d39e00;
}

.alert-info {
    background-color: rgba(23, 162, 184, 0.9);
    border-color: rgba(23, 162, 184, 0.9);
    color: #fff;
    font-weight: bold;
}

.table {
    background-color: rgba(255, 255, 255, 0.1);
}

.table th, .table td {
    color: #fff;
    font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="my-4">숫자 맞추기 게임</h1>
		<p>1부터 100 사이의 숫자를 맞춰보세요!</p> 

		<form action="guessNumberPost" method="post" class="mb-4">
			<div class="form-group">
				<label for="guess">숫자를 입력하세요:</label> <input type="number"
					class="form-control" id="guess" name="guess" required>
			</div>
			<button type="submit" class="btn btn-primary">제출</button>
		</form>

		<c:if test="${not empty message}">
			<div class="alert alert-info">${message}</div>
		</c:if>


		<h2 class="my-4">기록</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>순위</th>
					<th>ID</th>
					<th>이름</th>
					<th>시도 횟수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="record" items="${li}">
					<tr>
						<td>${record.rank}</td>
						<td>${record.userId}</td>
						<td>${record.name}</td>
						<td>${record.attempts}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>
