<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="./../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<c:set value="${sessionScope.mobile}" var="mobile"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/CSS/bootstrap.min.css" rel="stylesheet">
<link href="resources/CSS/custom2.css" rel="stylesheet">
<style type="text/css">
table {
	border-top: solid 1px #A6A6A6;
	background-color: white;
	border-collapse: collapse;
	width: 900px;
	margin: 10px;
}

th, td, tr {
	border-bottom: solid 1px #A6A6A6;
	padding: 10px;
}

textarea {
	margin: 10px;
	background-color: #e3f2fd;
	border-radius: 5px;
	border: none;
}

.btn {
	background-color: #368AFF;
	color: white;
	padding: 10px 20px;
	border: none;
	text-decoration: none;
	border-radius: 5px;
}

button {
	display: inline-block;
}
a{
	text-decoration: none;
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
<title>Review Detail</title>

</head>
<body>
<div class="top_header">
	<div class="top_header_contents">
		<div class="top_right">
			<ul style="display: inline-block;text-align: left; margin-right: -8px;">
				<li style="float: left;position: relative;margin: 5px ;color: #757575;">${userId}님</li>
				<li style="float: left;position: relative;margin: 5px ;color: #757575;">
					<a href="logOut.bm" style="color: #757575;">로그아웃</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="logo" align="center" style="margin: 0;">
	<a href="main.bs"><img alt="홈으로" src="resources/Img/Logo/3.jpg" width="100px;"></a>
</div>
<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">

	<center>
<table>
	<tr>
		<td colspan="4" align="center">
			<c:choose>
				<c:when test="${review.booktitle ne '잡담' }">
					<a href = "list.bs?category=title&keyword=${review.booktitle}&${mobile}">${review.booktitle}</a>
				</c:when>
							
				<c:otherwise>
					${review.booktitle}
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td align="center">작성자</td>
		<td align="left">${review.writer }</td>
		<td align="center">작성일</td>
		<td align="left">${review.regdate}</td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td colspan="3">${review.subject }</td>
	</tr>
	
	<tr>
		<td colspan="4" align="center"><textarea class="form-control" rows="10" cols="50"
			disabled="disabled" style="margin: 0px 11px 0px 0px; height: 200px; width: 511px;">${review.content}</textarea></td>
	</tr>
	
</table>
	
	<c:if test="${review.writer eq userId }">
		<button class="btn btn-outline-dark" onclick="location.href='update.rv?rnum=${review.rnum}&category=${category}&keyword=${keyword}'">수정</button>
		<button class="btn btn-outline-dark" onclick="location.href='delete.rv?rnum=${review.rnum}&category=${category}&keyword=${keyword}'">삭제</button>
	</c:if>
	<button onclick="location.href='list.rv?category=${category}&keyword=${keyword}'" class="btn">목록으로</button>					
<br><br><br>
<br><br><br>
<hr style="border: 1px solid #bdbdbd;">
	<%@include file="../reply/Reply_List.jsp" %>
	</center>
</body>
</html>