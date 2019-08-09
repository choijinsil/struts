<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="iba.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	SqlMapClient smc = MySqlMapClient.getSqlMapInstance();


	List<String> list=null;
	
	
	switch(request.getParameter("req")){
	case "sido":
		list= smc.queryForList("addr.selectSi");
		break;
	case "gugun":
		list=smc.queryForList("addr.selectGu",request.getParameter("sido"));
		break;
	case "dong":
		Map<String,String> map = new HashMap<>();
		map.put("sido",request.getParameter("sido"));
		map.put("gugun",request.getParameter("gugun"));
		list=smc.queryForList("addr.selectDong", map);
		break;
		
	}

	request.setAttribute("list", list);
%>

<option>==선택==</option>
<c:forEach items="${list }" var="item">
   <option>${item }</option>
</c:forEach>