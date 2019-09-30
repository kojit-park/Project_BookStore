<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resources/CSS/bootstrap.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<c:set value="${sessionScope.loginfo.id}" var="userId"/>
<style type="text/css">
a{
	text-decoration: none;
	color: #4572ed;
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


</head>
<body>
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

<form action="incomeDetail.bsmall">
	<div class="form-group" style="text-align: center;width: 80%;padding-left: 5%"><br>
		<div><h1>기간으로 검색</h1></div>
		<div style="display: inline-block; width: 300px">
			<select name="selectYear1" class="form-control">
				<option value="2019">2019년</option>
				<option value="2018">2018년</option>
				<option value="2017">2017년</option>
				<option value="2016">2016년</option>
				<option value="2015">2015년</option>
			</select>
		</div>
		<div style="display: inline-block; width: 200px">
			<select name="selectMonth1" class="form-control">
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
		</div>
			<div style="display: inline-block; width: 100px"><h2>부터</h2></div>
		<div style="display: inline-block; width: 300px">
			<select name="selectYear2" class="form-control">
				<option value="2019">2019년</option>
				<option value="2018">2018년</option>
				<option value="2017">2017년</option>
				<option value="2016">2016년</option>
				<option value="2015">2015년</option>
			</select>
		</div>
		
		<div style="display: inline-block; width: 200px">
			<select name="selectMonth2" class="form-control">
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
		</div>
		<div style="display: inline-block; width: 100px"><h2>까지</h2></div>
		
		<div style="text-align: center; display: inline-block;">
			<input type="submit" value="검색" class="btn btn-primary btn-lg">
		</div>
	
	</div>
</form>

<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">


<div style="text-align: center;width: 80%;padding-left: 5%">
		<div><h1>책별 매출</h1></div>
		<div id="DivBookIncome" style="height: 400px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
		<div><h1>책별 매출 (남)</h1></div>
		<div id="DivMaleBookIncome" style="height: 400px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
		<div><h1>책별 매출 (여)</h1></div>
		<div id="DivFemaleBookIncome" style="height: 400px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
		<div><h1>회원별 매출</h1></div>
		<div id="DivMemberIncome" style="height: 400px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
		<div><h1>기간별 매출</h1></div>
		<div id="DivIncome" style="height: 400px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
		<div><h1>카테고리별 매출</h1></div>
		
		<div id="legend_Cate" class="donut-legend" style="text-align: left"></div>
		<div id="DivCategory" style="height: 400px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
		<div><h1>성별에 따른 매출</h1></div>
		
		<div id="legend_Gender" class="donut-legend" style="text-align: left"></div>
		<div id="DivGender" style="height: 400px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
		<div><h1>나이대별 매출</h1></div>
		
		<div id="legend_AgeGroup" class="donut-legend" style="text-align: left"></div>
		<div id="DivAgeGroup" style="height: 400px;"></div>
</div>

<script type="text/javascript">

var BookIncomeArray = new Array();

			<c:forEach items="${BookIncome}" var="BI">
				var BookIncomeInfo = new Object();
				BookIncomeInfo.book = "${BI.key}"
				BookIncomeInfo.value = ${BI.value}
				BookIncomeArray.push(BookIncomeInfo)
				var jsonInfoBookIncome =  JSON.stringify(BookIncomeArray)
			</c:forEach>  
				
				var BookIncome =
					new Morris.Bar({
					  element: 'DivBookIncome',
					  data: JSON.parse(jsonInfoBookIncome),
					  xkey: 'book',
					  ykeys: ['value'],
					  labels: ['매출'],
					  yLabelFormat:function(y){return y +' krw';}
					});
				
			var MaleBookIncomeArray = new Array();	
				
			<c:forEach items="${MaleBookIncome}" var="MBI">
				var MaleBookIncomeInfo = new Object();
				MaleBookIncomeInfo.book = "${MBI.key}"
				MaleBookIncomeInfo.value = ${MBI.value}
				MaleBookIncomeArray.push(MaleBookIncomeInfo)
				var jsonInfoMaleBookIncome =  JSON.stringify(MaleBookIncomeArray)
			</c:forEach>  
				
				var MaleBookIncome =
					new Morris.Bar({
					  element: 'DivMaleBookIncome',
					  data: JSON.parse(jsonInfoMaleBookIncome),
					  xkey: 'book',
					  ykeys: ['value'],
					  labels: ['매출'],
					  yLabelFormat:function(y){return y +' krw';}
					});
				
			var FemaleBookIncomeArray = new Array();	
				
			<c:forEach items="${FemaleBookIncome}" var="FBI">
				var FemaleBookIncomeInfo = new Object();
				FemaleBookIncomeInfo.book = "${FBI.key}"
				FemaleBookIncomeInfo.value = ${FBI.value}
				FemaleBookIncomeArray.push(FemaleBookIncomeInfo)
				var jsonInfoFemaleBookIncome =  JSON.stringify(FemaleBookIncomeArray)
			</c:forEach>  
				
				var FemaleBookIncome =
					new Morris.Bar({
					  element: 'DivFemaleBookIncome',
					  data: JSON.parse(jsonInfoFemaleBookIncome),
					  xkey: 'book',
					  ykeys: ['value'],
					  labels: ['매출'],
					  yLabelFormat:function(y){return y +' krw';}
					});
				
			var MemberIncomeArray = new Array();	
				
			<c:forEach items="${MemberIncome}" var="MI">
				var MemberIncomeInfo = new Object();
				MemberIncomeInfo.member = "${MI.key}"
				MemberIncomeInfo.value = ${MI.value}
				MemberIncomeArray.push(MemberIncomeInfo)
				var jsonInfoMemberIncome =  JSON.stringify(MemberIncomeArray)
			</c:forEach>  
				
				var MemberIncome =
					new Morris.Bar({
					  element: 'DivMemberIncome',
					  data: JSON.parse(jsonInfoMemberIncome),
					  xkey: 'member',
					  ykeys: ['value'],
					  labels: ['매출'],
					  yLabelFormat:function(y){return y +' krw';}
					});
				
			var IncomeArray = new Array();	
				
			<c:forEach items="${Income}" var="I">
				var IncomeInfo = new Object();
				IncomeInfo.month = "${I.key}"
				IncomeInfo.value = ${I.value}
				IncomeArray.push(IncomeInfo)
				var jsonInfoIncome =  JSON.stringify(IncomeArray)
			</c:forEach>  
				
				var Income =
					new Morris.Line({
						  element: 'DivIncome',
						  data: JSON.parse(jsonInfoIncome),
						  xkey: 'month',
						  ykeys: ['value'],
						  xLabels:['month'],
						  labels: ['value'],
						  yLabelFormat:function(y){return y +' krw';},
					})
				
			var CategoryIncomeArray = new Array();
			var sumCategory = 0;
				
			<c:forEach items="${CategoryIncome}" var="CI">
				var CategoryIncomeInfo = new Object();
				CategoryIncomeInfo.label = "${CI.key}"
				CategoryIncomeInfo.value = ${CI.value}
				CategoryIncomeArray.push(CategoryIncomeInfo)
				sumCategory += ${CI.value}
				var jsonInfoCategoryIncome =  JSON.stringify(CategoryIncomeArray)
			</c:forEach>  
				
				var ByCategory = 
					new Morris.Donut({
					  element: 'DivCategory',
					  data: JSON.parse(jsonInfoCategoryIncome),
					  formatter: function(value,data){
						  return Math.floor(value/sumCategory*100)+'%';
						  }
					});
				ByCategory.options.data.forEach(function(label, i) {
					    var Categorylegend = $('<span></span>').text( label['label'] + " ( " +label['value'] + " 원)" ).prepend('<br><span>&nbsp;</span>');
					    Categorylegend.find('span')
					      .css('backgroundColor', ByCategory.options.colors[i])
					      .css('width', '20px')
					      .css('display', 'inline-block')
					      .css('margin', '5px');
					    $('#legend_Cate').append(Categorylegend)
					  });
				
			var GenderIncomeArray = new Array();
			var sumGender = 0;
				
			<c:forEach items="${GenderIncome}" var="GI">
				var GenderIncomeInfo = new Object();
				GenderIncomeInfo.label = "${GI.key}"
				GenderIncomeInfo.value = ${GI.value}
				GenderIncomeArray.push(GenderIncomeInfo)
				sumGender += ${GI.value}
				var jsonInfoGenderIncome =  JSON.stringify(GenderIncomeArray)
			</c:forEach>  
				
				var ByGender = 
					new Morris.Donut({
					  element: 'DivGender',
					  data: JSON.parse(jsonInfoGenderIncome),
					  formatter: function(value,data){
						  return Math.floor(value/sumGender*100)+'%';
						  }
					});
				ByGender.options.data.forEach(function(label, i) {
					    var Genderlegend = $('<span></span>').text( label['label'] + " ( " +label['value'] + " 원)" ).prepend('<br><span>&nbsp;</span>');
					    Genderlegend.find('span')
					      .css('backgroundColor', ByGender.options.colors[i])
					      .css('width', '20px')
					      .css('display', 'inline-block')
					      .css('margin', '5px');
					    $('#legend_Gender').append(Genderlegend)
					  });
				
			var AgeGroupIncomeArray = new Array();
			var sumAgeGroup = 0;
				
			<c:forEach items="${AgeGroupIncome}" var="AGI">
				var AgeGroupIncomeInfo = new Object();
				AgeGroupIncomeInfo.label = "${AGI.key}"
				AgeGroupIncomeInfo.value = ${AGI.value}
				AgeGroupIncomeArray.push(AgeGroupIncomeInfo)
				sumAgeGroup += ${AGI.value}
				var jsonInfoAgeGroupIncome =  JSON.stringify(AgeGroupIncomeArray)
			</c:forEach>  
				
				var ByAgeGroup= 
					new Morris.Donut({
					  element: 'DivAgeGroup',
					  data: JSON.parse(jsonInfoAgeGroupIncome),
					  formatter: function(value,data){
						  return Math.floor(value/sumAgeGroup*100)+'%';
						  }
					});
				ByAgeGroup.options.data.forEach(function(label, i) {
					    var AgeGrouplegend = $('<span></span>').text( label['label'] + " ( " +label['value'] + " 원)" ).prepend('<br><span>&nbsp;</span>');
					    AgeGrouplegend.find('span')
					      .css('backgroundColor', ByAgeGroup.options.colors[i])
					      .css('width', '20px')
					      .css('display', 'inline-block')
					      .css('margin', '5px');
					    $('#legend_AgeGroup').append(AgeGrouplegend)
					  });
				

</script>
</body>
</html>