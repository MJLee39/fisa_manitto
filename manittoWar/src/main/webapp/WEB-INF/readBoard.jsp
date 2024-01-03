<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h2>게시판 조회</h2>


		<c:if test="${not empty boardList}">
	    <table>
	        <thead>
	            <tr>
	                <th>ID</th>
	                <th>제목</th>
	                <th>내용</th>
	            </tr>
	        </thead>
	        <tbody id="boardTableBody">
	            <c:forEach var="board" items="${boardList}">
	                <tr>
	                    <td>${board.id}</td>
	                    <td>${board.title}</td>
	                    <td>${board.content}</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</c:if>
	<c:if test="${empty boardList}">
	    <div class="message">
	        <p>게시글이 없습니다.</p>
	    </div>
	</c:if>

	<button onclick="goToMyPage()">마이페이지</button>

	<script>
/*     // 게시글 데이터
    const boardData = [
      { boardId: 1, title: '첫 번째 글', content: '첫 번째 글의 내용' },
      { boardId: 2, title: '두 번째 글', content: '두 번째 글의 내용' },
      { boardId: 3, title: '세 번째 글', content: '세 번째 글의 내용' }
      // ... 게시글 데이터가 더 있다고 가정합니다.
    ];

    // 게시글 테이블에 데이터 추가
    const boardTableBody = document.getElementById('boardTableBody');
    boardData.forEach(board => {
      const row = `
        <tr>
          <td>${board.boardId}</td>
          <td>${board.title}</td>
          <td>${board.content}</td>
        </tr>
      `;
      boardTableBody.innerHTML += row;
    });
 */
    // 마이페이지로 이동하는 함수
    function goToMyPage() {
      window.location.href = '/myPage.html';
    }
  </script>
</body>
</html>