<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
</head>
<body>

	<div id="IncomesByDay" style="height: 250px;"></div>
	<div id="IncomesByMonth" style="height: 250px;"></div>
	<div id="IncomesByYear" style="height: 250px;"></div>
	<div id="IncomesByBook" style="height: 400px;"></div>


<script type="text/javascript">

var DayArray = new Array();
var MonthArray = new Array();
var YearArray = new Array();

var BookArray = new Array();
	
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
		
	/* 		for(var [key,value] of byDayMap ){
			DayInfo.day = key
			DayInfo.val = value
			DayArray.push(DayInfo)
			alert(key+"///"+ value)
		} */

		console.log(jsonInfoDay); 
		console.log(jsonInfoMonth); 
		console.log(jsonInfoYear); 
		console.log(jsonInfoBook); 
		
	new Morris.Line({
		  // ID of the element in which to draw the chart.
		  element: 'IncomesByDay',
		  // Chart data records -- each entry in this array corresponds to a point on
		  // the chart.
		  data: JSON.parse(jsonInfoDay),
		  // The name of the data record attribute that contains x-values.
		  xkey: 'day',
		  // A list of names of data record attributes that contain y-values.
		  ykeys: ['val'],
		  // Labels for the ykeys -- will be displayed when you hover over the
		  // chart.
		  labels: ['Val'],
		  xLabels:['year']
		});
	
	new Morris.Line({
		  // ID of the element in which to draw the chart.
		  element: 'IncomesByMonth',
		  // Chart data records -- each entry in this array corresponds to a point on
		  // the chart.
		  data: JSON.parse(jsonInfoMonth),
		  // The name of the data record attribute that contains x-values.
		  xkey: 'month',
		  // A list of names of data record attributes that contain y-values.
		  ykeys: ['val'],
		  // Labels for the ykeys -- will be displayed when you hover over the
		  // chart.
		  labels: ['Val']
		});
	
	new Morris.Line({
		  // ID of the element in which to draw the chart.
		  element: 'IncomesByYear',
		  // Chart data records -- each entry in this array corresponds to a point on
		  // the chart.
		  data: JSON.parse(jsonInfoYear),
		  // The name of the data record attribute that contains x-values.
		  xkey: 'year',
		  // A list of names of data record attributes that contain y-values.
		  ykeys: ['val'],
		  // Labels for the ykeys -- will be displayed when you hover over the
		  // chart.
		  labels: ['Val']
		});
	
	new Morris.Bar({
		  // ID of the element in which to draw the chart.
		  element: 'IncomesByBook',
		  // Chart data records -- each entry in this array corresponds to a point on
		  // the chart.
		  data: JSON.parse(jsonInfoBook),
		  // 연속성이 없는 데이터는 line 타입이 불가능 스트링이 안드감
		  xkey: 'book',
		  // A list of names of data record attributes that contain y-values.
		  ykeys: ['val'],
		  // Labels for the ykeys -- will be displayed when you hover over the
		  // chart.
		  labels: ['Val']
		});

</script>
</body>
</html>