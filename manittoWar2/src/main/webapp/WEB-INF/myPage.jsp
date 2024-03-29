<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
/* CSS 스타일링 */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	text-align: center;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

h2 {
	margin-top: 20px;
	color: #333;
}

form {
	width: 300px;
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	align-items: center;
}

form label {
	margin-bottom: 10px;
	font-weight: bold;
	color: #333;
}

form input[type="text"], form input[type="password"], form button {
	padding: 8px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	width: 100%;
	box-sizing: border-box;
}

button {
	padding: 10px 20px;
	background-color: #FF6868;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

button:hover {
	background-color: #FFB996;
	color: #fff;
}

.homeButton {
	padding: 10px 20px;
	background-color: #FF6868;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	position: absolute;
	top: 20px;
	left: 20px;
}

button:last-child {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<h2>마이페이지</h2>
	<!-- <button class="homeButton" onclick="goToHome()">홈</button> -->
	<form id="userInfoForm">
		<label for="Id">이름:</label>
		<c:if test="${not empty id}">
			<input type="text" id="Id" name="Id" value="${id }" disabled>
		</c:if>
		<br> <label for="password">비밀번호:</label>

		<c:if test="${not empty pw}">
			<input type="text" id="pw" name="pw">
		</c:if>
		<br> <br> <label for="newPassword">새로운 비밀번호:</label> <input
			type="password" id="newPassword" name="newPassword"><br>

		<br>

		<button type="button" onclick="changePassword()">비밀번호 변경</button>
		<button onclick="logout()">로그아웃</button>
	</form>

	<button class="homeButton" onclick="goToHome()">홈</button>

	<script>
		// 아이디와 비밀번호를 가져오는 함수 (예시용으로 사용)
		function getUserInfo() {
			// 여기에 실제 아이디와 비밀번호를 가져오는 로직을 구현해야 합니다.
			return {
				userId : document.getElementById('Id').value,
				password : document.getElementById('pw').value
			};
		}

		const pwValue = '${pw}'

		// 비밀번호 변경 함수
		function changePassword() {
			const userInfo = getUserInfo();
			const id = document.getElementById('Id').value;
			const currentPassword = document.getElementById('pw').value;
			const newPassword = document.getElementById('newPassword').value;
			if (pwValue == currentPassword) {
				const xhr = new XMLHttpRequest();
				xhr.open('POST', 'changePw', true);
				xhr.setRequestHeader('Content-Type', 'application/json');
				xhr.onreadystatechange = function() {
					if (xhr.readyState === 4 && xhr.status === 200) {
						const response = JSON.parse(xhr.responseText);
						if (response.success) {
							alert('비밀번호가 변경되었습니다.');
							window.location.href = 'myPage';
						} else {
							alert('비밀번호 변경에 실패했습니다.');
						}
					}
				};

				const data = {
					id : id,
					newPassword : newPassword
				};
				xhr.send(JSON.stringify(data));

			} else {
				alert("비밀번호가 일치하지 않습니다.");
			}
		}

		//로그아웃
		function logout() {
			const xhr = new XMLHttpRequest();
			xhr.open('GET', 'logout', true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					alert('로그아웃되었습니다.');
					window.location.href = 'login.html'; // 로그아웃 후에 login.html로 이동
				}
			};
			xhr.send();
		}

		// 홈으로 이동하는 함수
		function goToHome() {
			window.location.href = 'main.jsp';
		}
	</script>
</body>
</html>
