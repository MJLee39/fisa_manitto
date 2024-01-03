<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
/* CSS 스타일링 */
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

form {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
}

form label {
	margin-bottom: 10px;
	font-weight: bold;
}

form input[type="text"], form input[type="password"], form button {
	padding: 8px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

button {
	padding: 8px 20px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<h2>마이페이지</h2>

	<form id="userInfoForm">
		<label for="Id">아이디:</label> 
		<c:if test="${not empty id}">
	    	<input type="text" id="Id" name="Id" value="${id }" disabled>
		</c:if><br>
	
		<br> <label for="newPassword">새로운 비밀번호:</label>
		<input type="password" id="newPassword" name="newPassword"><br>
		<br>
		<button type="button" onclick="changePassword()">비밀번호 변경</button>
	</form>

	<button onclick="logout()">로그아웃</button>
	
	<script>
		
		// 비밀번호 변경 함수
		function changePassword() {
			const userInfo = getUserInfo();
			const currentPassword = document.getElementById('password').value;
			const newPassword = document.getElementById('newPassword').value;

			// 실제로는 서버로 비밀번호 변경 요청을 보내는 로직을 구현해야 합니다.
			// 여기서는 간단하게 비밀번호가 맞으면 변경한다고 가정하겠습니다.
			if (userInfo.password === currentPassword) {
				// 비밀번호 변경 로직
				alert('비밀번호가 변경되었습니다.');
			} else {
				alert('비밀번호가 일치하지 않습니다.');
			}
		}

		// 로그아웃 함수
		function logout() {
			// 실제로는 서버와의 세션 등을 해제하는 로직을 구현해야 합니다.
			alert('로그아웃되었습니다.');
		}

		
	</script>
</body>
</html>
