<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Layout</title>
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
	<h2>관리자 페이지</h2>
	<div class="img-container">
		<img alt="" src="images/giftbox_close.gif" width="200" height="200">
	</div>

	<div class="button-container">
		<button class="button" onclick="createManitto()">마니또 생성하기</button>
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

		enableButtonAfterDelay(0);
	</script>

	<script>
		function createManitto() {
			 var xhr = new XMLHttpRequest();
	
			    xhr.onreadystatechange = function() {
			        if (xhr.readyState === XMLHttpRequest.DONE) {
			            if (xhr.status === 200) {
			                var data = JSON.parse(xhr.responseText);
			                console.log('새로운 마니또가 생성되었습니다:', data);
			                alert('마니또 매칭 완료.');
			                let tableElement =`
			                	<table-container>
								<table>
								<thead>
									<tr>
										<th>이름</th>
										<th>마니또 이름</th>
									</tr>
								</thead>
								<tbody>`;
							
							for (let i in data){
								tableElement = tableElement + `<tr>
							 		<td>${data[i][0]}</td>
							 		<td>${data[i][1]}</td>
							    </tr>`;
							}
								
							tableElement = tableElement + `</tbody>
															</table>
															</table-container>`;
							document.getElementById("allView").innerHTML = tableElement;
			            } else {
			                console.error('Request failed');
			            }
			        }
			    };
	
			    xhr.open('POST', 'createManittoEndpoint');
			   
			    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				
				xhr.send();
		}
	</script>
</body>
</html>
