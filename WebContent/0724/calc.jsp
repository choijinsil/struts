<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>    
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
    
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>Struts 계산기</h3>
	<hr>
	<form action="calc.do" method="post">
		<input type="text" size="4" name="su1"> 
		<select name="oper">
			<option>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select> 
		<input type="text" size="4" name="su2"> 
		<input type="submit" value="계산"> <br>

		
		<div id="d1">${result }</div>
		
		<%
			session.removeAttribute("result");
		%>
		<html:messages property="siri" id="msg">
			<font color="red"><bean:write name="msg"/></font>
		</html:messages>
		

	</form>

</body>
</html>