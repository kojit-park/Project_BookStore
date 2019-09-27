<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tagsIn.jsp" %>  
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<style type="text/css">
	a { 
		display:inline-block; 
		text-align:center; 
		vertical-align:middle; 
		text-decoration:none; 
		font-size:12px; 
		color:#000; 
		border:1px solid #000; 
		width:118px; 
		height:38px; 
		line-height:38px; 
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
					<li style="float: left;position: relative;margin: 5px ;color: #757575;">${userId}님</li>
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
   
   <h3 class="find_title" align="center">아이디 찾기 결과</h3>
		<div align="center">${findid.id }</div>
		<br><br>
	<div align="center">
		<h2><a href ="findpw.bm">비밀번호 찾기</a></h2>
		<h2><a href ="main.bs">메인으로</a></h2>
	</div>


