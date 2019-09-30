<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
<title>Login form</title>
<style type="text/css">


	/* 에러메세지 css */
	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}
	
	html,body{
  height:100%;
}
body{
  text-align:center;
}
body:before{
  content:'';
 /*  height:100%; */
  display:inline-block;
  vertical-align:middle;
} 
button{
  width:370px;
  background:#368AFF;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#368AFF;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #368AFF;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>

</head>
<body>
<a href="main.bs"><img src="${pageContext.request.contextPath}/resources/Img/login/JBori.jpg" width="150px" height="160px"/></a>

<form:form commandName="bmember" action="login.bm" method="post">

	 
		<input type="text" name="id" placeholder="아이디">
		<form:errors cssClass="err" path="id"></form:errors>
		
	<br><br>
	
	
		<input type="password" name="pw" placeholder="패스워드">
		<form:errors cssClass="err" path="pw"></form:errors>
		
	<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="findid.bm" style="text-decoration:none" align=right><b>아이디찾기</b></a> |   
		<a href="findpw.bm" style="text-decoration:none"><b>비밀번호찾기</b></a> 
		 
	<br><br>
	<button>로그인</button>
	
	<hr width="350px" align="center" color="#EAEAEA">
	
	
	계정이 없으신가요? &nbsp; <a href="insert.bm" style="text-decoration:none"><b>회원가입</b></a>
		
</form:form>
</body>
</html>




