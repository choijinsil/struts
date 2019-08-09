<%@page import="java.util.List"%>
<%@page import="iba.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$(function(){
			$('#bt_ename').click(function(){
			         $('tbody tr').filter(function(){//tbody내의 모든 tr엘리먼트
			        	
			        	var trContent = $(this).children('td:eq(1)').text().toLowerCase();
			        	var ename =  $('[name=ename]').val().toLowerCase();
			         
			            $(this).toggle( trContent.indexOf(ename) > -1 );
			         });
			         
			});//bt_ename끝
			
			$('#bt_sal').click(function(){
				 $('td:nth-child(4)').filter(function(){//tbody내의 모든 tr엘리먼트
			        	
			        	var trContent = $(this).text();
			        	var sal =  $('[name=sal]').val();
			         
			            $(this).parent().toggle( parseInt(trContent) >= parseInt(sal));
			     });
			});
		});
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
		SqlMapClient smc = MySqlMapClient.getSqlMapInstance(); 
		List<String> list = smc.queryForList("emp.forFilter");
		request.setAttribute("list"	, list);
		
	%>
<body>

	<input type="text" name="ename" placeholder="사원명">
	<button id="bt_ename">조회</button><br/>
	<input type="text" name="sal" placeholder="급여">
	<button id="bt_sal">조회</button><br/>
	<div></div>
	
	<table>
		<thead>
		<tr bgcolor="yellow">
			<th>사원 번호</th>
			<th>사원명</th>
			<th>입사일</th>
			<th>급여</th>
		</tr>
		</thead>
		
	 <tbody>	
	<c:forEach items="${list }" var="vo">
		<tr>
			<td>${vo.empno }</td>
			<td>${vo.ename }</td>
			<td><fmt:formatDate value="${vo.hiredate }" pattern="yyyy/MM/dd"/></td>
			<td>${vo.sal }</td>
		</tr>
	</c:forEach>
	 </tbody>	
	</table>
	
</body>
</html>