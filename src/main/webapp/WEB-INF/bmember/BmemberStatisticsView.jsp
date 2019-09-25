<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../tagsIn.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="StatisticsBirth" style="height: 250px;"></div>
	<div id="StatisticsGenre" style="height: 250px;"></div>
	<div id="StatisticsGender" style="height: 250px;"></div>
<script type="text/javascript">

var BirthArray = new Array();
var GenreArray = new Array();
var GenderArray = new Array();

	<c:forEach items="${memberByBirth}" var="byBirth">
		var BirthInfo = new Object();
		BirthInfo.birth = "${byBirth.key}"
		BirthInfo.val = ${byBirth.value}
		BirthArray.push(BirthInfo)
		var jsonInfoBirth =  JSON.stringify(BirthArray)
	</c:forEach>  
		
	<c:forEach items="${memberByGenre}" var="byGenre">
		var GenreInfo = new Object();
		GenreInfo.genre = "${byGenre.key}"
		GenreInfo.val = ${byGenre.value}
		GenreArray.push(GenreInfo)
		var jsonInfoGenre = JSON.stringify(GenreArray)
	</c:forEach>  
		
	<c:forEach items="${memberBySex}" var="byGender">
		var GenderInfo = new Object();
		GenderInfo.label = "${byGender.key}"
		GenderInfo.value = ${byGender.value}
		GenderArray.push(GenderInfo)
		var jsonInfoGender = JSON.stringify(GenderArray)
	</c:forEach>  
		
	/* 		for(var [key,value] of byDayMap ){
			DayInfo.day = key
			DayInfo.val = value
			DayArray.push(DayInfo)
			alert(key+"///"+ value)
		} */

		console.log(jsonInfoBirth); 
		console.log(jsonInfoGenre); 
		console.log(jsonInfoGender); 
	
	new Morris.Bar({
		  // ID of the element in which to draw the chart.
		  element: 'StatisticsBirth',
		  // Chart data records -- each entry in this array corresponds to a point on
		  // the chart.
		  data: JSON.parse(jsonInfoBirth),
		  // 연속성이 없는 데이터는 line 타입이 불가능 스트링이 안드감
		  xkey: 'birth',
		  // A list of names of data record attributes that contain y-values.
		  ykeys: ['val'],
		  // Labels for the ykeys -- will be displayed when you hover over the
		  // chart.
		  labels: ['Val']
		});
	
	new Morris.Bar({
		  // ID of the element in which to draw the chart.
		  element: 'StatisticsGenre',
		  // Chart data records -- each entry in this array corresponds to a point on
		  // the chart.
		  data: JSON.parse(jsonInfoGenre),
		  // 연속성이 없는 데이터는 line 타입이 불가능 스트링이 안드감
		  xkey: 'genre',
		  // A list of names of data record attributes that contain y-values.
		  ykeys: ['val'],
		  // Labels for the ykeys -- will be displayed when you hover over the
		  // chart.
		  labels: ['Val']
		});

	new Morris.Donut({
		  // ID of the element in which to draw the chart.
		  element: 'StatisticsGender',
		  // Chart data records -- each entry in this array corresponds to a point on
		  // the chart.
		  data: JSON.parse(jsonInfoGender)
		  // 연속성이 없는 데이터는 line 타입이 불가능 스트링이 안드감
		  //xkey: 'gender',
		  // A list of names of data record attributes that contain y-values.
		  //ykeys: ['val'],
		  // Labels for the ykeys -- will be displayed when you hover over the
		  // chart.
		  //labels: ['Val']
		});
</script>	
	
</body>
</html>