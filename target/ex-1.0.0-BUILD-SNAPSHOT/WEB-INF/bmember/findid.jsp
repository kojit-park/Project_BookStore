<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/CSS/Member/BmemberFindId.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.1.0.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>

<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<title>find id</title>
<style type="text/css">
div#select_box {
    position: relative;
    width: 130px;
    height: 40px;
    background: url("${pageContext.request.contextPath}/resources/Img/login/arrow.png") 180px center no-repeat; /* 화살표 이미지 */
   /*  border: 1px solid #368AFF; */
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

<script type="text/javascript">


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

 /* select box js */
 
	jQuery(document).ready(function(){
 
 var select = $("select#select");
 
 select.change(function(){
     var select_name = $(this).children("option:selected").text();
     $(this).siblings("label").text(select_name);
 });
});
 
	/* id pw border color css */
	 
	$(function(){
	     $('a').click(function(){
	    	
	    	if('a#id'){
	    		$('a#id').css('border-right','1px solid blue',
	    				'border-left','1px solid blue',
	    				'border-top','1px solid blue'
	    		);
	    		$('a#pw').css('border-top','1px solid blue')
	    		
	    		
	    	}
	    	if('a#pw'){
	    		$('a#pw').css('border-right','1px solid blue',
	    				'border-left','1px solid blue',
	    				'border-top','1px solid blue'
	    		);
	    		$('a#id').css('border-bottom','1px solid blue')
	    		
	    	}
	        
	    }); 
	        
	    }); 
 
</script>
</head>
<body>
<div class="logo" align="center" style="margin: 0;">
	<img alt="홈으로" src="resources/Img/Logo/5.jpg" width="100px;" onclick="location.href='main.bs'">
</div>
<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">

  <div align="center"><h2><b>아이디/비밀번호 찾기</b></h2></div> <br>
			<div align="center">
				<a href="findid.bm" role="button" style="text-decoration:none; margin-right:-5px;"><span><b>아이디 찾기</b></span></a>
				<a href="findpw.bm" role="button" style="text-decoration:none;"><span><b>비밀번호 찾기</b></span></a>
			</div>


<form:form commandName="bmember" action="findid.bm" method="post">

	 
  <div class="group">
  	<input type="text" name="name" style="width:390px; height:50px" placeholder="">
    <span class="highlight"></span><span class="bar"></span>
    <label>이름</label>
    <br> <form:errors cssClass="err" path="name"></form:errors>
  </div>
	
<b>이메일</b><br>
<div style="width: 400px;display: inline;">
	<input type="text" name="email1" placeholder="" style="width: 200px; height:40px; display: inline-block;"> @
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
			<form:errors cssClass="err" path="eamil1"></form:errors>
</div>
	<br><br>
	
<input type="submit" id="check" value="확인" style="width:390px; height:50px;">
	
</form:form>
</body>
</html>