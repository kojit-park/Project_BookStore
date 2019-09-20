<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style type="text/css">
	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>

<script type="text/javascript">
// 아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idck = 0;
$(function() {
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
	}
	
}


 
</script>

</head>
<body>
BmemberInsertForm.jsp<br>
<h1>회원 가입</h1>
<form:form commandName="bmember" action="insert.bm" onsubmit="return check()" method="post">

	아이디 : 
		<input type="text" id="id" name="id" placeholder="아이디" onchange="idChecker()">
		<button type="button" id="id_check">중복체크</button>
		<span id="idmessage">메세지 출력</span>
		<form:errors cssClass="err" path="id"></form:errors>
	<br><br>
	
	비밀번호 : 
		<input type="password" id="pw" name="pw" placeholder="qwer1234">
		<form:errors cssClass="err" path="pw"></form:errors>
	<br><br>
	
	비밀번호 확인 : 
		<input type="password" name="pwc" placeholder="비밀번호 확인">
		<form:errors cssClass="err" path="pwc"></form:errors>
	<br><br>

	이름 : 
		<input type="text" name="name" placeholder="이름을 입력하세요">
		<form:errors cssClass="err" path="name"></form:errors>
	<br><br>
	
	생년월일 : 
		<input type="text" name="birth" placeholder="예시: 20011030"> "-" 제거후 입력해주세요
		<form:errors cssClass="err" path="birth"></form:errors>
	<br><br>
	
	핸드폰번호 : 
	
		<select name = "pn1">
			<option value="">선택하세요</option> 
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="019">019</option>
		</select>
		
		- <input type="text" name="pn2" placeholder="1111">
		- <input type="text" name="pn3" placeholder="2222">
		<form:errors cssClass="err" path="pn1"></form:errors>
		<form:errors cssClass="err" path="pn2"></form:errors>
		<form:errors cssClass="err" path="pn3"></form:errors>
	<br><br>
	
	이메일 : 
		<input type="text" name="email1" placeholder="abc123"> @ 		
		<select name="email2">
			<option value="">선택하세요</option> 
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>			
			<option value="nate.com">nate.com</option>			
			<option value="gmail.com">gmail.com</option>			
		</select>
		<form:errors cssClass="err" path="email1"></form:errors>
		<form:errors cssClass="err" path="email2"></form:errors>
	<br>
	
	<p>
		<label for="gender"></label>
		성별 :<input type="radio" name="gender" value="남">남
		<input type="radio" name="gender" value="여">여		
		<form:errors cssClass="err" path="gender"></form:errors>
	</p>	
	
	<p>
		<label for="genre"></label>
		관심장르 :<input type="checkbox" name="genre" value="미스테리">미스테리
		<input type="checkbox" name="genre" value="로맨스">로맨스
		<input type="checkbox" name="genre" value="판타지">판타지
	
		<form:errors cssClass="err" path="genre"></form:errors>
	</p>			
	
	<input type="submit" value="추가하기" id="add">
	
</form:form>
</body>
</html>



