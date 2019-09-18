<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="reply.rpl">
	<div>
		<input type="hidden" name="writer" value="${userId }">
		<input type="hidden" name="replyto" value="${review.rnum }">
		<select name="emo">
			<option value="1" title="${pageContext.request.contextPath}/resources/Img/Icon/1.jpg">1</option>
			<option value="2" title="${pageContext.request.contextPath}/resources/Img/Icon/2.jpg">2</option>
			<option value="3" title="${pageContext.request.contextPath}/resources/Img/Icon/3.jpg">3</option>
			<option value="4" title="${pageContext.request.contextPath}/resources/Img/Icon/4.jpg">4</option>
			<option value="5" title="${pageContext.request.contextPath}/resources/Img/Icon/5.jpg">5</option>
			<option value="6" title="${pageContext.request.contextPath}/resources/Img/Icon/6.jpg">6</option>
			<option value="7" title="${pageContext.request.contextPath}/resources/Img/Icon/7.jpg">7</option>
			<option value="8" title="${pageContext.request.contextPath}/resources/Img/Icon/8.jpg">8</option>
		</select>
		<input type="text" name = "reply">
		<input type="submit" value="댓글 달기">
	</div>
</form>
	
	<c:choose>
		<c:when test="${totalReplyCount }">
			<b>댓글이 없습니다</b>
		</c:when>
		<c:otherwise>
			<c:forEach items="${replyList }" var="replies">
				<div>
					<img src="${pageContext.request.contextPath}/resources/Img/Icon/${replies.emo }.jpg" width="10px" height="10px" >
					${replies.writer } || ${replies.reply }	<c:if test="${replies.writer eq userId }"><button onclick="loaction.href='delete.rpl?rpnum=${replies.rpnum}'">삭제</button></c:if>		
				</div>
			</c:forEach>		
		</c:otherwise>
	</c:choose>


</body>
</html>