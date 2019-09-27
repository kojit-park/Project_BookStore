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




