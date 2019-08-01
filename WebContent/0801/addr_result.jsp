<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="iba.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
	SqlMapClient smc = MySqlMapClient.getSqlMapInstance();
	String want = request.getParameter("want");
	
	List<String> list = null;
	
	

	if (want == null || "sido".equals(want)) {//클라이언트가 sido정보를 요청했더라면
		list = smc.queryForList("addr.selectSi");
	} else if ("gugun".equals(want)) {//구군정보
		String sido = request.getParameter("sido");
		list = smc.queryForList("addr.selectGu", sido);
	} else if ("dong".equals(want)) {
		String sido = request.getParameter("sido");
		String gugun = request.getParameter("gugun");
		HashMap<String,String> map = new HashMap<>();
		map.put("gugun", gugun);
		map.put("sido", sido);
		System.out.println("gugun_map>>>" + map.get("gugun"));
		System.out.println("sido_map>>>" + map.get("sido"));
		list = smc.queryForList("addr.selectDong", map);
	}

	for (String str : list) {
		out.print("<option>" + str + "</option>");
	}
%>
