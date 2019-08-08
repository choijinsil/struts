<%@page import="java.util.List"%>
<%@page import="com.encore.s0729.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	EmpDAO dao= new EmpDAO();
	List list=dao.selectNames();
%>
<%
	out.println("[");
	for(int i=0; i<list.size(); i++){	
		
		out.println("\""+list.get(i)+"\"");
		if(i < list.size()-1){
	         out.print(",");
	      }
	}
	out.println("]");
%>
