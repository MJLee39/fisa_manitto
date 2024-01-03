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
	
		<label for="password">비밀번호:</label>
		
		<c:if test="${not empty pw}">
	    	<input type="text" id="pw" name="pw" value='${pw}' disabled>
		</c:if><br>
		
		
		<br>
		<label for="newPassword">새로운 비밀번호:</label>
		<input type="password" id="newPassword" name="newPassword"><br>
		
		<br>
		
		<button type="button" onclick="changePassword()">비밀번호 변경</button>
	</form>

	<button onclick="logout()">로그아웃</button>
	
	<script>
	
		
		// 아이디와 비밀번호를 가져오는 함수 (예시용으로 사용)
		function getUserInfo() {
			// 여기에 실제 아이디와 비밀번호를 가져오는 로직을 구현해야 합니다.
			return {
				userId : document.getElementById('Id').value,
				password : document.getElementById('pw').value
			};
		}
		
		// 비밀번호 변경 함수
		function changePassword() {
			const userInfo = getUserInfo();
			const currentPassword = document.getElementById('pw').value;
			const newPassword = document.getElementById('newPassword').value;
			console.log("currentPassword:"+currentPassword);
			console.log("newPassword:"+newPassword);
			console.log("userInfo:"+userInfo);
			console.log("userInfo.password:"+userInfo.password);
			if (userInfo.password === currentPassword) {
				const xhr = new XMLHttpRequest();
				
				xhr.open('POST', 'changePw', true);
				xhr.setRequestHeader('Content-Type', 'application/json');
				
				xhr.onreadystatechange = function () {
				    if (xhr.readyState === 4 && xhr.status === 200) {
				      const response = JSON.parse(xhr.responseText);
				      //console.log(this.responseText);
				      if (response.success) {
				        alert('비밀번호가 변경되었습니다.');
				      } else {
				        alert('비밀번호 변경에 실패했습니다.');
				      }
				    }
			  	};
			  const data = {
			    currentPassword: currentPassword,
			    newPassword: newPassword
			  };
			  xhr.send(JSON.stringify(data));
			 
			} else {
				alert("비밀번호가 일치하지 않습니다.");
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
