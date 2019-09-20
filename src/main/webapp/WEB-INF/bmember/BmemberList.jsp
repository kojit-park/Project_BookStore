<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tagsIn.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
<script type="text/javascript">
	function insert(){
		location.href = "insert.bm";
	}
	
</script>	
</head>
<body>
BmemberList.jsp<br>
<h2 align="center">회원 리스트 화면</h2>
	<center>
	<form action="list.bm" method="get"> 
		<select name="category">
			<option value="all">전체 검색
			<option value="id">아이디
			<option value="name">이름
			<option value="gender">성별
		</select>
		<input type="text" name="keyword" value="검색">
		<input type="submit" value="검색">
	</form>
	</center>

	<table border="1" align="center">
		<tr>
			<td colspan="9" align="right">
				<input type="button" value="추가하기" onclick="insert();">
			</td>
		</tr>
		<tr>
		
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>생일</th>
			<th>핸드폰번호</th>
			<th>이메일</th>
			<th>성별</th>
			<th>관심장르</th>
			
		</tr>
		<c:forEach items="${memberLists}" var="bmember">  
			<tr>
				<td align="center">
					<c:out value="${bmember.num}" />
				</td>
				
				<td align="center">
					<c:out value="${bmember.id}" />
				</td>
				
				<td align="center">
					<c:out value="${bmember.name}" />
				</td>
				
				<td align="center">
					<c:out value="${bmember.birth}" />
				</td>
				
				<td align="center">
					<c:out value="${bmember.pn1}-${bmember.pn2}-${bmember.pn3}" />
				</td>
				
				<td align="center">
					<c:out value="${bmember.email1}-${bmember.email2}" />
				</td>
				
				<td align="center">
					<c:out value="${bmember.gender}" />
				</td>
				
				<td align="center">
					<c:out value="${bmember.genre}" />
				</td>
				
								
			</tr>
		</c:forEach>
	</table>
	<br>
	<center>
		${pageInfo.pagingHtml}
	</center>		
	</body>
</html>
