<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../tagsIn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

div {
	float: left;
}

.ng * {
	font-weight: normal;
}
</style>
<title>장바구니</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
	 $("#checkall").click(function(){
		 if($("#checkall").prop("checked")){
			 $("input[name=chk]").prop("checked",true);
		 }else{
	            $("input[name=chk]").prop("checked",false);
	     }
    } );
	 
	
	 $("#submitFrm").on("click", function() {
		  var param = "";
	      $("input[name=chk]:checked").each(function() {
	        if( param=="" )
	          param = "bnum="+$(this).parent().children("#bnum").val();
	       	 else param = param + "&bnum="+$(this).parent().children("#bnum").val();
	      });
	           
	      $.ajax({
	        url : 'deleteall.bsmall',	
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
</head>
<body>

	접속자 아이디 : ${sessionScope.loginfo.id}
	<br>

	<h2 align="center" class="ng">장바구니</h2>

	<table border="1" align="center" class="table">
		<thead class="thead-light">
			<tr>
				<td colspan="7" align="center"><font class="ng">주문자 정보 :
						${sessionScope.loginfo.name}(${sessionScope.loginfo.id})</font></td>
			</tr>
		</thead>
		<tr>
			<td width="50px"><input type="checkbox" id="checkall"
				value="checkall" /></td>
			<th>상품 번호</th>
			<th>상품명</th>
			<th>주문 수량</th>
			<th>단가</th>
			<th>금액</th>
			<th>삭제</th>
		</tr>
		<c:choose>
			<c:when test="${sessionScope.totalAmount==0}">
				<tr>
					<td colspan="7" align="center">주문 내역이 없습니다</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach items="${sessionScope.shopLists}" var="shopinfo">
					<tr>
						<td>
							<input type="checkbox" name="chk" id="chkclass" /> 
							<input type="hidden" id="bnum" name="bnum" value="${shopinfo.bnum}">
						</td>
						<td align="center">${shopinfo.bnum}</td>
						<td align="center">${shopinfo.pname}</td>
						
						<form action="update.bsmall">
							<td align="center">
								<input type="text" name="qty"value="${shopinfo.qty}"> 
								<input type="hidden" name="bnum" value="${shopinfo.bnum}">
								<button type="submit">수정</button></td>
						</form>

						<td align="center">${shopinfo.price}</td>
						<td align="center">${shopinfo.amount}</td>
						<td>
							<a href="delete.bsmall?bnum=${shopinfo.bnum}&oqty=${shopinfo.qty}">삭제</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4" align="center">
						<a href="calculate.bsmall">결제하기</a>&nbsp;&nbsp;
						<a href="list.gt">사은품 선택</a> &nbsp;&nbsp;
						<button id="submitFrm">선택삭제</button> &nbsp;&nbsp; 
						<a href="main.bs">메인으로</a></td>
					<td colspan="3" align="center">총 금액 : ${sessionScope.totalAmount}</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>

	<br>
	<br>
	<br>
</body>
</html>




