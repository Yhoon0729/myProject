<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
body {
    background-color: #f0f0f0;
    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh;
    padding-top: 20px;
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

.container {
    background-color: rgba(0, 0, 0, 0.7);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    width: 80%;
    max-width: 800px;
    margin: 20px auto;
    color: #ffc107;
}

.table th, .table td {
    text-align: center;
    vertical-align: middle;
    color: #fff;
    font-weight: bold;
}

.table th {
    background-color: #343a40;
}

.table {
    margin-top: 20px;
    background-color: rgba(255, 255, 255, 0.1);
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
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원정보</h4>
				<table class="table">
					<tr>
						<th>정보</th>
						<th>내용</th>
					</tr>

					<tr>
						<td>아이디</td>
						<td>${mem.id}</td>
					</tr>

					<tr>
						<td>이름</td>
						<td>${mem.name}</td>
					</tr>

					<tr>
						<td>성별</td>
						<td>${mem.gender==1?"남자":"여자"}</td>
					</tr>

					<tr>
						<td>전화번호</td>
						<td>${mem.tel}</td>
					</tr>

					<tr>
						<td>메일</td>
						<td>${mem.email}</td>
					</tr>

					
					<tr>
						<td colspan="2">
							<a class="btn btn-primary"
							href="../member/memberUpdateForm">
							회원정보수정</a>
							<a class="btn btn-primary"
							href="../member/memberDeleteForm">
							회원탈퇴</a>
							<a class="btn btn-primary"
							href="../member/memberPassForm">
							비밀번호수정</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>