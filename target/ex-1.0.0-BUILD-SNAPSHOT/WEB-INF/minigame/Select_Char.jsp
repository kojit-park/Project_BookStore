<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../tagsIn.jsp" %>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<style type="text/css">
	#submitButton{
		align-items: center;
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
th{
	color: white;
}
</style>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

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
		
		<form action = "minigame_select.mg" method="post" class="container">
					<hr style="border: solid 1px #368AFF;">
				<div class="input-group">
					<span class="input-group-addon">플레이어 캐릭터 선택</span>
						<select name="category" class="form-control" >
							<option value="title">제목으로 캐릭터 검색</option>
							<option value="ISBN">ISBN으로 캐릭터 검색</option>
							<option value="author">작가로 캐릭터 검색</option>
						</select>
					<input type="text" name="keyword" class="form-control" placeholder = "미입력시 가장 약한 캐릭터">
					
				</div>
				
			<br><br>
			<hr style="border: solid 1px #368AFF;">
			
				<div class="input-group">
					<span class="input-group-addon">상대 캐릭터 선택</span>
						<select name="category2" class="form-control" >
							<option value="title">제목으로 캐릭터 검색</option>
							<option value="ISBN">ISBN으로 캐릭터 검색</option>
							<option value="author">작가로 캐릭터 검색</option>
						</select>
					<input type="text" name="keyword2" class="form-control" placeholder = "미입력시 가장 약한 상대"><br>
				</div>
					
		<hr style="border: solid 1px #368AFF;">
			<div id="submitButton" class="container" >
				<input type="submit" name="선택 완료" value="게임 시작" class="btn btn-primary btn-lg">
			</div>
		</form>
</body>
</html>