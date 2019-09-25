<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 td{
 	padding-left: 20%;
 	padding-right: 10%;
 	}
</style>

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
<div align="center"><a href="main.bs"><img src="${pageContext.request.contextPath}/resources/Img/Logo/3.jpg" width="200" height="100"/></a></div>
<hr style="border: solid 1px #368AFF;">
<table>
	<tr>
		<td><img src='<c:url value="/resources/Img/${book.title}.jpg"/>' width="400" height="600"></td>
		
		<td>
			<form action="add.bsmall">
				<table style="border-top: dashed 1px #368AFF; border-bottom: dashed 1px #368AFF;">
					<tr>
						<td width="800"><h1>${book.title }</h1></td>
					</tr>
					<tr>
						<td>${book.category} </td>
					</tr>
					<tr>
						<td>${book.author} 지음 | ${book.publisher }</td>
					</tr>
					<tr>
						<td>${book.pubdate} 출간 </td>
					</tr>
					<tr>
						<td><button type="button" onclick = "searchReview()">리뷰 보러가기</button></td>
					</tr>
					<tr>
						<td>가격 : <h3>${book.price }원</h3> </td>
					</tr>
					<tr>
						<td>주문 수량 <input type="number" name="oqty" value=1></td>
					</tr>
					<tr>
						<c:if test="${userId != null}">
						<td>
						<input type="hidden" value="${book.bnum }" name="bnum">
						<input type="submit" value="장바구니 담기">
						</td></c:if>
					</tr>
				</table><br>
			</form>
		<c:if test="${usedBookMarket }"><button onclick="usedBookMarket()">중고 마켓</button></c:if>
		</td>
	</tr>

</table>
		<h2 style="padding-left: 10%;">책소개</h2>
		<hr style="border: solid 1px #368AFF;">
		<div style="padding-left: 10%;padding-right: 20%">${fn:replace(bookIntroduce,". ",".<br>")}</div>
		<br><br>

</body>
</html>