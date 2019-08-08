<%@page import="java.util.List"%>
<%@page import="com.encore.s0729.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	EmpDAO dao = new EmpDAO();
	List list = dao.selectNames();
	System.out.println("list.>>" + list.size());
	
	out.print("<ul>");
	for (int i = 0; i < list.size(); i++) {
		out.print("<li>" + list.get(i) + "</li>");
	}
	out.print("</ul>");
%>
