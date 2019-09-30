<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="./../tagsIn.jsp" %>  
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<c:set value="${sessionScope.mobile}" var="mobile"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.btn {
	background-color: #368AFF;
	color: white;
	padding: 10px 20px;
	border: none;
	text-decoration: none;
	border-radius: 5px;
}

.btn:focus{
	background-color: #4572ed;
	color: white;
	padding: 10px 20px;
	border: none;
	text-decoration: none;
	border-radius: 5px;
}
input {
	border: solid 1px #A6A6A6;
	padding: 10px 20px;
	box-sizing: border-box;
	border-radius: 3px;
}

input:focus {
	outline: 0;
	border: solid 1px #4572ed;
	
}

table {
	border-top: solid 1px #A6A6A6;
	background-color: white;
	border-collapse: collapse;
}
table>tbody>tr:nth-of-type(odd) {
	background-color: #f9f9f9;
}
th, td, tr {
	border-bottom: solid 1px #A6A6A6;
	padding: 10px;
	height: 20px;
}
.search_input{
	margin:20px; 
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
th{
	color: white;
}
</style>
<title>Review List</title>
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

<center>
	<div class="search_input">
		<form action="list.rv">
			<input type="hidden" name="category" value="booktitle">
			<input type="text" name="keyword" placeholder="찾고싶은 주제를 입력하세요">
			<input type="submit" value="정렬" class="btn">
		</form>
	</div>
</center>

	<c:choose>
		<c:when test="${totalCount==0}">
			<div style="text-align: center;"><b>리뷰가 없습니다.</b></div><br><br>
		</c:when>
		<c:otherwise>
		
			<table border="0" align="center" width="900px;">
				<tr style="background-color: #368AFF;">
					<th>글 번호</th>
					<th>주제</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
					
				</tr>
				<c:forEach items="${reviewList}" var="review"> 
					<tr>
						<td align="center">
							${review.rnum}
						</td>				
						<td align="center">
							<c:choose>
								<c:when test="${review.booktitle ne '잡담' }">
									<a href = "list.bs?category=title&keyword=${review.booktitle}&mobile=${mobile}">${review.booktitle}</a>
								</c:when>
							
								<c:otherwise>
									${review.booktitle}
								</c:otherwise>
							</c:choose>
							
						</td>
						<td align="center">
							<a href = "detail.rv?rnum=${review.rnum}&category=${pageInfo.category}&keyword=${pageInfo.keyword}">${review.subject}</a>
							<c:if test="${review.replycount ne 0 }">[${review.replycount }]</c:if>
						</td>	
									
						<td align="center">
							${review.writer}
						</td>
						
						<td align="center">
							${review.readcount}
						</td>
						
						<td align="center">
							${review.regdate}
						</td>				
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	
	<center>
		<button onclick="location.href='insert.rv'" class="btn">리뷰 쓰기</button>
	</center>
</body>
</html>