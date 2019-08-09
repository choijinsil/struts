<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery-filter테스트</title>
  <style>
	table {
	  font-family: arial, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	}
	
	td, th {
	  border: 1px solid red;
	  text-align: left;
	  padding: 8px;
	}
	
	tbody tr:nth-child(odd) {
	  background-color: yellow;
	}
</style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(function(){//HTML이 전부 출력되고
      $('input[name=search]').keyup(function(){//텍스트가 입력되었다면
    	 var search =  $(this).val().toUpperCase();
         console.log("search>>>"+ search);
         
         //$('tr').filter(function(){});//table내의 모든 tr엘리먼트
         $('#myTable tr').filter(function(){//tbody내의 모든 tr엘리먼트
        	 var txt = $(this).text().toUpperCase();
           console.log('<tr>의 text()>>>'+ txt);
           console.log('<tr>의 html()>>>'+ $(this).html());
            //toggle() - 번갈아 실행 : show()또는 hide()실행
            //엘리먼트.toggle(true)   ----> 엘리먼트 보이기
            //엘리먼트.toggle(false)  ----> 엘리먼트 숨기기
            
            //  var str='gildong'
            //           0123456
            //  str.indexOf('g')  ---> 0
            //  str.indexOf('d')  ---> 3
            //  str.indexOf('x')  ---> -1
            
            $(this).toggle( txt.indexOf(search) > -1 );
         });
         
      });	
    });
  </script>

</head>
<%-- filter_test.jsp --%>
<body>
  <h3>filter테스트</h3>
  <hr>
  <input type="text" name="search" placeholder="검색어">
  <br><br>
  <table>
    <!-- 그룹 설정 (thead(제목표현), tbody(여러개 사용가능), tfoot(총합계등의 결과 출력)) -->
    <thead>
      <tr>
         <th>Name</th>
         <th>Age</th>
         <th>Email</th>
      </tr>
    </thead>
    <tbody id="myTable">
      <tr>
        <td>HongGilDong</td>
        <td>13</td>
        <td>gildong@daum.net</td>
      </tr>
      <tr>
        <td>GilLaIm</td>
        <td>15</td>
        <td>lime@naver.com</td>
      </tr>
      <tr>
        <td>KimJuWon</td>
        <td>17</td>
        <td>juwon@naver.com</td>
      </tr>
      <tr>
        <td>KimYooSin</td>
        <td>19</td>
        <td>yousin@daum.com</td>
      </tr>
      
    </tbody>
  </table>
</body>
</html>






