<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/dropdown.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.dd.min.js"></script>


</head>
<body>
<c:if test="${userId ne null }">
	<form action="reply.rpl">
		<div>
			<input type="hidden" name="category" value="${category }">
			<input type="hidden" name="keyword" value="${keyword }">
			<input type="hidden" name="writer" value="${userId }">
			<input type="hidden" name="replyto" value="${review.rnum }">
			<select name="emo" style="width: 80px">
				<option value="1" title="${pageContext.request.contextPath}/resources/Img/Icon/1.jpg">1</option>
				<option value="2" title="${pageContext.request.contextPath}/resources/Img/Icon/2.jpg">2</option>
				<option value="3" title="${pageContext.request.contextPath}/resources/Img/Icon/3.jpg">3</option>
				<option value="4" title="${pageContext.request.contextPath}/resources/Img/Icon/4.jpg">4</option>
				<option value="5" title="${pageContext.request.contextPath}/resources/Img/Icon/5.jpg">5</option>
				<option value="6" title="${pageContext.request.contextPath}/resources/Img/Icon/6.jpg">6</option>
				<option value="7" title="${pageContext.request.contextPath}/resources/Img/Icon/7.jpg">7</option>
				<option value="8" title="${pageContext.request.contextPath}/resources/Img/Icon/8.jpg">8</option>
			</select>
			<input type="text" name = "reply" width="200px">
			<input type="submit" value="댓글 달기">
		</div>
	</form>
</c:if>
	
	<c:choose>
		<c:when test="${review.replycount eq 0}">
			<b>댓글이 없습니다</b>
		</c:when>
		<c:otherwise>
			<c:forEach items="${replyList }" var="replies">
				<div>
					<c:choose>
						<c:when test="${replies.writer eq 'admin'}">
							<img src="${pageContext.request.contextPath}/resources/Img/Icon/admin.jpg" width="20px" height="20px" >
						</c:when>
						
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/Img/Icon/${replies.emo }.jpg" width="20px" height="20px" >
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${review.writer eq replies.writer}">
							<span style="display:inline-block; width: 50px"><b>${replies.writer } </b></span>
						</c:when>
						
						<c:otherwise>
							<span style="display:inline-block; width: 50px">${replies.writer } </span>
						</c:otherwise>
					</c:choose>
					 ||<span style="display:inline-block; width: 200px"> ${replies.reply }	</span>
					<c:if test="${replies.writer eq userId }">
					<button onclick="delReply(${replies.replyto },${replies.rpnum},'${category }','${keyword}')">삭제</button>
					</c:if>		
				</div>
			</c:forEach>		
		</c:otherwise>
	</c:choose>
<script type="text/javascript">
$(function(){
	$("body select").msDropDown();
})

	function delReply(rnum,rpnum,category,keyword){
		location.href="delete.rpl?rnum="+rnum+"&rpnum="+rpnum+"&category="+category+"&keyword="+keyword
	}
</script>

</body>
</html>