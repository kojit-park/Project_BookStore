<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<h1>3달마다 초기화 됩니다.</h1>
<h3>이벤트 기간: 8월 1일 ~ 10월 31일</h3>
<table border="1" cellspacing="2px" cellpadding="2px" style="text-align: center;">
	<tr>
		<td><b id="bingo_1">1권 이상 구매</b></td>
		<td><b id="bingo_2">'문학' 카테고리 구매</b></td>
		<td><b id="bingo_3">'총류' '철학' '언어' '종교'</b></td>
	</tr>
	
	<tr>
		<td><b id="bingo_4">2권 이상 구매</b></td>
		<td><b id="bingo_5">출시 3달 이내 시간</b></td>
		<td><b id="bingo_6">올해 출시된 책 구매</b></td>
	</tr>
	
	<tr>
		<td><b id="bingo_7">3권 이상 구매</b></td>
		<td><b id="bingo_8">'역사' '예술'</b></td>
		<td><b id="bingo_9">'자연' '기술' '사회 과학'</b></td>
	</tr>
</table>
<h2>총 빙고갯수: ${count }</h2>

<script>
alert("bingo Logic")

	if(${bingo[0]})
		document.getElementById("bingo_1").innerHTML = "X"
	if(${bingo[1]})
		document.getElementById("bingo_2").innerHTML = "X"
	if(${bingo[2]})
		document.getElementById("bingo_3").innerHTML = "X"
	if(${bingo[3]})
		document.getElementById("bingo_4").innerHTML = "X"
	if(${bingo[4]})
		document.getElementById("bingo_5").innerHTML = "X"
	if(${bingo[5]})
		document.getElementById("bingo_6").innerHTML = "X"
	if(${bingo[6]})
		document.getElementById("bingo_7").innerHTML = "X"
	if(${bingo[7]})
		document.getElementById("bingo_8").innerHTML = "X"
	if(${bingo[8]})
		document.getElementById("bingo_9").innerHTML = "X"


		
// bingo.bsmall 로 보내면 컨트롤러에서
// id로 orderdao에서 shoping result 나온결과를 찾아와서 
// 각각의 bnum으로 조회한 결과를 리스트로 뽑아서
// 구매 날짜 기준으로 카운트 / 각각의 카테고리별 분류 / 출판 날짜 분류
//if문에 걸리면 div에 그림을 띄워서 테이블을 채우자.

</script>
</body>
</html>