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

<table>
	<tr>
		<td><img src='<c:url value="/resources/Img/${book.title}.jpg"/>'></td>
		
		<td>
			<form action="add.bsmall">
				<table>
					<tr>
						<td><h1>${book.title }</h1></td>
					</tr>
					<tr>
						<td>${book.category} </td>
					</tr>
					<tr>
						<td>${book.author} 지음 | ${book.publisher }</td>
					</tr>
					<tr>
						<td>${book.pub_date} 출간 </td>
					</tr>
					<tr>
						<td>리뷰 : </td>
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
		책소개: <br>
		${bookIntroduce }
		<br><br>
		</td>
	</tr>

</table>

</body>
</html>