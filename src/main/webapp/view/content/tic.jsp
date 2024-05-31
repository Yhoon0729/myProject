<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tic Tac Toe</title>
<style>
body {
    min-height: 100vh;
    background: url('https://www.example.com/background.jpg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 0;
    color: #fff;
}

.container {
    background-color: rgba(0, 0, 0, 0.7);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    width: 80%;
    max-width: 500px;
    text-align: center;
}

h2 {
    color: #ffc107;
    font-weight: bold;
    text-shadow: 2px 2px 4px #000;
}

.table {
    width: 100%;
    margin: 20px 0;
}

.box {
    width: 100px;
    height: 100px;
    text-align: center;
    font-size: 24px;
    display: inline-block; /* Ensure boxes are inline */
    justify-content: center;
    align-items: center;
    margin: 0;
    flex-direction: column;
    word-wrap: break-word;
    background-color: rgba(255, 255, 255, 0.1);
    color: #fff;
    border: 1px solid #ffc107;
    font-weight: bold;
}

.box h2 {
    margin: 0;
}

button {
    margin-top: 10px;
    background-color: #ffc107;
    border-color: #ffc107;
    color: #343a40;
    font-weight: bold;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #e0a800;
    border-color: #d39e00;
}
</style>
<script>
function setMove(row, col) {
    document.getElementById('row').value = row;
    document.getElementById('col').value = col;
}
</script>
</head>
<body>
    <h2>Tic Tac Toe</h2>
    <form action="ticMove" method="post">
        <table border="1">
            <c:forEach var="row" begin="0" end="2">
                <tr>
                    <c:forEach var="col" begin="0" end="2">
                        <td class="box">
                            <h2>${boardState.substring(row*3+col, row*3+col+1)}</h2>
                            <button type="submit" name="click" value="select" onclick="setMove(${row}, ${col});">select</button>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
        <input type="hidden" name="row" id="row" value="" />
        <input type="hidden" name="col" id="col" value="" />
        <input type="hidden" name="currentPlayer" value="${currentPlayer}" />
        <button type="submit" name="click" value="reset">Reset Game</button>
    </form>
</body>
</html>
