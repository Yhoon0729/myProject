<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 탈퇴</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            background-color:#f0f0f0;
        }

        .input-form {
            max-width: 680px;
            margin: 20px;
            padding: 32px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        }

        header, footer {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            width: 100%;
            margin-bottom: 20px;
        }

        footer p {
            margin: 0;
        }

        .form-title {
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-submit {
            width: 100%;
        }
    </style>
</head>
<body>
	<header>
		<h1>회원 탈퇴</h1>
	</header>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3 text-center">회원 탈퇴</h4>
				<form class="validation-form" method="post" novalidate action="memberDeletePro">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" value="<%= session.getAttribute("id") %>" name="id" readonly>
						<div class="invalid-feedback">아이디를 입력해주세요.</div>
					</div>
					<div class="form-group">
						<label for="pass">비밀번호</label>
						<input type="password" class="form-control" id="pass" name="pass" required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
					<button class="btn btn-danger btn-lg btn-block" type="submit">회원 탈퇴</button>
				</form>
			</div>
		</div>
	</div>
	<footer>
	
	</footer>
	<script>
		window.addEventListener('load', () => {
			const forms = document.getElementsByClassName('validation-form');
			Array.prototype.filter.call(forms, (form) => {
				form.addEventListener('submit', function (event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	</script>
</body>
</html>
