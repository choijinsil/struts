<%@page import="com.encore.s0729.EmpDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--suggest.jsp(제시어 응답데이터 출력) --%>
<%
	String keyword=request.getParameter("keyword");
	EmpDAO dao = new EmpDAO();
	
	List<String> list = dao.selectKeyword(keyword);
	
	out.print(list.size()+"|");
    for(int i=0; i<list.size(); i++){
  	  out.print(list.get(i));
  	  if(i < list.size()-1)out.print(",");
    }
    
    
%>