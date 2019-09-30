<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tagsIn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/CSS/bootstrap.min.css" rel="stylesheet">
<link href="resources/CSS/custom2.css" rel="stylesheet">
<title>Gift Insert</title>
<style type="text/css">
.err {
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

.btn:focus{
	background-color: #4572ed;
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

select {
	padding: 6px 16px;
	box-sizing: border-box;
	-webkit-appearance: none;
	height: 37px;
	width: 120px;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
}

input:focus {
	outline: 0;
	border: solid 1px #4572ed;
	
}

table {
	border-top: solid 1px #A6A6A6;
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
	<!-- insert.gt=>GiftInsert.jsp -->
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

<form:form commandName="gift" method="post" action="insert.gt" enctype="multipart/form-data">
		<div class="container">
			<div class="jumbotron">
				<h1>사은품 추가</h1>
			</div>
		</div>
		<hr>
		<div style="height: 30px;"></div>
		
		<table border="1" align="center" height="300px">
		<tr>
			<td>
			<label for="gname">사은품명</label>
			</td>
			<td>
			<input type="text" name="gname" value="물건" onfocus="this.value=''">
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
			<input type="text" name="gcontents" value="사은품입니다." onfocus="this.value=''">
			<form:errors cssClass="err" path="gcontents" />
			</td>
		</tr>	
		<tr>
			<td>
			<label for="gpoint">포인트</label>
			</td>
			<td>
			<input type="text" name="gpoint" id="gpoint" placeholder="숫자만 입력하세요"/>
			<form:errors cssClass="err" path="gpoint"></form:errors>
			</td>
		</tr>
		<tr>
			<td>
			<label for="day">등록일</label>
			</td>
			<td>
			<input type="text" name="day" placeholder="2019/01/01" onfocus="this.value=''">
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