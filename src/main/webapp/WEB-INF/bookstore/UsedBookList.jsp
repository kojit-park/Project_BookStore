<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.center-block() {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.container {
  width: 70%;
  .center-block();
}

</style>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/bootstrap.min.css">
<script type="text/javascript" src ="${pageContext.request.contextPath}/resources/js/searchScript.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

</head>
<body>
<div align="center"><a href="main.bs"><img src="${pageContext.request.contextPath}/resources/Img/Logo/3.jpg" width="200" height="100"/></a></div>
<div class = "container" style="padding-left: auto;padding-right: auto;">
	<table class="table table-striped">
	
	<tr>
		<td>판매자</td>
		<td>가격</td>
		<td>연락처</td>
	</tr>
	
	<c:forEach items="${usedBook }" var="us">
		<tr>
			<td>${us.user }</td>
			<td>${us.priceWanted } krw</td>
			<td>${us.contactNumber }</td>
		</tr>
	</c:forEach>
	</table>
</div>

</body>
</html>