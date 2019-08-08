<%@page import="com.encore.s0729.Emp"%>
<%@page import="com.encore.s0729.EmpDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<c:if test="${msg eq 'success'}">
<h4>${deptno }번 부서 정보</h4>
<form >
<table>
	<tr>
		<th>사원번호</th>
		<th>사원명</th>
		<th>입사일</th>
	</tr>
	<c:forEach items="${list }" var="c">	
	<tr>
		<td>${c.empno }</td>
		<td>${c.ename }</td>
		<td>${c.hiredate }</td>
	</tr>
	</c:forEach>
	
</table>
</form>
</c:if>

<c:if test="${msg eq 'fail'}">
	<h3><font color="red">존재하지 않는 부서입니다.</font></h3>
</c:if>

<c:if test="${msg eq 'oops'}">
	<h3><font color="blue">숫자를 입력해주세요!!</font></h3>
</c:if>