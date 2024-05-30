<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tic Tac Toe</title>
<style>
.box {
    width: 100px;
    height: 100px;
    text-align: center;
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
                            [${boardState.substring(row*3+col, row*3+col+1)}]
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
