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

	<div>
		<form action="list.rv">
			<input type="hidden" name="category" value="booktitle">
			<input type="text" name="keyword" placeholder="찾고싶은 주제를 입력하세요">
			<input type="submit" value="정렬">
		</form>
	</div>

	<c:choose>
		<c:when test="${totalAmount==0}">
			<b style="text-align: center">리뷰가 없습니다.</b>
		</c:when>
		<c:otherwise>
		
			<table border="1" align="center">
				<tr>
					<th>글 번호</th>
					<th>주제</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
					
				</tr>
				<c:forEach items="${reviewList}" var="review"> 
					<tr>
						<td align="center">
							${review.rnum}
						</td>				
						<td align="center">
							${review.booktitle}
						</td>
						<td align="center">
							<a href = "detail.rv?rnum=${review.rnum}&category=${pageInfo.category}&keyword=${pageInfo.keyword}">${review.subject}</a>
							<c:if test="${review.replycount ne 0 }">[${review.replycount }]</c:if>
						</td>				
						<td align="center">
							${review.writer}
						</td>
						<td align="center">
							${review.readcount}
						</td>
						<td align="center">
							${review.regdate}
						</td>				
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
<button onclick="location.href='insert.rv'">리뷰 쓰기</button>

</body>
</html>