<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../tagsIn.jsp" %>
<html>
<head>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/jquery.mobile-1.4.5.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.mobile-1.4.5.js"></script>

</head>
<body>
<section class="center" data-role="page">
    <header data-role="header">
    <c:choose>
    	<c:when test="${userId ne null and userId ne 'admin' }">
		    <h1>${userId}님 환영합니다</h1>
			<a href ="order.bsmall">내 서재</a>
			<a href ="list.bsmall">장바구니</a>
			<a href = "list.rv?mobile=1">리뷰 게시판</a>
		</c:when>
    	<c:when test="${userId ne null and userId eq 'admin' }">
		    <h1>관리자 어서오고~</h1>
			<a href ="list.bm" rel="external">회원 리스트</a>
			<a href ="incomeView.bsmall" rel="external">매출 확인</a>
			<a href ="insert.bs">책 넣기</a>
			<a href ="list.gt">사은품 관리</a>
			<a href = "list.rv">리뷰 게시판</a>
		</c:when>
		<c:otherwise>
			<h1>서점 프로젝트</h1>
		</c:otherwise>
    </c:choose>
    
    
   
    </header>
    <br><br><br>
    <br><br><br>                  
        <form name="f" action = "list.bs?mobile=1">
    <div class="content" data-role="content" id = "Main_cate">
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
	<br><br><br> 
	<br><br><br>
    <footer data-role="footer"><h1>만든 사람들: <button onclick="PCVersion()">PC 버전</button> </h1></footer>
</section>
<script type="text/javascript">
	<% HttpSession remember = request.getSession(); %>
 $( document ).ready(function() {
    $(window).resize();
 }); 
 $(window).resize(function(){
     $('.center').css({position:'absolute'}).css({
         left: ($(window).width() - $('.center').outerWidth())/2,
         top: ($(window).height() - $('.center').outerHeight())/2
     });
 });
 function PCVersion(){
	<%remember.removeAttribute("mobile");%>
	location.href = "main.bs"
 }
</script>
</body>
</html>