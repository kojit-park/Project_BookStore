<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tagsIn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<script type="text/javascript">
	function insert(){
		location.href='insert.gt'; // GiftInsertController
	}
	function goUpdate(gnum ){
		location.href='update.gt?gnum=' +  gnum ; // GiftUpdateController get
	}
</script>
</head>
<body>
<!-- list.gt=>GiftList.jsp -->
 

	<h2 align="center">리스트 화면</h2>
	<center>
	<form action="list.gt" method="get"> 
		<select name="whatColumn">
			<option value="all">전체 검색
			<option value="gname">사은품명
			<option value="gcontents">설명
		</select>
		<input type="text" name="keyword" value="">
		<input type="submit" value="검색">
	</form>
	</center>
	
<br><br>

<form action = "calculate.bsmall">
	 <table border="1" align="center" width="80%">
	
		<tr>
			<td colspan="8" align="center">
				<input type="button" value="추가하기" onclick="insert();">
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>사은품명</th>
			<th>이미지</th>
			<th>카테고리</th>
			<th>설명</th>
			<th>등록일</th>
			<th>선택</th>
			
		<c:if test="${userId ne null and userId eq 'admin' }"><th>삭제</th>
			<th>수정</th> </c:if>
		</tr>
		<c:forEach items="${giftLists}" var="gift" >
			<tr>
				<td align="center">
					<c:out value="${gift.gnum}" />
				</td>
				<td align="left" width="100"> 
					<%-- <a href="detail.gt?gnum=<c:out value="${gift.gnum}" />"> --%>
						<c:out value="${gift.gname}" />
					<!-- </a> -->
					<br>
<!-- 					detail.gt => GiftDetailViewController -->
				</td>
				<td align="center">
					<%-- <a href="detail.gt?gnum=<c:out value="${gift.gnum}" />"> --%>
					<img src="<%=request.getContextPath() %>/resources/${gift.gimage}" width="60px" height="60px"> 
					</a>
				</td>
				<td align="center">
					<c:out value="${gift.gcategory}" />
				</td>
				<td align="left" width="150">
					<c:out value="${gift.gcontents}" />
				</td>				
				<td align="center">
					<c:out value="${gift.day}" />
				</td>	 
				<td>
					<input type="radio" name="selectGift" value="${gift.gname }" >
				</td>
				<c:if test="${userId ne null and userId eq 'admin' }"><td align="center">
					<a href="delete.gt?gnum=<c:out value="${gift.gnum}" />">삭제</a><br>
				</td>
				<td  align="center">
					<input type="button" value="수정" value="${gift.gnum}" onclick="goUpdate('${gift.gnum}')"/>
				</td></c:if>
			</tr>
		</c:forEach>
	</table>
	<input type="submit" value="선택 완료">
</form>
		
	<br>
	<center>
		${pageInfo.pagingHtml}
	</center>
	
</body>
</html>