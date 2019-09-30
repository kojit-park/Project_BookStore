<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/CSS/slick.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/CSS/slick-theme.css"/>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<style type="text/css">
.slick-img{
	width: 150px;

}
.best_ranking_num{
	padding-bottom: 5px;
	text-align: center;
	font-size: large;
	color: #666;
	width: 150px;
}
</style>
</head>
<body>

<div class="best_book_slick" style="width: 900px; align-content: center;">
			
				<c:forEach items="${BestSellers }" var="best" varStatus="status">
						<div><p class="best_ranking_num" >${status.index +1 }위</p><a href="bestBook.bs?title=${best }"><img class="slick-img" alt="${status.index }" src="${pageContext.request.contextPath}/resources/Img/${best}.jpg" style="width: 100px;height: 140px; display: block; margin: auto;"></a></div>
				</c:forEach>

</div>

<script type="text/javascript">
 $(document).ready(function(){
	 $('.best_book_slick').slick({
		  infinite: true,
		  slidesToShow: 5,
		  slidesToScroll: 1,
		  dots:true,
		  arrows:true,
		  autoplay: true,
		  autoplaySpeed: 2000
		});
	    });
</script>
	

</body>
</html>