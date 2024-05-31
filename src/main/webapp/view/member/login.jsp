<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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

.form-control, .btn-primary {
    background-color: #343a40;
    border-color: #ffc107;
    color: #ffc107;
}

.form-control::placeholder {
    color: #ffc107;
}

.form-control:focus {
    border-color: #ffc107;
    box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.25);
}

.btn-primary:hover {
    background-color: #e0a800;
    border-color: #d39e00;
}

.invalid-feedback {
    color: #ffc107;
}
</style>

</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3  center">로그인</h4>
				<form class="validation-form" novalidate method="post" action="loginPro">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="id" placeholder="" value="" required
								name="id">
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="pass">비밀번호</label> <input type="password"
								class="form-control" id="pass" placeholder="" value=""
								name="pass" required>
							<div class="invalid-feedback">비밀번호을 입력해주세요.</div>
						</div>
					</div>


					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			
		</footer>
	</div>
	<script> window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); }, false); }); }, false); </script>
</body>
</html>