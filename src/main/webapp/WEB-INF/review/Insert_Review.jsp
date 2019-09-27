<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./../resources/CSS/nanumgothic.css" />
<link href="resources/CSS/bootstrap.min.css" rel="stylesheet">
<link href="resources/CSS/custom2.css" rel="stylesheet">
<title>Review Insert</title>
<style type="text/css">
form{
	margin: 0 auto;
	width: 900px;
	text-align: center;
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
table {
	border-top: solid 1px white;/* #A6A6A6 */
	border-collapse: collapse;
	margin-top: 20px;
}

th, td, tr {
	border-bottom: solid 1px white;
	padding: 10px;
	height: 20px;
}
textarea {
	margin: 10px;
	background-color: #e3f2fd;
	border-radius: 5px;
	border: none;
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
		<h1>리뷰쓰기</h1>
	</div>
</div>
		<hr>

<form action = "insert.rv" method="post">
	<input type="hidden" name="writer" value="${userId }">
	<table border="0" align="center">
		<tr>
			<th>주제 : </th>
			<td><input type="text" name = "booktitle" placeholder="주제를 입력하세요" value="${booktitle }"></td>
		</tr>
		
		<tr>
			<th>제목: </th>
			<td><input type="text" name="subject" placeholder="제목을 입력하세요"></td>
		
		<tr><th>내용:</th>
			<td><textarea name = "content" style = "margin: 0px 11px 0px 0px; height: 200px; width: 511px;" placeholder = "내용을 입력하세요"></textarea></td>
		</tr>
		
		<tr><td colspan="2"><input type="submit" value="리뷰 쓰기" class="btn"></td></tr>
	</table>	
		
</form>


</body>
</html>