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
		<label for="title">제목:</label><br> 
			<input type="text" id="title" name="title"><br>
		<br> <label for="content">내용:</label><br>
			<textarea id="content" name="content" rows="4" cols="50">dswgwgw</textarea>
		<br>
		<br>

		<button type="button" onclick="submitPost()">게시</button>
	</form>

	<button class="myPageButton" onclick="goToMyPage()">마이페이지</button>

	<script>
	function submitPost() {
		console.log('submitPost()');
		//alert(content.value);
		//alert(content.firstChild.nodeValue);
        const title = document.getElementById('title').value;
        const content = document.getElementById('content').value;

        // AJAX를 사용하여 서버에 데이터를 전송
     /*    const xhttp = new XMLHttpRequest();
        xhttp.open('POST', '/writeBoard', true);
        xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                console.log('게시글이 성공적으로 서버에 전송되었습니다.');
            }
        };
        
        const formData = `title=${encodeURIComponent(title)}&content=${encodeURIComponent(content)}`;
    */   // xhttp.send(formData);
    }

		function goToMyPage() {
			window.location.href = '/myPage.html';
		}
	</script>
</body>
</html>