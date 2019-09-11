<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tagsIn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사은품 수정 화면</title>
<style type="text/css">
	.err{
	font-size: 9pt;
	color: red;
	font-weight: bold;
	}
</style>
</head>
<body>
<!-- update.gt => GiftUpdate -->
<h2 align="center">수정 화면</h2>
<form:form commandName="gift" action="update.gt" method="post" enctype="multipart/form-data">

	<input type="hidden" name="num" value="${gift.gnum}">

<table border="1" align="center">
	<tr>
		<td width="120">사은품명</td>
		<td width="180">
			<input type="text" name="gname" value="${gift.gname}">
			<form:errors cssClass="err" path="gname" />
		</td>
	</tr>
	<tr>
		<td width="120">이미지</td>
		<td width="180" align="center">
		
		<img src="<%=request.getContextPath() %>/resources/${gift.gimage}" width="100px" height="100px"> 
		<input type="file" name="upload" id="upload" value="">
		<input type="hidden" name="upload2" id="upload" value="${gift.gimage}">
		<form:errors cssClass="err" path="gimage" />
		</td>
	</tr>
	<tr>
		<td width="120">카테고리</td>
		<td width="180">
			<input type="radio" name="gcategory" id="gcategory" value="ebook" <c:if test="${gift.gcategory=='ebook'}"> checked </c:if> >ebook
			<input type="radio" name="gcategory" id="gcategory" value="ebook" <c:if test="${gift.gcategory=='서적'}"> checked </c:if> >서적
			<form:errors cssClass="err" path="gcategory" />
		</td>
	</tr>
	<tr>
		<td width="120">설명</td>
		<td width="180"><input type="text" name="gcontents" value="${gift.gcontents}">
		<form:errors cssClass="err" path="gcontents" /></td>
	</tr>
	<tr>
		<td width="120">등록일</td>
		<td width="180">
			<input type="text" name="day" value="${gift.day}">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" width="300">
			<input type="submit" value="수정하기">
		</td>
	</tr>
</table>
</form:form>
</body>
</html>