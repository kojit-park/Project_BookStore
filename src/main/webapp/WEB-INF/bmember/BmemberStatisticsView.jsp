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

<title>Member Statastics</title>
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
<div style="width: 80%; padding: 10%;text-align: center;">
	<div id="StatisticsBirth" style="height: 250px;"></div>
		<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
	<div id="StatisticsGenre" style="height: 250px;"></div>
		<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
	<div id="legend" class="donut-legend" style="text-align: left"></div>
	<div id="StatisticsGender" style="height: 250px;"></div>
</div>
		<hr style="margin-top: 0;border-bottom: 2px solid #A6A6A6;">
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

	var StatisticsGender=
	new Morris.Donut({
		  element: 'StatisticsGender',
		  data: JSON.parse(jsonInfoGender)
		});
	StatisticsGender.options.data.forEach(function(label, i) {
	    var legendItem = $('<span></span>').text( label['label'] + " ( " +label['value'] + " 명)" ).prepend('<br><span>&nbsp;</span>');
	    legendItem.find('span')
	      .css('backgroundColor', StatisticsGender.options.colors[i])
	      .css('width', '20px')
	      .css('display', 'inline-block')
	      .css('margin', '5px');
	    $('#legend').append(legendItem)
	  });
</script>	
	
</body>
</html>