<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){// == window.onload
			$.ajax({//특별한 이벤트 없이 요청(처음페이지 요청)!
				url: '../response/response4.jsp'
				,success:function(data){
					$('#s1').html(data);
				}
				,data:{
					req:'sido'
				}
			});
			
			$('#s1').change(function(){//구군정보요청
				
				if($(this).val()==='==선택=='){//DB자원을 아끼자
					$('#s2').html('<option>==선택==</option>');
					$('#s3').html('<option>==선택==</option>');
				}else{
				
					$.ajax({
						url: '../response/response4.jsp?req=gugun'
						,success:function(data){
							$('#s2').html(data);
						}
						,data:{
							sido:$('#s1').val()
						}
					});
				}
			});
			
			$('#s2').change(function(){//동정보요청
				$.ajax({
					url: '../response/response4.jsp?req=dong'
					,success:function(data){
						$('#s3').html(data);
					},
					data:{
						gugun: $('#s2').val()
						,sido: $('#s1').val()
					}
				})
			});
		});
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>시도구군 테스트</h3>
	<hr>
	<select id="s1"><option>==선택==</option></select>
	<select id="s2"><option>==선택==</option></select>
	<select id="s3"><option>==선택==</option></select>
</body>
</html>