<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tagsIn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gift List</title>
<link rel="stylesheet" href="./../resources/CSS/nanumgothic.css" />
<link href="resources/CSS/bootstrap.min.css" rel="stylesheet">
<link href="resources/CSS/custom2.css" rel="stylesheet">
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<style type="text/css">
a{
	text-decoration: none;
	color: #4572ed;
}
p{
	color:#828282; 
	margin-left: 10px;
}
hr {
	margin-top: 20px;
	margin-bottom: 50px;
}

h1 {
	color: #4572ed;
}

.btn {
	background-color: #368AFF;
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
select {
	padding: 6px 16px;
	box-sizing: border-box;
	 -webkit-appearance: none; 
	height:37px;
	width:120px;
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
}

input:focus {
	outline: 0;
	border: solid 1px #4572ed;
}

 table {
 	border-top:solid 1px #A6A6A6;
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
<script type="text/javascript">
	function insert(){
		location.href='insert.gt'; // GiftInsertController
	}
	function goUpdate(gnum ){
		location.href='update.gt?gnum=' +  gnum ; // GiftUpdateController get
	}
</script>
</head>
<body>
	<!-- list.gt=>GiftList.jsp -->
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

	<h2 align="center" style="color:#368AFF; ">리스트 화면</h2><br>
	<center>
	<form action="list.gt" method="get"> 
		<select name="category">
			<option value="all">전체 검색
			<option value="gname">사은품명
			<option value="gcontents">설명
		</select>
		<input type="text" name="keyword" value="">
		<input type="submit" value="검색" class="btn">
	</form>
	</center>
	
<br><br>

<form action = "calculate.bsmall">
	 <table border="1" border="0" align="center" width="900px">
		<c:if test="${userId ne null and userId eq 'admin' }">
			<tr>
				<td colspan="9" align="center">
					<input type="button" value="추가하기" onclick="insert();" class="btn">
				</td>
			</tr>
		</c:if>
		
		<tr style="background:#368AFF; ">
			<th>번호</th>
			<th>사은품명</th>
			<th>이미지</th>
			<th>카테고리</th>
			<th>설명</th>
			<th>가격</th>
			<th>등록일</th>
			<th>선택</th>
			
		<c:if test="${userId ne null and userId eq 'admin' }">
			<th>삭제</th>
			<th>수정</th> 
		</c:if>
		
		</tr>
		
		<c:forEach items="${giftLists}" var="gift" >
			<tr>
				<td align="center">
					<c:out value="${gift.gnum}" />
				</td>
				<td align="left" width="100"> 
					<%-- <a href="detail.gt?gnum=<c:out value="${gift.gnum}" />"> --%>
						<c:out value="${gift.gname}" />
					<!-- </a> -->
					<br>
<!-- 					detail.gt => GiftDetailViewController -->
				</td>
				<td align="center">
					<%-- <a href="detail.gt?gnum=<c:out value="${gift.gnum}" />"> --%>
					<img src="<%=request.getContextPath() %>/resources/Img/Gift/${gift.gimage}" width="60px" height="60px"> 
				</td>
				<td align="center">
					<c:out value="${gift.gcategory}" />
				</td>
				<td align="left" width="150">
					<c:out value="${gift.gcontents}" />
				</td>				
				<td align="left" width="150">
					<c:out value="${gift.gpoint}" /> pt
				</td>				
				<td align="center">
					<c:out value="${gift.day}" />
				</td>	 
				<td>
					<input type="radio" name="selectGift" value="${gift.gname }" >
				</td>
				<c:if test="${userId ne null and userId eq 'admin' }">
				<td align="center">
					<a href="delete.gt?gnum=<c:out value="${gift.gnum}" />">삭제</a><br>
				</td>
				<td  align="center">
					<input type="button" value="수정" value="${gift.gnum}" onclick="goUpdate('${gift.gnum}')"/>
				</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	
	<c:if test="${userId ne null and userId ne 'admin' }">
		<div class="mem_btn" align="center" style="margin-top: 10px;">
			<input type="submit" value="선택 완료" class="btn">
		</div>
	</c:if>
</form>
		<div>현재 ${sessionScope.loginfo.point }point 사용가능합니다.</div>
	<br>
	<center>
		${pageInfo.pagingHtml}
	</center>
	
</body>
</html>