<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<head>
<meta charset="UTF-8">
<title>춥다 덥다 투표</title>
</head>
<body>
	<h3>에어컨이 춥거나 더우면 Up, Down 버튼을 눌러주세요.</h3>

	<button id="down">더워요. 온도 내려주세요.</button>
	<button id="up">춥다. 온도 올려주세요.</button>

	<p id="result" ></p>
</body>

<script type="text/javascript">
	var cnt=0;
	$(function() {

		
	});
	
	$('body').on('click','down', function(){
		cnt--;
		console.log(cnt);
	});
	$('body').on('click','up', function(){
		cnt++;
		console.log(cnt);
	});
	
</script>
</html>