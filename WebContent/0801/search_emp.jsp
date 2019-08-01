<%@page import="java.util.List"%>
<%@page import="iba.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="com.encore.s0729.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	List list = null;
	SqlMapClient smc = MySqlMapClient.getSqlMapInstance();
	String sel = request.getParameter("sel");
	String input = request.getParameter("input");

	if ("ename".equals(sel)) {
		list = smc.queryForList("emp.selename", input);
	}else if("dname".equals(sel)){
		list = smc.queryForList("emp.seldname", input);
	}else if("job".equals(sel)){
		list = smc.queryForList("emp.seljob", input);
	}else if(sel==null){
		out.println("<font color=red>값을 다시 입력해주세요.</font>");
	}
	request.setAttribute("list", list);
%>
	<tr bgcolor="pink">
		<th>사원번호</th>
		<th>사원명</th>
		<th>입사일</th>
		<th>부서명</th>
		<th>직책</th>
	</tr>
<c:forEach items="${list }" var="emp">
	<tr>
		<td>${emp.empno }</td>
		<td>${emp.ename }</td>
		<td>${emp.hiredate }</td>
		<td>${emp.dname }</td>
		<td>${emp.job }</td>
	</tr>
</c:forEach>








