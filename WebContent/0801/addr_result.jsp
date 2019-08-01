<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="iba.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<String> list = null;
	SqlMapClient smc = MySqlMapClient.getSqlMapInstance();
	String want = request.getParameter("want");
	String sido = request.getParameter("sido");
	String gugun = request.getParameter("gugun");
	
	Map map = new HashMap();
	map.put("gugun", sido);
	map.put("sido", gugun);

	if (want == null || "sido".equals(want)) {//클라이언트가 sido정보를 요청했더라면
		System.out.println("sidowant>>" + want);
		list = smc.queryForList("addr.selectSi");
	} else if ("gugun".equals(want)) {//구군정보
		list = smc.queryForList("addr.selectGu", sido);
	} else if ("dong".equals(want)) {
		list = smc.queryForList("addr.selectDong", map);
	}

	for (String str : list) {
		out.print("<option>" + str + "</option>");
	}
%>
