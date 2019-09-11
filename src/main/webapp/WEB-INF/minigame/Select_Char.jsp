<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "minigame_select.mg" method="post">
플레이어 캐릭터:
<select name="category">
	<option value="title">제목</option>
	<option value="ISBN">ISBN</option>
	<option value="author">작가</option>
</select>
<input type="text" name="keyword" ><br><br>

상대 캐릭터:
<select name="category2">
	<option value="title">제목</option>
	<option value="ISBN">ISBN</option>
	<option value="author">작가</option>
</select>
<input type="text" name="keyword2" ><br>
<input type="submit" name="선택 완료">
</form>

</body>
</html>