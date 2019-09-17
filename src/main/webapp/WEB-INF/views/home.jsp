<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<script type="text/javascript">
var filter =  "win16|win32|win64|mac";
var mobile = new Array("iPhone","Android","SAMSUNG")
<%
HttpSession remember = request.getSession();
%>
for(var txt in mobile){
	if(navigator.userAgent.match(mobile[txt])!=null){
		<%
		remember.setAttribute("mobile", 1);
		%>
		console.log("Mobile")
		location.href = "main.bs"
	}
}

	if(0>filter.indexOf(navigator.platform.toLowerCase())){
			<%
			remember.setAttribute("mobile", 1);
			%>
			console.log(navigator.userAgent)
			location.href = "main.bs"
	}else{
		<%
		remember.removeAttribute("mobile");
		%>
		location.href = "main.bs"
	}

</script>	
</head>
<body>
<h1>
	Hello world!  
</h1>
<%-- <jsp:forward page="../bookstore/BookStore_Main.jsp"/> --%>
	
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
