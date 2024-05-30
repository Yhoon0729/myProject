<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>상위 기록</title>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12">
                <h3 class="text-center mb-4">숫자 맞추기 게임 - 상위 3개 기록</h3>
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">순위</th>
                            <th scope="col">ID</th>
                            <th scope="col">이름</th>
                            <th scope="col">시도 횟수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="record" items="${records}">
                            <tr>
                                <td>${record.rank}</td>
                                <td>${record.userId}</td>
                                <td>${record.name}</td>
                                <td>${record.attempts}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/content/guessNumber" class="btn btn-primary">기록 부수기</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
