<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
	<h3>로그인폼</h3>
	<hr>
	
	<!-- == if(session.getAttribute("user") !=null -->
	<logic:present scope="session" name="user">
	이미 로그인 하셨습니다.<br>
	
	<p>
	<strong>사용자 정보 </strong><br>
	사용자 이름: <bean:write name="user" property="username"/><br>
	전화번호: ${user.phone }<br>
	이메일: ${user.email }<br>
	<!-- <a href="/struts/0724/logout.do">로그아웃 하기</a> -->
	<html:link action="/0724/logout">로그아웃하기</html:link>
	</p>
	</logic:present>
	
	<logic:notPresent scope="session" name="user">
	<strong>로그인 하십시오.</strong>
	</logic:notPresent>
	
	<form method="post" action="login.do">
	<%--messages의 id속성은 변수 --%>
	<html:messages id="msg" message="true">
		<font color="blue"><b><bean:write name="msg"/></b></font><br>
	</html:messages>
	
	아이디: <input type="text" name="id">
			<%--errid 키값으로 저장된 메세지가 존재한다면 --%>
			<html:messages id="msg" property="errid">
			<font color="red"><b><bean:write name="msg"/></b></font>
			</html:messages>
			<br>
	비밀번호: <input type="password" name="pass">
			<html:messages id="msg" property="errpass">
			<font color="red"><b><bean:write name="msg"/></b></font>
			</html:messages>
			<br>
	<input type="submit" value="로그인">
	</form>

</body>
</html>