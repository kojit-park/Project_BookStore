<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<style type="text/css">
	button{
		width: 100px;
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

<title>Mini game</title>

</head>

<body>
<div class="top_header">
	<div class="top_header_contents">
		<div class="top_right">
			<ul style="display: inline-block;text-align: left; margin-right: -8px;">
				<li style="float: left;position: relative;margin: 5px ;color: #757575;">${userId}님</li>
				<li style="float: left;position: relative;margin: 5px ;">
					<a href="logOut.bm" style="color: #757575;">로그아웃</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="logo" align="center" style="margin: 0;">
	<a href="main.bs"><img alt="홈으로" src="resources/Img/Logo/3.jpg" width="100px;"></a>
</div>
<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">


<div div class="form-group" style="margin-top: 2%;margin-left: 5%;">
	<div style="float:left; width: 40%; text-align: center;">
		<canvas id="healthBar" height="20" width="300"></canvas><br>
		<div><span id="health">${mini1.hp }</span>/ ${mini1.hp }</div><br>
		<h2><b>플레이어</b></h2><br>
		<div id="stats">
		</div><br>
		<img id="myImg" src="${pageContext.request.contextPath}/resources/Img/${mini1.title}.jpg" width =150 height =200 style="border:1pt solid black">
		<br><br>
		
		<table style="margin: auto;">
			<tr>
				<td>
				<button onclick="ActionTeacher('atk')" class="btn btn-primary" name="atk" value="atk" style="width:30">공격 Qq </button>
				</td>
				<td>
				<button onclick="ActionTeacher('smash')" class="btn btn-success" name="smash" value="smash" style="width:30">강공격 Ww</button>
				</td>
			</tr>
			<tr>
				<td>
				<button onclick="ActionTeacher('parring')" class="btn btn-warning" name="parring" value="parring" id="parring" style="width:30">방어 Ee</button>
				</td>
				<td>
				<button onclick="ActionTeacher('avoid')" class="btn btn-danger" name="avoid" value="avoid" style="width:30">회피 Rr</button>
				</td>
			</tr>
		</table>
	</div>

	<div style="float:left; margin-left: 3%; margin-top: 10%;">
	다음 선택까지 <div id ="stopwatch" style="float:none;" >
	
	</div> 남았습니다
	</div>
	
	<div style="float:left; margin-left: 5%; width: 35%; text-align:center;">
		<canvas id="enemyHealthBar" height="20" width="300"></canvas><br>
		<div><span id="enemyHealth">${mini2.hp}</span>/ ${mini2.hp}</div><br>
		<h2><b>상대</b></h2><br>
		<div id="enemyStats"></div><br>
		<img id="enemyImg" src="${pageContext.request.contextPath}/resources/Img/Char/${mini2.property}.jpg" style="border: 1pt solid red" width =150 height =200>
		<br><br>
		</div>
</div>
<%@include file="MiniGameLogic.jsp" %>


</body>
</html>