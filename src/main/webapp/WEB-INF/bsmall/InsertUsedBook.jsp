<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
</style>

</head>
<body>

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