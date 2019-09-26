<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/CSS/Member/BmemberInsert.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.1.0.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<title>회원가입</title>

<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
<script type="text/javascript">
// 아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idck = 0;
var codeck = 0;
$(function() {
	
	$("#EmailSend").click(function(){
		var email = $("input[name=email1").val()+"@"+$("select[name=email2]").val();
		$.ajax({
			 async: true,
	         type : 'POST',
	         data : email,
	         url : "emailVerify.bm",
	         dataType : "json",
	         contentType: "application/json; charset=UTF-8",
	         success : function(data) {
	        	 
	        	 if(data == 0){
	        		 alert("email을 보내는데 실패했습니다.")
	        	 }else{
	        		 alert("email을 보냈습니다")
	        	 }
	         }, 
	         error:function(){alert("에러남")}
		})
		
	})
	
	$("#EmailVerification").click(function(){
		var code = $("#code").val();
		
		$.ajax({
			 async: true,
	         type : 'POST',
	         data : code,
	         url : "CodeVerify.bm",
	         dataType : "json",
	         contentType: "application/json; charset=UTF-8",
	         success : function(data) {
	        	 if(data ==1){
	        		 alert("인증 성공")
		        	 codeck = 1;
	        	 }else{
	        		 alert("인증 실패")
	        		 codeck = 0
	        	 }
	         }, 
	         error:function(){alert("에러남")}
		})
		
	})
	
    //중복체크  버튼을 클릭했을 때 
    $("#id_check").click(function() {
        
    	/* alert("1"); */
        var id =  $("#id").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : id,
            url : "idjb.bm",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data == 1) {
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존재할 경우 빨강으로 
                    $('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
					$('#idmessage').show();
                    $("#id").focus();
                    idck = 0;
                
                } else {
                    alert("사용가능한 아이디입니다.");
                    //아이디가 사용 가능할 경우 파랑으로
                    $('#idmessage').html("<font color=blue>사용 가능합니다.</font>"); 								
					$('#idmessage').show();
                    $("#pw").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1; 
                    
                }
               
            }, 
            error:function(){alert("에러남")}
        });
    });
});

function idChecker(){
	idck = 0
}


function check() {
	
	if(idck == 0){
		alert("아이디 중복을 확인하세요")
		document.getElementById("id").focus()
		return false
	}else if(document.getElementById("pw").value != document.getElementById("pwc").value){
		alert("비밀번호가 일치하지 않습니다")
		document.getElementById("pwc").blur()
		return false
	}else if(codeck ==0){
		alert("이메일을 인증하세요")
		return false
	}
	
}
/* input form js */

$(window, document, undefined).ready(function() {

 $('input').blur(function() {
   var $this = $(this);
   if ($this.val())
     $this.addClass('used');
   else
     $this.removeClass('used');
 });

 var $ripples = $('.ripples');

 $ripples.on('click.Ripples', function(e) {

   var $this = $(this);
   var $offset = $this.parent().offset();
   var $circle = $this.find('.ripplesCircle');

   var x = e.pageX - $offset.left;
   var y = e.pageY - $offset.top;

   $circle.css({
     top: y + 'px',
     left: x + 'px'
   });

   $this.addClass('is-active');

 });

 $ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function(e) {
 	$(this).removeClass('is-active');
 });

});


	jQuery(document).ready(function(){
    
    var select = $("select#select");
    
    select.change(function(){
        var select_name = $(this).children("option:selected").text();
        $(this).siblings("label").text(select_name);
    });
});

</script>

