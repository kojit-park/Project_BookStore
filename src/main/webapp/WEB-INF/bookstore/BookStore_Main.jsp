<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BookStore 메인 페이지</title>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
</head>
<body>
	<c:choose>
    	<c:when test="${userId ne null and userId ne 'admin' }">
		    <h1>${userId}님 환영합니다</h1>
			<a href ="order.bsmall">내 서재</a>
			<a href ="list.bsmall">장바구니</a>
			<a href = "list.rv">리뷰 게시판</a>
		</c:when>
    	<c:when test="${userId ne null and userId eq 'admin' }">
		    <h1>관리자 어서오고~</h1>
			<a href ="list.bm">회원 리스트</a>
			<a href ="incomeView.bsmall">매출 확인</a>
			<a href ="insert.bs">책 넣기</a>
			<a href ="list.gt">사은품 관리</a>
			<a href ="list.rv">리뷰 게시판</a>
		</c:when>
		<c:otherwise>
			<h1>서점 프로젝트</h1>
		</c:otherwise>
    </c:choose>

<form name="f" action="list.bs">
	<div id = "Main_cate">
		<div>
		<select id="sel_cateMain" name="category">
			<option value="all">전체</option>
			<option value="title">제목</option>
			<option value="author">저자</option>
			<option value="publisher">출판사</option>
		</select>
		<input type="text" name = "keyword" id = "searchMain" ><br><br>
			<div id = "Main_submit">
			<input type="submit" value="검색">
			</div>
		</div>
	</div>
</form>
<c:set var="MemberId" value="${loginfo.id}"></c:set>
<c:if test="${MemberId == null}">
	<div onclick="LogIn()">
	로그인
	</div>
</c:if>
<div onclick="minigame()">미니게임</div>
<button onclick="mobileVersion()">모바일 버전</button>
<script>
<%HttpSession remember = request.getSession();%>
	function LogIn(){
		location.href = "login.bm"
	}
	function minigame(){
		location.href = "minigame_select.mg"
	}
	function mobileVersion(){
		<%remember.removeAttribute("mobile");%>
		location.href = "main.bs?mobile=1"
	}
</script>
</body>
</html>