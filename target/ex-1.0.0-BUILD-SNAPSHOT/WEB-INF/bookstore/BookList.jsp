<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tagsIn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BookList</title>
<style type="text/css">
	.flex_content_container{
		padding-left:auto;
		display:inline-flex;
		width: 18%;
		
		
	
	}
	.flex_item_container{
		flex-basis: 18%;
		justify-content: center;
		
	}
	select{
		text-align-last: center !important;
	}

</style>

<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/ListStyle.css" />
<script type="text/javascript" src ="${pageContext.request.contextPath}/resources/js/searchScript.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

</head>
<body>
<div align="center"><a href="main.bs"><img src="${pageContext.request.contextPath}/resources/Img/Logo/3.jpg" width="200" height="100"/></a></div>
<div align="center">
	<form name = "frm" action="list.bs">
		<div style="text-align: center; width: 300px">
		<select name="category" onchange="this.form.submit()" class="form-control">
			<option value="title">정확도</option>
			<option value="pubdate">신상품</option>
			<option value="price">가격</option>
		</select></div>
		
		<input type="hidden" value="${pageInfo.keyword }" name="keyword">
		<input type="hidden" value="sorting" name="sorting">
	</form>
</div>
		<hr style="border: solid 1px #368AFF;">
<div style="padding-left: 10%;">
<c:choose>
	<c:when test="${totalCount == 0 }">
		<div>찾으시는 책이 없습니다</div>
	</c:when>
	<c:otherwise>
		<c:forEach items="${bookLists }" var="book">
			<div class= "flex_content_container" >
				<div class= "flex_item_container" style="text-align: center;"><div class = "pic"><a href = "#">
				<img id="bookImage${book.bnum }" src='<c:url value="/resources/Img/${book.title}.jpg"/>' width="130" height="200"></a>
				<div id = "myMouseEnter${book.bnum }" onclick="modEvt('${book.bnum }')" class ="mouse_Enter">
						<div class ="mouse_Enter_contents">
						<b>${book.title }</b> <br>
						<br>
						<br>
						<div class = "mouse_Enter_Darker" style="width: 400">
							저자:
							<c:choose>
								<c:when test="${fn:length(book.author) > 5 }"> ${fn:substring(book.author,0,5)}...</c:when>
								<c:otherwise>${book.author }</c:otherwise>
							</c:choose>
								<br>
							출판:
							<c:choose>
								<c:when test="${fn:length(book.publisher) > 5 }"> ${fn:substring(book.publisher,0,4)}...</c:when>
								<c:otherwise>${book.publisher }</c:otherwise>
							</c:choose>
								<br>
							출판년도:<br> ${book.pubdate }<br>
							분류: ${book.category }<br>
						</div>
						</div>
				</div></div>
				<div><b style="font-size: 10pt">${book.title }</b></div>
				
				<div id = "myModal${book.bnum }" class="modal" style="text-align: left;">
					<div class="modal-content">
						<div style="text-align: center;"><img src = "${pageContext.request.contextPath}/resources/Img/${book.title}.jpg" width =150 height =200></div><br>
							<hr style="border: solid 1px #368AFF;">
							제목: ${book.title } <br>
							저자: ${book.author } <br>
							출판사: ${book.publisher } <br>
							출판년도: ${book.pubdate }<br>
							책소개: ${book.page } page, <br>
							${book.introduce }... <br>
							분류: ${book.category } <br>
							재고: ${book.stock } <br>
							<hr style="border: solid 1px #368AFF;">
							<div style="text-align: center;">
							<a href="detail.bs?bnum=${book.bnum }&category=${pageInfo.category}&keyword=${pageInfo.keyword}&pageNumber=${bookInfo.pageNumber}&pageSize=${bookInfo.pageSize}"><button class="btn btn-outline-dark">상세 보기</button></a>
							<span id="close" onclick="span_close(${book.bnum})"><input type="button" class="btn btn-outline-dark" value="닫기"  style="width:100px;"></span>
							<c:if test="${userId eq 'admin'}">
							<a href = "delete.bs?bnum=${book.bnum }&category=${pageInfo.category}&keyword=${pageInfo.keyword}&pageNumber=${bookInfo.pageNumber}&pageSize=${bookInfo.pageSize}" class="btn btn-outline-dark">삭제
							</a></c:if>
							</div>
					</div>
				</div>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>
</div>
	<br><br>
</body>
		<hr style="border: solid 1px #368AFF;">
					${pageInfo.pagingHtml}
</html>