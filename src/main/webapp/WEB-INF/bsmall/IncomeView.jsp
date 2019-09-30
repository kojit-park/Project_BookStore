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
	<div><h1>일별 매출</h1></div>
	<div id="IncomesByDay" style="height: 250px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
	<div><h1>월별 매출</h1></div>
	<div id="IncomesByMonth" style="height: 250px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
	<div><h1>년도별 매출</h1></div>
	<div id="IncomesByYear" style="height: 250px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
	<div><h1>책별 매출</h1></div>
	<div id="IncomesByBook" style="height: 400px;"></div>
	<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
	<div><h1>카테고리별 매출</h1></div>
	<div id="legend" class="donut-legend" style="text-align: left"></div>
	<div id="IncomesByCategory" style="height: 400px;"></div>
</div>

<script type="text/javascript">

var DayArray = new Array();
var MonthArray = new Array();
var YearArray = new Array();

var BookArray = new Array();
var CategoryArray = new Array();
var sum = 0;
	<c:forEach items="${IncomeMapDay}" var="byDay">
		var DayInfo = new Object();
		DayInfo.day = "${byDay.key}"
		DayInfo.val = ${byDay.value}
		DayArray.push(DayInfo)
		var jsonInfoDay =  JSON.stringify(DayArray)
	</c:forEach>  
		
	<c:forEach items="${IncomeMapMonth}" var="byMonth">
		var MonthInfo = new Object();
		MonthInfo.month = "${byMonth.key}"
		MonthInfo.val = ${byMonth.value}
		MonthArray.push(MonthInfo)
		var jsonInfoMonth = JSON.stringify(MonthArray)
	</c:forEach>  
		
	<c:forEach items="${IncomeMapYear}" var="byYear">
		var YearInfo = new Object();
		YearInfo.year = "${byYear.key}"
		YearInfo.val = ${byYear.value}
		YearArray.push(YearInfo)
		var jsonInfoYear = JSON.stringify(YearArray)
	</c:forEach>  
		
	<c:forEach items="${IncomeMapBook}" var="byBook">
		var BookInfo = new Object();
		BookInfo.book = "${byBook.key}"
		BookInfo.val = ${byBook.value}
		BookArray.push(BookInfo)
		var jsonInfoBook = JSON.stringify(BookArray)
	</c:forEach>
		
	<c:forEach items="${IncomeMapCategory}" var="byCategory">
		var CategoryInfo = new Object();
		CategoryInfo.label = "${byCategory.key}"
		CategoryInfo.value = ${byCategory.value}
		sum += ${byCategory.value}
		CategoryArray.push(CategoryInfo)
		var jsonInfoCategory= JSON.stringify(CategoryArray)
	</c:forEach>
		
		console.log(jsonInfoDay); 
		console.log(jsonInfoMonth); 
		console.log(jsonInfoYear); 
		console.log(jsonInfoBook); 
		console.log(jsonInfoCategory); 
		
	new Morris.Line({
		  element: 'IncomesByDay',
		  data: JSON.parse(jsonInfoDay),
		  xkey: 'day',
		  ykeys: ['val'],
		  labels: ['일 매출'],
		  xLabels:['day'],
		  yLabelFormat:function(y){return y +' krw';},
		});
	
	new Morris.Line({
		  element: 'IncomesByMonth',
		  data: JSON.parse(jsonInfoMonth),
		  xkey: 'month',
		  ykeys: ['val'],
		  labels: ['월 매출'],
		  xLabels:['month'],
		  yLabelFormat:function(y){return y +' krw';},
		});
	
	new Morris.Line({
		  element: 'IncomesByYear',
		  data: JSON.parse(jsonInfoYear),
		  xkey: 'year',
		  ykeys: ['val'],
		  labels: ['연 매출'],
		  xLabels:['year'],
		  yLabelFormat:function(y){return y +' krw';},
		});
	
	var IncomeByBooks =
		new Morris.Bar({
		  element: 'IncomesByBook',
		  data: JSON.parse(jsonInfoBook),
		  xkey: 'book',
		  ykeys: ['val'],
		  labels: ['매출'],
		  yLabelFormat:function(y){return y +' krw';}
		});
	
	var IncomeByCategory = 
		new Morris.Donut({
		  element: 'IncomesByCategory',
		  data: JSON.parse(jsonInfoCategory),
		  formatter: function(value,data){
			  return Math.floor(value/sum*100)+'%';
			  }
		});
	IncomeByCategory.options.data.forEach(function(label, i) {
		    var legendItem = $('<span></span>').text( label['label'] + " ( " +label['value'] + " 원)" ).prepend('<br><span>&nbsp;</span>');
		    legendItem.find('span')
		      .css('backgroundColor', IncomeByCategory.options.colors[i])
		      .css('width', '20px')
		      .css('display', 'inline-block')
		      .css('margin', '5px');
		    $('#legend').append(legendItem)
		  });

</script>
</body>
</html>