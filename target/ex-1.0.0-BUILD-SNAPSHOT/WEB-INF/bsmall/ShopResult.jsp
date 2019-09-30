<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../tagsIn.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">

<style type="text/css">
body {
font-family: 'Nanum Gothic', sans-serif; 
font-size: 14px;
}
tr,th{
text-align: center;
}
img{
margin: 1px;
}
.table{
width:1000px;
}
.table {
    width: 1000px;
    border : 1px solid #EAEAEA;
  }
th, td {
    border-bottom: 1px solid #EAEAEA;
    padding: 10px;
  }
.btn-outline-dark{
	border-color: #EAEAEA;
}
h1{
	font-size: 35px;
}
.bb{
	text-align : right;
}
div{
	font-size: 35px;
	font-family: 'Nanum Gothic'
}
.gray{
	color : #EAEAEA;
	 text-shadow: 0 0 5px gray;
}
.glyphicon {
    font-size: 50px;
}
.fs{
	font-family: 'Nanum Gothic', sans-serif; 
	font-size: 13px;
}

</style>
<script type="text/javascript">
$( document ).ready( function() {
	$("#listFrm").on("click", function(){
		location.href="list.bs";
	});

	$("#mainFrm").on("click", function(){
		location.href="main.bs";
	});
});
</script>
</head>
<!-- session 설정 : 계속 상태유지, model은 한 번 사용하고 유지하지 않을 때  -->
<body>
	<br><br>
	<table align="center" class="table">
	<tr>
	<td>
	<span class="glyphicon glyphicon-check" aria-hidden="true" style="color:gray"></span><br><br>
	<b>결제가 정상적으로 완료되었습니다.</b>
	</td>
	</tr>
	</table>
	<br>
	
	<table frame="void" align="center" width="1020px" style="text-align:'left'">
	<tr>
	<td style="text-align: left"><b>결제정보</b></td>
	</tr>
	</table>
	<table align="center" class="table">
	<tr>
	<td width=200px; style="text-align: center; background-color: #EAEAEA">
	<font style="font-weight: bold; font-size: 13px">구매자</font>
	</td>
	<td width=800px;>
	<font class="fs">${sessionScope.loginfo.name}(${sessionScope.loginfo.id})</font>
	</td>
	</tr>
	<tr>
	<td width=200px; style="text-align: center; background-color: #EAEAEA">
	<font style="font-size: 13px; font-weight: bold";>결제금액</font>	
	</td>
	<td width=800px;>
	<font class="fs"><fmt:formatNumber value="${sessionScope.totalAmount}" type="number" /></font>
	</td>
	</tr>
	<tr>
	<td width=200px; style="text-align: center; background-color: #EAEAEA">
	<font style="font-weight: bold; font-size: 13px">결제시간</font>
	</td>
	<td width=800px;>
	<font class="fs">${sessionScope.orderdate}</font>
	</td>	
	</tr>
	</table>
	<br>
	<table frame="void" align="center" width="1020px">
	<tr>
	<td align="right">
	<button type="button" id="listFrm"class="btn btn-outline-dark">추가주문</button>
	<button type="button" id="mainFrm"class="btn btn-outline-dark">메인으로</button>
	</td>
	</tr>
	</table>
</body>
</html>