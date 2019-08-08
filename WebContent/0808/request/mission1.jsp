<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function(){
	 $('#btn').click(function(){
		$.ajax({
			url: 'mission1.do'//요청
			, success: function(result){
				$('div').html(result);
			}
			, data: {
				name: $('#username').val()
			}
			, error: function(xhr,status){//에러콜백
				alert('서버에러!');
				alert('상태: '+xhr.status+',상태 text: '+xhr.statusText+'\nstatus: '+status);
			}
		});
	}); 
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type='text' id='username'/><br/>
	<button id="btn">전송</button>
	<div></div>
</body>
</html>