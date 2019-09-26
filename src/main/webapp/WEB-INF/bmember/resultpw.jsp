<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="resources/CSS/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>


  
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


