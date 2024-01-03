<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 조회</title>
<style>
/* 기존 CSS */
body {
	font-family: Arial, sans-serif;
	text-align: center;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

h2 {
	margin-top: 20px;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
	border: 1px solid #dddddd;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}

button {
	padding: 10px 20px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	position: absolute;
	top: 20px;
	right: 20px;
}
</style>
</head>
<body>
	<h2>마니또에게 보내는 편지</h2>
	<c:if test="${not empty readBoard}">
	    <table>
	        <thead>
	            <tr>
	                <th>제목</th>
	                <th>내용</th>
	            </tr>
	        </thead>
	        <tbody id="boardTableBody">
	            <c:forEach var="board" items="${readBoard}">
	                <tr>
	                    <td>${board.title}</td>
	                    <td>${board.content}</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</c:if>
	<c:if test="${empty readBoard}">
	    <div class="message">
	        <p>게시글이 없습니다.</p>
	    </div>
	</c:if>

	<button onclick="goToMyPage()">마이페이지</button>

	<script>

    // 마이페이지로 이동하는 함수
    function goToMyPage() {
      window.location.href = '/myPage.html';
    }
  </script>
</body>
</html>