<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호확인</title>
  <script type="text/javascript">
     	if('${result}' === 'incorrect'){
    		alert('권한이 없습니다!!')
    		window.close();
    	}else if('${result}' === 'correct'){
    		//수정 또는 삭제 작업 실행!!
    		opener.execUpDel();
      	    window.close();
    	}
  </script>
</head>
<% session.removeAttribute("result"); %>
<%--pass_check2.jsp --%>
<body>
  <form name="passForm" action="passCheck.do" method="post">
    <input type="hidden"  name="no" value="${param.no }">
    <table>
       <tr>
          <td bgcolor="skyblue">비밀번호</td>
          <td><input type="password" name="pass"> </td>
       </tr>
       <tr>
          <td colspan="2" align="center">
             <input type="submit" value="확인">
          </td>
       </tr>
    </table>
  </form>
</body>
</html>




