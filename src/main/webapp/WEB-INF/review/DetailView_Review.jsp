<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="./../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<tr>
		<td>작성자</td>
		<td>${review.writer }</td>
		<td>작성일</td>
		<td>${review.regdate}</td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td colspan="3">${review.subject }</td>
	</tr>
</table>
	<textarea rows="10" cols="50" disabled="disabled">${review.content}</textarea>
	
	<c:if test="${review.writer eq userId }">
		<button onclick="location.href='update.rv?rnum=${review.rnum}&category=${category}&keyword=${keyword}'">수정</button>
		<button onclick="location.href='delete.rv?rnum=${review.rnum}&category=${category}&keyword=${keyword}'">삭제</button>
	</c:if>							
<br><br><br>
<br><br><br>
	<%@include file="../reply/Reply_List.jsp" %>
</body>
</html>