<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#submitButton{
		align-items: center;
		text-align: center;
	}

</style>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

</head>
<body>
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