<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미션3</title>
  <script src="${initParam.jsPath }jquery-3.js"></script>
  <script>
    $(function(){
       $('button').click(function(){
    	  var search =   $('input[name=search]:checked').val();
    	  console.log('search>>>'+ search);
    	  var keyword = $('input[name=keyword]').val();
    	  
    	  $.ajax({//ajax요청
    		  url:'/struts/mission/response3.do',//요청URL
    		  success: function(responseHTML){//응답데이터 처리
    		     $('div').html(responseHTML);
    		     $('div tr:even').css('background-color','#dddddd');
    		  },
    		  data:{//요청URL에 전달할 데이터
    			  search:search,
    			  keyword:keyword
    		  }  
    	  });
    	  
       });	//버튼 클릭
    });//document.ready
  </script>
</head>
<%-- mission3.jsp --%>
<body>
  <h3>미션3(사원정보출력)</h3>
  <hr>
   <input type='radio' name="search" value="ename" checked>사원명 
   <input type='radio' name="search" value="deptno">부서번호<br>
      검색어: <input type='text' name="keyword"><br>
   <button>검색</button>
   <hr>
   <div></div>
</body>
</html>


