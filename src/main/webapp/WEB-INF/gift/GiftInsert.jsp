<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tagsIn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.err{
	font-size: 9pt;
	color: red;
	font-weight: bold;
	}
</style>
</head>
<body>
<!-- insert.gt=>GiftInsert.jsp -->
<form:form commandName="gift" method="post" action="insert.gt" enctype="multipart/form-data">
		<h1 align="center">사은품 추가</h1>
		<table border="1" align="center" height="300px">
		<tr>
			<td>
			<label for="gname">사은품명</label>
			</td>
			<td>
			<input type="text" name="gname" value="물건" >
			<form:errors cssClass="err" path="name" />
			</td>
		</tr>
		<tr>
			<td >
			<label for="upload">이미지</label>
			</td>
			<td>
			<input type="file" name="upload" value="" >
			<form:errors cssClass="err" path="gimage" />
			</td>
		</tr>
		
		<tr>
			<td>
			<label for="gcategory">카테고리</label>
			</td>
			<td>
			<input type="radio" name="gcategory" id="gcategory" value="ebook"/>ebook
			<input type="radio" name="gcategory" id="gcategory" value="서적"/>서적
			<form:errors cssClass="err" path="gcategory"></form:errors>
			</td>
		</tr>
		<tr>
			<td width="120">
			<label for="gcontents">설명</label>
			</td>
			<td>
			<input type="text" name="gcontents" value="사은품입니다.">
			<form:errors cssClass="err" path="gcontents" />
			</td>
		</tr>	
		<tr>
			<td>
			<label for="day">등록일</label>
			</td>
			<td>
			<input type="text" name="day" value="2019/01/01">
			</td>
		</tr>		
		
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="추가하기">		
			</td>
		</tr>	
		</table>
	</form:form>

</body>
</html>