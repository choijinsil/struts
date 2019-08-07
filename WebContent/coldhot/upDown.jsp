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

		$('body').on('click','down', function(){
			cnt--;
			console.log(cnt);
		});
		
		$('body').on('click','up', function(){
			cnt++;
			console.log(cnt);
		});
		
		
		$.ajax({
			//--응답페이지 요청이 필수
			url: 'getData3.jsp'//요청
			, success: function(result){
				$('div').html(result);
			}// 성공시 콜백
			//-- 데이터 전달 키, 벨류
			, data: {
				name: $('[name=username]').val()
				, age: $('[name=age]').val()
			}
			, type:'POST' //HTTP요청방식
			, dateType: 'html'//응답데이터 형식(text, html, xml, json)
			, error: function(xhr,status){//에러콜백
				alert('서버에러!');
				alert('상태: '+xhr.status+',상태 text: '+xhr.statusText+'\nstatus: '+status);
			}
		});
	});
</script>
</html>