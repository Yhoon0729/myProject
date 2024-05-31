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

<style>
body {
	background-color: #f8f9fa;
}

.navbar {
	background-color: #343a40;
}

.navbar-brand {
	display: flex;
	align-items: center;
	padding: 0;
}

.navbar-brand img {
	width: 100%;
	height: auto;
}

.navbar-nav {
	display: flex;
	width: 100%;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.nav-item {
	display: inline-block;
}

.nav-link {
	color: #ffc107;
	font-weight: bold;
	padding: 10px 20px;
}

.nav-link:hover {
	color: #fff;
	background-color: #ffc107;
	border-radius: 5px;
}

.navbar .nav-item.active .nav-link {
	color: #fff;
	background-color: #ffc107;
	border-radius: 5px;
}

.navbar-brand {
	color: #ffc107;
	font-weight: bold;
}

.navbar-brand:hover {
	color: #ffc107;
}

.navbar-nav .nav-item:first-child {
	margin-left: 0;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light">
		<ul class="navbar-nav">
			<a class="navbar-brand "
				href="${pageContext.request.contextPath}/member/index"> <img
				alt="Logo" src="../img/logo.png"
				style="width: 50%">
			</a>

			<li class="nav-item"><a
				class="nav-link ${nav eq 'index'?'nav': ' '}" href="../member/index">홈페이지</a></li>

			<c:if test="${sessionScope.id==null}">
				<li class="nav-item"><a
					class="nav-link ${nav eq 'join'?'nav':' '}"
					href="${pageContext.request.contextPath}/member/join">회원가입</a></li>
				<li class="nav-item"><a
					class="nav-link ${nav eq 'login'?'nav': ' '}"
					href="../member/login">로그인</a></li>
			</c:if>

			<c:if test="${sessionScope.id!=null}">
				<li class="nav-item"><a
					class="nav-link ${nav eq 'joininfo'?'nav': ' '}"
					href="${pageContext.request.contextPath}/member/joinInfo">
						회원정보[<%=session.getAttribute("id")%>]
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
			</c:if>

			<c:if test="${sessionScope.id eq 'admin'}">
				<li class="nav-item"><a class="nav-link"
					href="../member/memberList">회원리스트</a></li>
			</c:if>

			<li class="nav-item"><a
				class="nav-link "
				href="${pageContext.request.contextPath}/member/contentList">컨텐츠</a></li>
			
			<li class="nav-item"><a
				class="nav-link"
				href="${pageContext.request.contextPath}/content/record">명예의 전당</a></li>
		</ul>
	</nav>
	<br>
</body>
</html>