</head>
<body>
<div align="center"><b><h1>JB 회원 가입</h1></b></div> 
<form:form commandName="bmember" action="insert.bm" onsubmit="return check()" method="post">

	<div class="group">
		 <input type="text" id="id" name="id" style="width:390px; height:50px" onchange="idChecker()">		
	    <span class="highlight"></span><span class="bar"></span>
	    <label>아이디</label> <br>
	    
	    <button type="button" id="id_check" style="width:200px; height:50px" align="right">중복체크</button>
		<span id="idmessage"></span>
		<br><br> <form:errors cssClass="err" path="id"></form:errors>
	</div>
	
	<div class="group">
	  	<input type="password" id="pw" name="pw" style="width:390px; height:50px">
	    <span class="highlight"></span><span class="bar"></span>
	    <label>비밀번호</label>
	    <br> <form:errors cssClass="err" path="pw"></form:errors>
  	</div>
	
	<div class="group">
	  	<input type="password" name="pwc" style="width:390px; height:50px">
	    <span class="highlight"></span><span class="bar"></span>
	    <label>비밀번호 확인</label>
	    <br> <form:errors cssClass="err" path="pwc"></form:errors>
 	 </div>

	<div class="group">
	  	<input type="text" name="name" style="width:390px; height:50px">
	    <span class="highlight"></span><span class="bar"></span>
	    <label>이름</label>
	    <br> <form:errors cssClass="err" path="name"></form:errors>
  	</div>
	
	  
 	<div class="group">
	  	<input type="text" name="birth" style="width:390px; height:50px">
	    <span class="highlight"></span><span class="bar"></span>
	    <label>생년월일</label>
	    <br> <form:errors cssClass="err" path="birth"></form:errors>
  	</div>
	
		<b>전화번호</b> <br><br> 
	<div id="select_box" style="width: 400px">
		    <div class="whysels">
		    	<div>
	    <label for="select" style="color: #000">선택하세요</label>
		    <select id="select" title="전화번호" name ="pn1" style="display:inline-block; width:130px; height:50px; font-size:15px;">
		        <option value="">선택하세요</option>
		        <option value="010">010</option>
		        <option value="011">011</option>
		        <option value="019">019</option>        
		    </select></div>
		    	</div>
			- <div class="whysels"><input type="text" name="pn2" style="width:100px; height:50px" placeholder="1111"></div>
			- <div class="whysels"><input type="text" name="pn3" style="width:100px; height:50px" placeholder="2222"></div>
			<br> <form:errors cssClass="err" path="pn1"></form:errors>
	</div>
	
			<b>이메일</b><br>
	<div style="width: 400px;display: inline;">
		<input type="text" name="email1" placeholder="abc123" style="width: 200px; height:40px; display: inline-block;"> @
		<div id="select_box" style="width:130px; height:50px; font-size:15px; display: inline-block;">
		    <label for="select" style="color: #000;">선택하세요</label>
		    <select id="select" title="이메일" name ="email2" style="width:130px; height:50px; font-size:15px; display: inline-block;">
		        <option value="">선택하세요</option> 
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>			
					<option value="nate.com">nate.com</option>			
					<option value="gmail.com">gmail.com</option>      
		    </select>
		</div>
				<form:errors cssClass="err" path="eamil1" ></form:errors>
	</div>
	
	<div>
		<button type="button" id = "EmailSend" class="btn btn-primary">메일보내기</button>
	</div>
	<br>
	<div>
		<span style="display: inline-block;"><input type="text" name = "code" id="code"></span>	
		<button type="button" id = "EmailVerification" class="btn btn-primary">인증</button>
	</div>
	
	<div class="container">


  <div class="row">
    <div class="col-xs-12">
      <br> <b>성별</b>
      <br>
      <div class="btn-group btn-group-vertical" data-toggle="buttons">
        <div class="btn active">
          <input type="radio" name='gender' class="gender"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i> <span>  남</span>
        </div>
        <div class="btn">
          <input type="radio" name='gender' class="gender"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span> 여</span>
        </div>
        <br> <form:errors cssClass="err" path="gender"></form:errors>
      </div>
    </div>
  </div>
	
	 <br><br>
  <b>관심장르</b>
  
  <br>
	
  <div class="btn-group btn-group" data-toggle="buttons">
    <div class="btn active">
      <input type="checkbox" name='genre'><i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i><span> 미스테리
    </div>
    <div class="btn">
      <input type="checkbox" name='genre'><i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i><span> 로맨스</span>
    </div>
    <div class="btn">
      <input type="checkbox" name='genre'><i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i><span> 판타지</span>
    </div>    
  </div>
</div> 
<br> &nbsp;&nbsp;&nbsp; <form:errors cssClass="err" path="genre"></form:errors>
	
	<input type="submit" value="추가하기" id="add">

	<br> <br>		
	
	이미 계정에 있으신가요? &nbsp; <a href="login.bm" style="text-decoration:none">로그인</a> <br>
	&nbsp;&nbsp; <input type="submit" value="계정 만들기" id="add" style="width: 200px; height:50px">	

</form:form>
</body>
</html>



