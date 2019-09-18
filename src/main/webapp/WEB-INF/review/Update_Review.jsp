<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 쓰는곳</title>
</head>
<body>
<form action = "update.rv" method="post">
	
	<input type="hidden" name="category" value="${category }">
	<input type="hidden" name="keyword" value="${keyword }">
	<input type="hidden" name="rnum" value="${review.rnum }">
	<input type="hidden" name="writer" value="${userId }">
	책 제목 : <input type="text" name = "booktitle" value="${review.booktitle }"><br><br>
	리뷰 제목: <input type="text" name="subject" value="${review.subject }"><br><br>
	내용: <textarea name="content" rows="30" cols="20" >${review.content }</textarea><br><br>
	<input type="submit" value="리뷰 쓰기">
</form>


</body>
</html>