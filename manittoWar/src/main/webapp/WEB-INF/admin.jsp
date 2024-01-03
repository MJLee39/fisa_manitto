<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Layout</title>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

button {
	font-size: 2vw;
	padding: 1.5vw 3vw;
	margin: 2vh 0;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

table-container {
	max-height: 70vh;
	overflow: auto;
	width: 80%;
	margin-top: 2vh;
	margin-bottom: 2vh;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 1vw;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<button type="button" onclick="createManitto()">마니또 생성하기</button>

	<div id="allView"></div>

	<script>
		function createManitto() {
			 // 마니또 생성 로직 구현해야함
			 var xhr = new XMLHttpRequest();
	
			    xhr.onreadystatechange = function() {
			        if (xhr.readyState === XMLHttpRequest.DONE) {
			            if (xhr.status === 200) {
			                var data = JSON.parse(xhr.responseText);
			                // 서버로부터 반환된 데이터를 처리합니다.
			                console.log('새로운 마니또가 생성되었습니다:', data);
			                // 이후에 필요한 UI 업데이트 등을 수행할 수 있습니다.
			                
			                let tableElement =`
			                	<table-container>
								<table>
								<thead>
								<tr>
									<th>ID</th>
									<th>이름</th>
									<th>Target ID</th>
									<th>Target 이름</th>
								</tr>
							</thead>
							<tbody>`;
							
							for (let i in data){
								tableElement = tableElement + `<tr>
							 		<td>${data[i].id}</td>
							 		<td>${data[i].name}</td>
							 		<td>${data[i].targetId}</td>
							 		<td>fa</td>
							    </tr>`;
							}
							
							tableElement = tableElement + `</tbody>
															</table>
															</table-container>`;
							document.getElementById("allView").innerHTML = tableElement;
			            } else {
			                // 서버에서 에러가 발생한 경우 처리할 내용을 여기에 작성합니다.
			                console.error('Request failed');
			            }
			        }
			    };
	
			    xhr.open('GET', '/createManittoEndpoint');
			    
			    xhr.send();
		}
	</script>
</body>
</html>