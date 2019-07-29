<%@page import="com.encore.s0729.EmpDAO"%>
<%@page import="com.encore.s0729.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ename=request.getParameter("ename");
	EmpDAO dao= new EmpDAO();
	Emp vo=dao.selectEmpInfo(ename);
%>
	<h3><%=vo.getEname() %>사원의 정보</h3>
	<hr>
	사원번호:<%=vo.getEmpno() %> <br>
	사원명: <%=vo.getEname() %><br>
	입사일: <%=vo.getHiredate() %><br>
	부서명: <%=vo.getDname() %><br>
