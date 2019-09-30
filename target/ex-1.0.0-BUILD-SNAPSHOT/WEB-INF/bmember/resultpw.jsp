<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tagsIn.jsp" %>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>    
<link href="resources/CSS/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<style type="text/css">
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
  
<form class="form-horizontal" action="changePassword.bm" method="post" style="display: inline-block; width:60% ;margin-left: 20%;margin-top: 20%;">
  <input type="hidden" name ="id" value="${id }">
  <input type="hidden" name ="name" value="${name }">
  <input type="hidden" name ="email1" value="${email1 }">
  <input type="hidden" name ="email2" value="${email2 }">
  
  <div class="form-group">
    <label for="inputPassword2" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-10">
      <input type="password" name = "pw" class="form-control" id="inputEmail2" placeholder="새로운 비밀번호">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">비밀번호 확인</label>
    <div class="col-sm-10">
      <input type="password" name="pwc" class="form-control" id="inputPassword3" placeholder="새로운 비밀번호 확인">
    </div>
  </div>
  <div class="form-group">
  	<label for="newPassword" class="col-sm-2 control-label"></label>
	    <div class="col-sm-10">
	    	<input type="submit" name = "newPassword" value="확인" class="btn btn-outline-dark">
	    </div>
  </div>
  
</form>


