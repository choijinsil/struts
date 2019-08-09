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
				url: 'mission2.do'//요청
				, success: function(result){
					$('div').html(result);
				}
				, data: {
					su1: $('input[name=su1]').val(),
					su2: $('input[name=su2]').val(),
					oper: $('select[name=oper]').val()
					, subject:'제이쿼리&에이젝스'
				}
				
			});
		}); 
	});
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Struts 계산기</h3>
	<hr>
		<input type="text" size="4" name="su1"> 
		<select name="oper">
			<option>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select> 
		<input type="text" size="4" name="su2"> 
		<input type="submit" value="계산" id="btn"> <br>
		
		<div></div>
</body>
</html>