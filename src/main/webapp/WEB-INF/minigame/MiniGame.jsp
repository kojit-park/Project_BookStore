<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

<div style="float:left; margin-left: 20; width: 35%; text-align: center;">
	<canvas id="healthBar"></canvas><br>
	<div><span id="health">${mini1.hp }</span>/ ${mini1.hp }</div><br>
	플레이어<br>
	<img id="myImg" src="${pageContext.request.contextPath}/resources/Img/${mini1.title}.jpg" width =150 height =200>
	<br><br>
	
	<table style="margin: auto;">
		<tr>
			<td>
			<button onclick="ActionTeacher('atk')" name="atk" value="atk" style="width:30">공격 Qq </button>
			</td>
			<td>
			<button onclick="ActionTeacher('smash')" class = "actions" name="smash" value="smash" style="width:30">강공격 Ww</button>
			</td>
		</tr>
		<tr>
			<td>
			<button onclick="ActionTeacher('parring')" class = "actions" name="parring" value="parring" style="width:30">방어 Ee</button>
			</td>
			<td>
			<button onclick="ActionTeacher('avoid')" class = "actions" name="avoid" value="avoid" style="width:30">회피 Rr</button>
			</td>
		</tr>
	</table>
	<div id="stats">
	</div>
</div>

<div style="float:left; margin-left: 50; margin-top: 100px">
다음 선택까지 <div id ="stopwatch" style="float:none;" >

</div> 남았습니다
</div>

<div style="float:left; margin-left: 100; width: 35%; text-align: center;">
	<canvas id="enemyHealthBar"></canvas><br>
	<div><span id="enemyHealth">${mini2.hp}</span>/ ${mini2.hp}</div><br>
	상대<br>
	<img id="enemyImg" src="${pageContext.request.contextPath}/resources/Img/Char/${mini2.property}.jpg" width =150 height =200>
	<br><br>
	<div id="enemyStats"></div>
</div><br>

<%@include file="MiniGameLogic.jsp" %>


</body>
</html>