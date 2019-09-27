<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="./../tagsIn.jsp" %>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BINGO</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Bungee+Inline&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<style type="text/css">
body,h1,h2,h3 {font-family: 'Nanum Gothic', sans-serif; text-align: center;}
tr,td{
text-align: center;
border-color: #BDBDBD;
}
.title{
font-family: 'Bungee Inline', cursive;
font-size: 65px;
font-weight: bold;
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
<script type="text/javascript">
$( document ).ready( function() {
	$("#mainFrm").on("click", function(){
		location.href="main.bs";
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
<br>
<br>
<table frame="void" align="center" width="420px">
	<tr>
	<td>
		<b style="font-size: 15px">3달마다 초기화 됩니다.</b><br>
		<b style="font-size: 12px">이벤트 기간: 8월 1일 ~ 10월 31일</b>
	</td>
	</tr>
</table>

<table border="3px" bordercolor="black" align="center" width="420px" cellspacing="2px" cellpadding="2px" style="text-align: center;">
	<tr style="border-bottom: 3px solid black">
		<td colspan="3" style=" margin: 0px; border-spacing: 0px; padding: 0px;">
			<font class='title' style=" color: #4672ED; vertical-align: middle">BINGO</font>
		</td>
	</tr>
	<tr>
		<td id="1" width="140px" height="140px;" style="background-color:#FFFFFF; vertical-align: middle;"><b id="bingo_1">1권 이상 구매</b></td>
		<td id="2" width="140px" height="140px;" style="background-color:#FFFFFF; vertical-align: middle;"><b id="bingo_2">'문학' 카테고리 구매</b></td>
		<td id="3" width="140px" height="140px;" style="background-color:#FFFFFF; vertical-align: middle; "><b id="bingo_3">'총류' '철학' '언어' '종교'</b></td>
	</tr>
	
	<tr>
		<td id="4" width="140px" height="140px;" style="background-color:#FFFFFF; vertical-align: middle; "><b id="bingo_4">2권 이상 구매</b></td>
		<td id="5" width="140px" height="140px;" style="background-color:#FFFFFF; vertical-align: middle; "><b id="bingo_5">출시 3달 이내 시간</b></td>
		<td id="6" width="140px" height="140px;" style="background-color:#FFFFFF; vertical-align: middle; "><b id="bingo_6">올해 출시된 책 구매</b></td>
	</tr>
	
	<tr>
		<td id="7" width="140px" height="140px;" style="background-color:#FFFFFF; vertical-align: middle; "><b id="bingo_7">3권 이상 구매</b></td>
		<td id="8" width="140px" height="140px;" style="background-color:#FFFFFF; vertical-align: middle; "><b id="bingo_8">'역사' '예술'</b></td>
		<td id="9" width="140px" height="140px;" style="background-color:#FFFFFF; vertical-align: middle; "><b id="bingo_9">'자연' '기술' '사회 과학'</b></td>
	</tr>
</table>
<br>
<table align="center" width="420px">
	<tr>
	<td align="right" style="text-align: right">
	<b style="font-size: 13px;">총 빙고갯수: ${count }줄</b> 
	</td>
	</tr>
</table>

<script>

	if(${bingo[0]}) {
		document.getElementById("1").style.backgroundImage = "url('<c:url value='/resources/Img/Bingo/JB.jpg' />')"
		document.getElementById("1").style.backgroundSize = "100% 100%";
	}
	if(${bingo[1]}){
		document.getElementById("2").style.backgroundImage = "url('<c:url value='/resources/Img/Bingo/JB.jpg' />')"
		document.getElementById("2").style.backgroundSize = "100% 100%";
	}
	if(${bingo[2]}){
		document.getElementById("3").style.backgroundImage = "url('<c:url value='/resources/Img/Bingo/JB.jpg' />')"
		document.getElementById("3").style.backgroundSize = "100% 100%";
	}
	if(${bingo[3]}){
		document.getElementById("4").style.backgroundImage = "url('<c:url value='/resources/Img/Bingo/JB.jpg' />')"
		document.getElementById("4").style.backgroundSize = "100% 100%";
	}
	if(${bingo[4]}){
		document.getElementById("5").style.backgroundImage = "url('<c:url value='/resources/Img/Bingo/JB.jpg' />')"
		document.getElementById("5").style.backgroundSize = "100% 100%";
	}
	if(${bingo[5]}){
		document.getElementById("6").style.backgroundImage = "url('<c:url value='/resources/Img/Bingo/JB.jpg' />')"
		document.getElementById("6").style.backgroundSize = "100% 100%";
	}
	if(${bingo[6]}){
		document.getElementById("7").style.backgroundImage = "url('<c:url value='/resources/Img/Bingo/JB.jpg' />')"
		document.getElementById("7").style.backgroundSize = "100% 100%";
	}
	if(${bingo[7]}){
		document.getElementById("8").style.backgroundImage = "url('<c:url value='/resources/Img/Bingo/JB.jpg' />')"
		document.getElementById("8").style.backgroundSize = "100% 100%";
	}
	if(${bingo[8]}){
		document.getElementById("9").style.backgroundImage = "url('<c:url value='/resources/Img/Bingo/JB.jpg' />')"
		document.getElementById("9").style.backgroundSize = "100% 100%"; 
	}
	
	
	
</script>

</body>
</html>