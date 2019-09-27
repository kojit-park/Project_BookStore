<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/jquery.mobile-1.4.5.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.mobile-1.4.5.js"></script>
<script type="text/javascript">

function usedBookMarket(){
	location.href = "usedBookList.bs?bnum="+${book.bnum}
}
function searchReview(){
	location.href='list.rv?category=booktitle&keyword='+"${fn:substring(book.title,0,4)}"
}
</script>
</head>
<body>
<section id="page1" data-role="page">
    <header data-role="header">
    	<div align="center"><a href="main.bs"><img src="${pageContext.request.contextPath}/resources/Img/Logo/5.jpg" width="200" height="100"/></a></div>
    	<div style="text-align: center;"><img src='<c:url value="/resources/Img/${book.title}.jpg"/>' style="width:400; height:550;"><br></div>
    	<h1>${book.title }</h1>
    </header>       
                
    <div class="content" data-role="content" style="padding-left: 20%; padding-right: 30%; font-size: 30px; background-color: #E6E6E6">
       ${book.category}<br>
       ${book.author} 지음 | ${book.publisher }<br>
       ${book.pubdate} 출간<br>
       가격 : <b>${book.price }원</b>
		<button type="button" onclick = "searchReview()">리뷰 보러가기</button>
       <form action="add.bsmall">
       <c:if test="${userId != null}">
       주문 수량 <input type="number" name="oqty" value=1>
			<input type="hidden" value="${book.bnum }" name="bnum">
			<input type="submit" value="장바구니 담기">
			</c:if>
       </form><br>
       <c:if test="${usedBookMarket }"><button onclick="usedBookMarket()">중고 마켓</button></c:if>
    </div>
    <footer data-role="footer">
    <div style="font-size: 20px">
    <br>
    <h2 style="padding-left: 10%;">책소개</h2>
    <hr style="border: solid 1px #368AFF;">
			<div style="padding-left: 10%;padding-right: 10%">${fn:replace(bookIntroduce,". ",".<br>")}</div><br>
    </div>
		
	</footer>
</section>

</body>
</html>