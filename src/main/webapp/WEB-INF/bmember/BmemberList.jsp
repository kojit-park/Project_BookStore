<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tagsIn.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<style type="text/css">

	#bt{
  width:100px;
  background:#368AFF;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:0.8em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#bt:hover{
  background:#fff;
  color:#368AFF;
}
#bt:before,#bt:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #368AFF;
  transition:400ms ease all;
}
#bt:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#bt:hover:before,#bt:hover:after{
  width:100%;
  transition:800ms ease all;
}

div#select_box {
    position: relative;
    width: 130px;
    height: 40px;
    background: url("${pageContext.request.contextPath}/resources/Img/login/arrow.png") 90px center no-repeat; /* �솕�궡�몴 �씠誘몄� */
    border: 1px solid #368AFF; 
}
div#select_box label {
    position: absolute;
    font-size: 14px;
    color: #a97228;
    top: 13px;
    left: 12px;
    letter-spacing: 1px;
}
div#select_box select#select {
    width: 100%;
    height: 40px;
    min-height: 40px;
    line-height: 40px;
    padding: 0 10px;
    opacity: 0;
    filter: alpha(opacity=0); /* IE 8 */
}  

/* select box arrow css */

.select-arrow-image {
    width: 200px;
    border: none;
    box-shadow: none;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    font-size: 1.2em;
    background-color: transparent;
    background-image: url("${pageContext.request.contextPath}/resources/Img/login/arrow.png");
    background-position: center right;
    background-repeat: no-repeat;
    background-size: 15px 10px;
    /* <img src="${pageContext.request.contextPath}/resources/Img/login/arrow.png">  */
}
.whysels{
	display: inline-block;
    width: 100px;
}

input:-ms-input-placeholder {
  color: red;
  font-style: italic;
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
a{
text-decoration:none;
}

</style>
<script type="text/javascript">
	function insert(){
		location.href = "insert.bm";
	}
	
</script>	
</head>
<body>
<div class="top_header">
	<div class="top_header_contents">
		<div class="top_right">
			<ul style="display: inline-block;text-align: left; margin-right: -8px;">
				<c:if test="${userId == null}">
					<li style="float: left;position: relative;margin: 5px ;color: #757575;">
							<a href="login.bm" style="color: #757575;"><b>로그인</b></a>
					</li>
					<li style="float: left;position: relative;margin: 5px ;">
						<a href="insert.bm" style="color: #757575;"><b>회원가입</b></a>
					</li>
				</c:if>
				<c:if test="${userId != null}">
					<li style="float: left;position: relative;margin: 5px ;color: #757575;">${sessionScope.loginfo.id}님</li>
					<li style="float: left;position: relative;margin: 5px ;">
						<a href="logOut.bm" style="color: #757575;">로그아웃</a>
					</li>
				</c:if>		
			</ul>
		</div>
	</div>
</div>
<div class="logo" align="center" style="margin: 0;">
	<a href="main.bs"><img alt="홈으로" src="resources/Img/Logo/3.jpg" width="100px;"></a>
</div>
<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
<h2 align="center">회원 리스트 화면</h2>
	<center>
	<form action="list.bm" method="get"> 
			<div style="width: 400px;display: inline;">
				<div id="select_box" style="width:120px; height:40px; font-size:15px; display: inline-block;">
				    <label for="select" style="color: #000;">선택하세요</label>
				    <select id="select" name ="category" style="width:130px; height:50px; font-size:15px; display: inline-block;">
					    <option value="all">전체 검색
						<option value="id">아이디
						<option value="name">이름
						<option value="gender">성별     
				    </select>
				</div>
				<form:errors cssClass="err" path="category" ></form:errors>
		</div>	
		<input type="text" name="keyword" value="" style="width:150px; height:30px; border:1px solid #368AFF" placeholder="검색어">
		<input type="submit" id="bt" value="검색">
	</form>
	</center>

	<table border="1" align="center" style="border:1px solid #368AFF; padding:5px; margin-top:5px;">
		<tr>
			<td colspan="9" align="right" style="border:1px solid #368AFF">
				<input type="button" id="bt" value="추가하기" onclick="insert();">
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
		<c:forEach items="${memberLists}" var="bmember" >  
			<tr>
				<td align="center" style="padding:7px;">
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
