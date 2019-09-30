<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<style type="text/css">
.layer{
  position:absolute;
  top:38%;
  left:38%;
  width:450px;
  height:auto;
  margin:-50px 0 0 -50px;
}
font{
font-family: 'Nanum Gothic', sans-serif; 
font-size: 15px;
font-weight: bold;
}
.font-t{
/* font-family: 'Nanum Gothic', sans-serif; */ 
font-family: 'Nanum Gothic', sans-serif;
font-size: 35px;
font-weight: normal;
}
tr,td{
text-align: center;
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
<div class="layer">
<form action="usedBook.bsmall" method="post">
<table class="table" frame="void" align="center">
	<tr>
		<td colspan="2" align="center" width="450px" style=" margin: 0px; border-spacing: 0px; padding: 0px; text-align: center;">
		<font class="font-t">중고등록<br></font>
		</td>
	</tr>
	<tr>
	<td width="150px" style="vertical-align: middle">
		<font>ISBN</font>
	</td>
	<td width="300px" style="vertical-align: middle">
		<input type="text" name="ISBN" style="width:200px;">
	</td>
	</tr>
	<tr>
	<td align="left" width="150px" style="vertical-align: middle">
		<font>가격 </font>
	</td>
	<td width="300px" style="vertical-align: middle">
		<input type="text" name="price" style="width:200px;">
		<br>
	</td>
	</tr>
	<tr>
	<td colspan="2" align="right" style="text-align: right">
	<button type="submit" id="calcFrm" class="btn btn-outline-dark"><font style="font-weight: bold;">등록</font></button>
	</td>
	</tr>
</table>
</form>
</div>

</body>
</html>