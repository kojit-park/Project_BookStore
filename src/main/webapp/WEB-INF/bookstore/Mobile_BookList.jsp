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
	a { 
		text-decoration:none !important;
	} 
	
</style>

<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/bootstrap.min.css">
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/jquery.mobile-1.4.5.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.mobile-1.4.5.js"></script>
</head>
<body>
	<section id="page${book.bnum }" data-role="page">
		<header data-role="header">
			<div align="center"><a href="main.bs"><img src="${pageContext.request.contextPath}/resources/Img/Logo/5.jpg" width="200" height="100"/></a></div>
			<div style="text-align: center;">
			<form name="frm" action="list.bs">
						<select name="category" onchange="this.form.submit()" >
							<option value="title">정확도</option>
							<option value="pubdate">신상품</option>
							<option value="price">가격</option>
						</select>
						<input type="hidden" value="sorting" name="sorting">
				<input type="hidden" value="${pageInfo.keyword }" name="keyword">
			</form></div>
		</header>

		<c:choose>
				<c:when test="${totalCount == 0 }">
					<div>찾으시는 책이 없습니다</div>
				</c:when>
			<c:otherwise>
				<c:forEach items="${bookLists }" var="book">
					<table class="content" data-role="content" >
						<tr>
							<td>
								 <a href="#modal${book.bnum }" data-rel="dialog">
								 <img id="bookImage${book.bnum }" src='<c:url value="/resources/Img/${book.title}.jpg"/>' width="300" height="400"></a>
							</td>
							<td>
								<table style="text-align: left;padding-left: 10%">
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
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</div>
			<div>${pageInfo.pagingHtml}</div>
	</section>
		

</body>
</html>