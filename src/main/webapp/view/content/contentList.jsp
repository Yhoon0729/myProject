<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>게임 목록</title>
<style>
body {
    background: no-repeat center center fixed; 
    background-size: cover;
    color: #fff;
}
.container {
    background-color: rgba(0, 0, 0, 0.7);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
}
h1 {
    color: #ffc107;
    font-weight: bold;
    text-shadow: 2px 2px 4px #000;
}
.list-group-item {
    font-size: 1.2em;
    background-color: rgba(255, 255, 255, 0.1);
    color: #fff;
    border: 1px solid #ffc107;
    font-weight: bold;
}
.list-group-item:hover {
    background-color: rgba(255, 255, 255, 0.2);
    color: #ffc107;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="my-4">컨텐츠 목록</h1>
		<div class="list-group">
			<a href="${pageContext.request.contextPath}/content/guessNumber" class="list-group-item list-group-item-action">숫자 맞추기 게임</a>
			<a href="${pageContext.request.contextPath}/content/tic" class="list-group-item list-group-item-action">tic</a>
			<a href="${pageContext.request.contextPath}/member/fortunePro?name=${sessionScope.name}" class="list-group-item list-group-item-action">오늘의 운세</a>
		</div>
	</div>
</body>
</html>
