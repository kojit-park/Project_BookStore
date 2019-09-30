<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 넣는 곳</title>
<link rel="stylesheet" href="./../resources/CSS/nanumgothic.css" />
<link href="resources/CSS/bootstrap.min.css" rel="stylesheet">
<link href="resources/CSS/custom2.css" rel="stylesheet">
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<style type="text/css">
a{
	text-decoration: none;
	color: #4572ed;
}
p{
	color:#828282; 
	margin-left: 10px;
}
hr {
	margin-top: 20px;
	margin-bottom: 50px;
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
select {
	padding: 6px 16px;
	box-sizing: border-box;
	 -webkit-appearance: none; 
	height:37px;
	width:120px;
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
}

input:focus {
	outline: 0;
	border: solid 1px #4572ed;
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
th{
	color: white;
}

</style>
</head>
<body>
<div class="top_header">
	<div class="top_header_contents">
		<div class="top_right">
			<ul style="display: inline-block;text-align: left; margin-right: -8px;">
				<c:if test="${userId == null}">
					<li style="float: left;position: relative;margin: 5px ;color: #757575;">
							<a href="login.bm" style="color: #757575;"><b>로그인</b></a>
					</li>
					<li style="float: left;position: relative;margin: 5px ;">
						<a href="insert.bm" style="color: #757575;"><b>회원가입</b></a>
					</li>
				</c:if>
				<c:if test="${userId != null}">
					<li style="float: left;position: relative;margin: 5px ;color: #757575;">${userId}님</li>
					<li style="float: left;position: relative;margin: 5px ;">
						<a href="logOut.bm" style="color: #757575;">로그아웃</a>
					</li>
				</c:if>		
			</ul>
		</div>
	</div>
</div>
<div class="logo" align="center" style="margin: 0;">
	<a href="main.bs"><img alt="홈으로" src="resources/Img/Logo/3.jpg" width="100px;"></a>
</div>
<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
	<center>
		<form action="insert.bs" method="post">
			<h2>추가하고 싶은 책의 ISBN을 입력하세요</h2>
			<br><br>
			<input type="text" name="ISBN">
			<input type="submit" value="추가">
		</form>
	</center>
</body>
</html>