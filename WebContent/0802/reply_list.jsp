<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.encore.util.Util"
    %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--댓글 전체 목록 출력 --%>
[
<c:forEach items="${list}" var="reply" varStatus="stat">

	{no:${reply.no }, name:'${Util.toJS(reply.name )}', content:'${Util.toJS(reply.content) }'}
	<c:if test="${stat.count < list.size() }">,</c:if>
	
</c:forEach>
]