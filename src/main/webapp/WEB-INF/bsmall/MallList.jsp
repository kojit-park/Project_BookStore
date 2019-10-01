<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./../tagsIn.jsp" %>    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<style type="text/css">
body {font-family: 'Nanum Gothic', sans-serif; font-size: 12px;}
tr,th{
text-align: center;
}
img{
margin: 1px;
}
.table{
width:1000px;
}
table {
    width: 1000px;
    border-top: 1px solid #EAEAEA;
    border-collapse: collapse;
  }
th, td {
    border-bottom: 1px solid #EAEAEA;
    padding: 10px;
  }
.btn-outline-dark{
	border-color: #EAEAEA;
}
h1{
	font-size: 35px;
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
</style>
</head>
<body>
<script type="text/javascript">
$( document ).ready( function() {
	 $("#checkall").click(function(){
		 if($("#checkall").prop("checked")){
			 $("input[name=chk]").prop("checked",true);
		 }else{
	            $("input[name=chk]").prop("checked",false);
	     }
    } );
	 
	$("#calcFrm").on("click", function(){
		location.href="calculate.bsmall";
	});
	
	$("#listFrm").on("click", function(){
		location.href="list.gt";
	});
	
	$("#mainFrm").on("click", function(){
		location.href="main.bs";
	});
	 
	$("#submitFrm").on("click", function() {
		  var param = "";
	      $("input[name=chk]:checked").each(function() {
	        if( param=="" )
	          param = "bnum="+$(this).parent().children("#bnum").val();
	       	 else param = param + "&bnum="+$(this).parent().children("#bnum").val();
	      });
	           
	      $.ajax({
	        url : 'http://localhost:8080/ex/deleteall.bsmall',	
	        type : 'post',
	        data : param,
	        dataType : 'text',
	        success : function(result){
	        	location.href="list.bsmall";
	        }
  });
});	
});
  
  
</script>
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

<%-- 접속자 아이디 : ${sessionScope.loginfo.id} <br> --%>
<br><br>
<h1 align="center" class="ng">장바구니</h1>
<br><br>
	<c:if test="${sessionScope.totalAmount==null}">
		<table align="center" class="table">
		<tr>
			<td colspan="8" style="text-align: right">
				<font style="font-weight: bold">주문자 정보 : ${sessionScope.loginfo.name}(${sessionScope.loginfo.id})</font>
			</td>
		</tr>
		<tr>
			<td width="30px"><input type="checkbox" id="checkall" value="checkall"/></td>
			<th>번호</th>
			<th colspan="2">상품명(옵션)</th>
			<th>수량</th>
			<th>판매가</th>
			<th>주문금액</th>
			<th>삭제</th>
		</tr>
		<tr>
		<td colspan="8" align="center"> 주문 내역이 없습니다</td>
		</tr>
		</table>
	</c:if>
	
	<c:if test="${sessionScope.totalAmount!=null}">
	<table align="center">
		<tr>
			<td colspan="8" align="right">
				<font style="font-weight: bold;">주문자 정보 : ${sessionScope.loginfo.name}(${sessionScope.loginfo.id})</font>
			</td>
		</tr>	
		<tr>
		
			<td width="30px">
			<input type="checkbox" id="checkall" value="checkall"/></td>
			<th>번호</th>
			<th colspan="2">상품명(옵션)</th>
			<th>수량</th>
			<th>판매가</th>
			<th>주문금액</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${sessionScope.shopLists}" var="shopinfo" varStatus="status"> 
			<tr>
				<td width="30px">
				<input type="checkbox" name="chk" id="chkclass"/>
				<input type="hidden" id = "bnum" name ="bnum" value=${shopinfo.bnum}>
				</td>
				<td align="center">
					${status.count}
				</td>				
				<td width="140px">
					<a href="detail.bs?bnum=${shopinfo.bnum}"><img id="bookImage${shopinfo.bnum }" src='<c:url value="/resources/Img/${shopinfo.pname}.jpg"/>' width="80" height="120"></a>
				</td>
				<td align="left">
					${shopinfo.pname}
				</td>
				<form action="update.bsmall">
				<td align="center">
					<input type="number" name="qty" value=${shopinfo.qty} style="text-align: center; width:50px;">&nbsp;&nbsp;
					<input type="hidden" name ="bnum" value=${shopinfo.bnum}>
					<button type="submit" class="btn btn-outline-dark">수정</button>
				</td>				
				</form>

				<td align="center">
				<fmt:formatNumber value="${shopinfo.price}" type="number" />
				</td>
				<td align="center">
					<fmt:formatNumber value="${shopinfo.amount}" type="number" />
				</td>
				<td>
				<a href="delete.bsmall?bnum=${shopinfo.bnum}&oqty=${shopinfo.qty}">삭제</a>
				</td>				
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" align="left">
				<button type="button" id="calcFrm"class="btn btn-outline-dark"><font style="font-weight: bold;">결제하기</font></button>
				&nbsp;&nbsp;
				<button type="button" id="listFrm"class="btn btn-outline-dark"><font style="font-weight: bold;">사은품 선택</font></button>
				&nbsp;&nbsp;
				<button type="button" id="submitFrm"class="btn btn-outline-dark"><font style="font-weight: bold;">선택 삭제</font></button>
				&nbsp;&nbsp;
				<button type="button" id="mainFrm"class="btn btn-outline-dark"><font style="font-weight: bold;">메인으로</font></button>
			</td>
			<td colspan="3" align="right">총 금액 :<fmt:formatNumber value="${sessionScope.totalAmount}" type="number" /></td> 
		</tr>
		
	</table>	
	</c:if>
	<br><br><br>	
</body>
</html> 




