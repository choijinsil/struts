<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>자바스크립트 함수 테스트</h3>
	<button onabort="alert('안녕1')">눌러바1</button>
	<button id="b2" onclick="test2()">눌러바2</button>
	<button id="b3">눌러바3</button>

</body>
<script type="text/javascript">
	$('#b3').click( function(){
		alert('까꿍 나는 버튼 삼이지렁');
	});
</script>
</html>