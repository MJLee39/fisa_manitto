<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% System.out.println("+++++"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
.button-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.button {
	padding: 10px 20px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 200px;
	height: 40px;
	margin: 5px;
}

.img-container {
	text-align: center;
}

h2 {
	text-align: center;
}

#hideButton {
	justify-content: center;

	padding: 10px 20px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 200px;
	height: 40px;
}

body {
	filter: none;
}

.button {
justify-content: center;
  display: inline-block;
  padding: 5px 10px;
  font-size: 16px;
  text-align: center;
  text-decoration: none;
  background-color: #3498DB;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.button:hover {
	background-color: #45A049;
}
</style>
</head>

<body>
	
	<h2>마니또</h2>
	<div class="img-container">
		<img alt="" src="images/giftbox_close.gif" width="200" height="200">
	</div>

	<div class="button-container">
		<button class="button" onclick="goToPage('myManitto')">내 마니또
			확인하기</button>
		<button class="button" onclick="goToPage('writeBoard.html')">편지 
			게시하기</button>
		<button class="button" onclick="goToPage('readBoard')">편지 보기</button>
	</div>

	<div class="button-container">
		<button id="hideButton" onclick="goToPage('openManitto.html')" disabled>전체 확인</button>
		<button class="button" onclick="goToPage('myPage')">마이페이지</button>
	</div>

	<script>
		function goToPage(url) {
			window.location.href = url;
		}
		
		const hideButton = document.getElementById('hideButton');
		
		function enableButtonAfterDelay(delayInMilliseconds) {
		   setTimeout(() => {
			   hideButton.disabled = false;
		   }, delayInMilliseconds);
		}

		enableButtonAfterDelay(5000);
	</script>
</body>
</html>
