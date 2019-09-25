<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../tagsIn.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 내역</title>
<script type="text/javascript">
function insertUsedBook(){
	location.href = "usedBook.bsmall";
}

</script>
</head>
<body>
갯수 : ${fn:length(lists) }<br>

<button onclick="location.href = 'logOut.bm'">로그아웃</button>
<br><br>
	<h2 align="center">주문 내역</h2>
	<table border="1" align="center">
		<tr>
			<td colspan="4" align="center">
				주문자 정보 : ${sessionScope.loginfo.name}(${sessionScope.loginfo.id})
			</td>
		</tr>	
		<tr>
			<th>주문 번호</th>
			<td></td>
			<th>주문 내용</th>
			<th>리뷰쓰기</th>
		</tr>
		<c:forEach items="${lists}" var="shopinfo">
			<tr>
				<td align="center">
					${shopinfo.oid}
				</td>				
				<td>
					<a href="detail.bs?bnum=${shopinfo.bnum}"><img id="bookImage${shopinfo.bnum }" src='<c:url value="/resources/Img/${shopinfo.title}.jpg"/>' width="100" height="150"></a>
				</td>
				<td align="center">
					${shopinfo.title}<br>
					<font style="text-align: left">${shopinfo.author}</font><br>
					가격 : ${shopinfo.price} &nbsp;&nbsp;
					수량 : ${shopinfo.qty } &nbsp;&nbsp;
					총가격: ${shopinfo.price * shopinfo.qty}<br>
					${shopinfo.orderdate}<br>
				</td>
				<td align="center">
				<a href="insert.rv?booktitle=${shopinfo.title}">리뷰쓰기</a>
				</td>				
			</tr>
		</c:forEach>		
	</table>	
			
	<button onclick="insertUsedBook()">중고서적 등록</button>
	<a href = "registeredBookList.bs" rel="external">내가 등록한 중고서적</a>
	<a href = "bingo.bsmall" rel="external">Bingo</a>
</body>
</html> 










