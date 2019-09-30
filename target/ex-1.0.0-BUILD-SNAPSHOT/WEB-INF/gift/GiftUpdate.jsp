<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tagsIn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./../resources/CSS/nanumgothic.css" />
<link href="resources/CSS/bootstrap.min.css" rel="stylesheet">
<link href="resources/CSS/custom2.css" rel="stylesheet">
<title>Gift Update</title>
<style type="text/css">
	.err{
	font-size: 9pt;
	color: red;
	font-weight: bold;
	}
	.btn {
	background-color: #368AFF;
	color: white;
	padding: 10px 20px;
	border: none;
	text-decoration: none;
	border-radius: 5px;
}
 
input {
	border: solid 1px #A6A6A6;
	padding: 10px 20px;
	box-sizing: border-box;
	border-radius: 3px;
}
input:focus {
	outline: 0;
	border: solid 1px #4572ed;
}

 table {
 	border-top:solid 1px #A6A6A6;
	background-color: white;
 	border-collapse: collapse; 
}
th, td, tr {
	border-bottom: solid 1px #A6A6A6;
	padding: 10px;
	height: 20px;
}
.top_header{
	border-bottom: 1px solid #e0e0e0;
}
.top_header .top_header_contents{
	display: table;
	position: relative;
	margin: 0 auto;
	width: 900px;
}

.top_header .top_header_contents .top_center{
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}
.top_header .top_header_contents .top_right{
	display: table-cell;
	vertical-align: middle;
	text-align: right;
}
ul, li, ol{ 
	list-style: none;
	margin: 0;
}
</style>
</head>
<body>
<!-- update.gt => GiftUpdate -->
<div class="top_header">
	<div class="top_header_contents">
		<div class="top_right">
			<ul style="display: inline-block;text-align: left; margin-right: -8px;">
				<li style="float: left;position: relative;margin: 5px ;color: #757575;">${userId}님</li>
				<li style="float: left;position: relative;margin: 5px ;color: #757575;">
					<a href="logOut.bm" style="color: #757575;">로그아웃</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="logo" align="center" style="margin: 0;">
	<a href="main.bs"><img alt="홈으로" src="resources/Img/Logo/3.jpg" width="100px;"></a>
</div>
<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">

<div class="container">
			<div class="jumbotron">
				<h1>수정 화면</h1>
			</div>
	</div>
	
<form:form commandName="gift" action="update.gt" method="post" enctype="multipart/form-data">

	<input type="hidden" name="num" value="${gift.gnum}">

<table border="0" align="center" width="60%">
	<tr>
		<td width="120">사은품명</td>
		<td width="180">
			<input type="text" name="gname" value="${gift.gname}">
			<form:errors cssClass="err" path="gname" />
		</td>
	</tr>
	<tr>
		<td width="120">이미지</td>
		<td width="180" align="left">
		
		<img src="<%=request.getContextPath() %>/resources/Img/Gift/${gift.gimage}.jpg" width="100px" height="100px"> 
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
		<td width="120">포인트</td>
		<td width="180"><input type="text" name="gpoint" value="${gift.gpoint}">
		<form:errors cssClass="err" path="gpoint" /></td>
	</tr>
	
	<tr>
		<td width="120">등록일</td>
		<td width="180">
			<input type="text" name="day" value="${gift.day}">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" width="300">
			<input type="submit" value="수정하기" class="btn">
		</td>
	</tr>
</table>
</form:form>
</body>
</html>