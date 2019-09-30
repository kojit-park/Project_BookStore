<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tagsIn.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<c:set value="${sessionScope.loginfo.id}" var="userId"/>

<style type="text/css">
body {font-family: 'Nanum Gothic', sans-serif; font-size: 12px;}
.table {
    width: 1000px;
    border-top: 1px solid #EAEAEA;
    border-collapse: collapse;
  }
th, td {
    border-bottom: 1px solid #EAEAEA;
    padding: 10px;
  }
th{
	text-align:center;
}
h1{
	font-size: 35px;
}
.bb{
	text-align : right;
}
.glyphicon {
    font-size: 50px;
}
.cc{
	font-family: font-family: 'Comfortaa', cursive;
	font-size: 15px;
}
.tt{
	width : 1000px;
	frame : void;
}
.tit{
	font-family: 'Nanum Gothic', sans-serif, bold;
	font-size : 15px;
}
a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
}
.gray{
	color : #EAEAEA;
	 text-shadow: 0 0 5px gray;
}
.glyphicon {
    font-size: 30px;
}
th{
	font-size: 13px;
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
<title>주문 내역</title>
<script type="text/javascript">
function insertUsedBook(){
	location.href = "usedBook.bsmall";
}
function bingo(){
	location.href = "bingo.bsmall";
}
$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) {
            $('#MOVE_TOP_BTN').fadeIn();
        } else {
            $('#MOVE_TOP_BTN').fadeOut();
        }
    });
    
    $("#MOVE_TOP_BTN").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
});

</script>
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
					<li style="float: left;position: relative;margin: 5px ;color: #757575;">${sessionScope.loginfo.id}님</li>
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
갯수 : ${fn:length(lists) }<br>
<br><br>
	<a id="MOVE_TOP_BTN" href="#"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true" style="color:gray"></span></a>
	<h1 align="center">주문 내역</h1>
	<br>
	<table class="table" align="center">
		<tr>
			<td colspan="4" style="vertical-align: middle;">
				<span style="float:left;width:49%;">
				<button type="button" class="btn btn-outline-dark" onclick="bingo()"><font style="font-weight: bold;">빙고</font></button> &nbsp;
				<button type="button" class="btn btn-outline-dark" onclick="insertUsedBook()"><font style="font-weight: bold;">중고서적 등록</font></button>
				<a href = "registeredBookList.bs" rel="external" class="btn btn-outline-dark">내가 등록한 중고서적</a>
				</span> 
				<span style="float:right;"><b class="bb" style="vertical-align: middle;">주문자 정보 : ${sessionScope.loginfo.name}(${sessionScope.loginfo.id})</b></span>	
			</td>
		</tr>	
		<tr>
			<th>주문 번호</th>
			<th colspan="2">주문 내용</th>
			<th>리뷰쓰기</th>
		</tr>
		<c:forEach items="${lists}" var="shopinfo">
			<tr>
				<td align="center" style="vertical-align: middle">
					<font style="font-weight: bold;">${shopinfo.oid}</font>
				</td>				
				<td width="180px">
					<a href="detail.bs?bnum=${shopinfo.bnum}"><img id="bookImage${shopinfo.bnum }" src='<c:url value="/resources/Img/${shopinfo.title}.jpg"/>' width="100" height="150"></a>
				</td>
				<td style="text-align: left; vertical-align: middle;">
					<font class="tit" style="font-weight: bold;">${shopinfo.title}</font><br><br>
					<font>저자 : ${shopinfo.author}</font><br>
					<font>가격 : <fmt:formatNumber value="${shopinfo.price}" type="number" /> &nbsp;&nbsp; 
					수량 : ${shopinfo.qty } &nbsp;&nbsp; 
					총가격: <fmt:formatNumber value="${shopinfo.price * shopinfo.qty}" type="number" /></font><br>
					<font>주문일 : ${shopinfo.orderdate}</font>
				</td>
				<td align="center" style="vertical-align: middle">
					<a href="insert.rv?booktitle=${shopinfo.title}">리뷰쓰기</a>
				</td>				
			</tr>
		</c:forEach>		
	</table>	
			
</body>
</html> 










