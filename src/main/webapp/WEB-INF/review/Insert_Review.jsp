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
${userId }<br>
<form action = "insert.rv" method="post">
	<input type="hidden" name="writer" value="${userId }">
	책 제목 : <input type="text" name = "booktitle" placeholder="책 제목을 입력하세요"><br><br>
	리뷰 제목: <input type="text" name="subject" placeholder="제목을 입력하세요"><br><br>
	내용: <textarea name = "content" rows="30" cols="50" placeholder = "내용을 입력하세요"></textarea><br><br>
	<input type="submit" value="리뷰 쓰기">
</form>


</body>
</html>