<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="iba.MySqlMapClient"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	SqlMapClient smc = MySqlMapClient.getSqlMapInstance();
	String param = request.getParameter("param");
	String gu = request.getParameter("gu");
	Map map= new HashMap();
	map.put("sido",param);
	map.put("gugun",gu);
	
	//시조회
	List list=null;
	if(gu==null){
	    list=smc.queryForList("addr.selectSi");
	}else if(gu.equals("gugun")){
	    list=smc.queryForList("addr.selectGu",param);
	}else{
		list=smc.queryForList("addr.selectDong",map);
	}
	
	request.setAttribute("list", list);

	
%>

		<c:forEach items="${list }" var="a">
			<option>${a }</option>
		</c:forEach>
