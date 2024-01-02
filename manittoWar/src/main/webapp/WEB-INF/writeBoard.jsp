<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 쓰기</title>
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

label {
	margin-bottom: 10px;
}

textarea {
	resize: vertical;
}

button {
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.myPageButton {
	position: absolute;
	top: 20px;
	right: 20px;
	padding: 10px 20px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<h2>게시글 쓰기</h2>

	<form id="postForm">
		<label for="title">제목:</label><br> <input type="text" id="title"
			name="title"><br>
		<br> <label for="content">내용:</label><br>
		<textarea id="content" name="content" rows="4" cols="50"></textarea>
		<br>
		<br>

		<button type="button" onclick="submitPost()">게시</button>
	</form>

	<button class="myPageButton" onclick="goToMyPage()">마이페이지</button>

	<script>
		function submitPost() {
			const title = document.getElementById('title').value;
			const content = document.getElementById('content').value;

			// 실제로는 서버로 게시글을 전송하는 로직을 구현해야 합니다.
			// 여기서는 콘솔에 출력하는 예시를 보여드리겠습니다.
			console.log('제목:', title);
			console.log('내용:', content);

			// 여기에 서버로 게시글을 전송하는 로직을 추가해야 합니다.
		}

		function goToMyPage() {
			window.location.href = '/myPage.html';
		}
	</script>
</body>
</html>
