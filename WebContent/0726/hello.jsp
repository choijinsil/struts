<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	System.out.println("hello.jsp페이지 요청이 있었네");
	System.out.println("전달이름: "+request.getParameter("uname"));
%>
	<font color="red">안녕, ${param.uname }</font>
