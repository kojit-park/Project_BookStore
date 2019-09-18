<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content{
		font-size:xx-large;
		align-content: center;
		padding-left: 10%;
	}
	.ui-dialog-contain{ 
	    width: 92.5%;
	  	max-width: 500px;
	  	margin: 10% auto 15px auto;
		padding: 0;
		position: relative;
		top: -15px;
	}
	.ui-popup-container { 
	width: 80%; 
	}
</style>

<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/jquery.mobile-1.4.5.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.mobile-1.4.5.js"></script>
</head>
<body>
	<section id="page${book.bnum }" data-role="page">
		<header data-role="header">
			<form action="list.bs">
				<select name="category">
					<option value="title">정확도</option>
					<option value="pubdate">신상품</option>
					<option value="price">가격</option>
				</select>
				<input type="hidden" value="${keyword }" name="keyword">
				<input type="hidden" value="sorting" name="sorting">
				<input type="submit" value="정렬">
			</form>
				<div><h1>${pageInfo.pagingHtml}</h1></div>
		</header>
		
		<c:choose>
				<c:when test="${totalCount == 0 }">
					<div>찾으시는 책이 없습니다</div>
				</c:when>
			<c:otherwise>
				<c:forEach items="${bookLists }" var="book">
					<table class="content" data-role="content">
						<tr>
							<td>
								 <a href="#modal${book.bnum }" data-rel="dialog">
								 <img id="bookImage${book.bnum }" src='<c:url value="/resources/Img/${book.title}.jpg"/>' width="300" height="400"></a>
							</td>
							<td>
								<table style="text-align: left;">
									<tr>
										<td><a href="detail.bs?bnum=${book.bnum }"><h1>${book.title }</h1></a></td>
									</tr>
									<tr>
										<td>${book.author } | ${book.publisher }</td>
									</tr>
									<tr>
										<td>${book.pubdate }</td>
									</tr>
									<tr>
										<td>${book.price } 원</td>
									</tr>
								</table>
							</td>
						</tr>
						
					
					</table>
				
						<%-- <div class = "pic" style="text-align: center;width:40%" >
							<div class="content" data-role="content">
						        <a href="#modal${book.bnum }" data-rel="dialog"><img id="bookImage${book.bnum }" src='<c:url value="/resources/Img/${book.title}.jpg"/>' width="300" height="400"></a>
					        </div>
					    </div> --%>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<footer data-role="footer"><h1>${pageInfo.pagingHtml}</h1></footer>
	</section>
	
		
					<c:forEach items="${bookLists }" var="book">
						<section id="modal${book.bnum }" data-role="page">
							<header data-role="header" data-add-back-btn="true"></header>
							<div class="content" data-role="content">
								<img src = "${pageContext.request.contextPath}/resources/Img/${book.title}.jpg" width =200 height =300 style="text-align: center"><br>
									제목: ${book.title } <br>
									저자: ${book.author } <br>
									출판사: ${book.publisher } <br>
									출판년도: ${book.pubdate }<br>
									책소개: ${book.page } page, <br>
									${book.introduce }... <br>
									분류: ${book.category } <br>
									재고: ${book.stock } <br>
									<a href="detail.bs?bnum=${book.bnum }"><button>상세 보기</button></a>
									<footer data-role="footer"><a class="ui-shadow ui-btn ui-corner-all ui-mini" data-rel="back">취소</a></footer>
							</div>
						</section>
					</c:forEach>
		
		
	
	
	

</body>
</html>