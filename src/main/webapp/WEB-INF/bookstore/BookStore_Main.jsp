<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../tagsIn.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BookStore 메인 페이지</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link href="resources/CSS/bootstrap.min.css" rel="stylesheet">
<link href="resources/CSS/kfonts2.css" rel="stylesheet">

<c:set value="${sessionScope.loginfo.id}" var="userId" />
<style type="text/css">
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td,
	form, fieldset, legend, input, textarea, button, select {
	margin: 0;
	padding: 0;
}

input {
	border: solid 1px #A6A6A6;
	padding: 10px 20px;
	box-sizing: border-box;
	border-radius: 3px;
}

input:focus {
	outline: 0;
	border: solid 1px #4572ed;
}

.btn {
	background-color: #368AFF;
	color: white;
	padding: 10px 20px;
	border: none;
	text-decoration: none;
	border-radius: 5px;
}

.btn:focus {
	background-color: #4572ed;
	color: white;
	padding: 10px 20px;
	border: none;
	text-decoration: none;
	border-radius: 5px;
}

select {
	padding: 6px 16px;
	box-sizing: border-box;
	-webkit-appearance: none;
	height: 37px;
	width: 110px;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	background-color: white;
}

table {
	border-top: solid 1px white; /* #A6A6A6 */
	border-collapse: collapse;
	margin-top: 20px;
}

th, td, tr {
	border-bottom: solid 1px white;
	padding: 10px;
	height: 20px;
}

.top_header {
	background-color: #4572ed;
	border-bottom: 1px solid white;
}

.top_header .top_header_contents {
	display: table;
	position: relative;
	margin: 0 auto;
	width: 900px;
}

.top_header .top_header_contents .top_center {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

.top_header .top_header_contents .top_right {
	display: table-cell;
	vertical-align: middle;
	text-align: right;
}

ul, li, ol {
	list-style: none;
	margin: 0;
}

a {
	text-decoration: none;
	color: #555555;
}

.top_middle {
	background-color: #4572ed;
	border-bottom: 1px solid white;
}

.top_middle .top_middle_contents {
	display: table;
	position: relative;
	margin: 0 auto;
	width: 900px;
}

.top_middle .top_middle_contents .top_center {
	display: table-cell;
	vertical-align: middle;
	text-align: left;
	margin-left: 10px;
}

form {
	margin: 0 auto;
	width: 590px;
	text-align: center;
}

.logo {
	float: left;
	margin: 32px;
}

.search {
	position: relative;
	float: right;
	width: 590px;
	margin: 0 auto;
	vertical-align: middle;
	margin-top: 29px;
	margin-right: 100px;
}

#searchMain {
	width: 360px;
}

.top_bottom {
	width: 100%;
	border-top: 1px solid #e8e8e8;
	border-bottom: 1px solid #e8e8e8;
}

.gnb_menu {
	position: relative;
	width: 960px;
	height: 40px;
	margin: 0 auto;
}

.gnb_menu .gnb_ca_menu {
	float: left;
	margin: 0;
}

.gnb_menu .gnb_ca_menu .gcm {
	float: left;
	height: 40px;
}

.gnb_menu .gnb_ca_menu .gcm .gcm_link {
	display: block;
	position: relative;
	height: 40px;
	cursor: pointer;
	color: #666;
}

.gcm {
	margin-right: 10px;
	margin-left: 10px;
	padding-top: 9px;
}

.gnb_menu .gnb_ca_menu .gcm .gcm_link span {
	display: block;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
}

.gnb_menu .gnb_ca_menu .gcm .gmtotal {
	width: 75px;
}

.gnb_menu .cate_total_wrap {
	position: absolute;
	top: 40px;
	left: 0;
	width: 480px;
	height: 570p;
	border: 1px solid #bfbfbf;
	background: #FFF;
	z-index: 400;
}

.gnb_menu .cate_total_wrap h4 {
	margin: 0 0 12px 0;
	color: #0d47a1;
}

.gnb_menu .cate_total_wrap .cate_list {
	float: left;
	width: 240px;
	margin-bottom: 18px;
}

.gnb_menu .cate_total_wrap .ct_01 {
	float: left;
	border-right: 1px solid #f2f2f2;
	width: 160px;
	height: 704px;
	padding: 16px 0 0 20px;
}

.gnb_menu .cate_total_wrap .ct_02 {
	float: left;
	width: 125px;
	height: 704px;
	padding: 16px 0 0 20px;
}

.gnb_menu .cate_total_wrap .ct_05 {
	float: left;
	border-left: 1px solid #f2f2f2;
	width: 120px;
	height: 704px;
	padding: 16px 0 0 20px;
}

.gnb_menu .cate_total_wrap h4 {
	margin: 0 0 12px 0;
}

.gnb_menu .cate_total_wrap .cate_list {
	float: left;
	width: 120px;
	margin-bottom: 18px;
}

.gnb_menu .gnb_se_menu {
	float: right;
	margin: 0;
}

.gnb_menu .gnb_se_menu li {
	position: relative;
	float: left;
	height: 40px;
	margin-right: 15px;
	padding-top: 9px;
}

.gnb_menu .gnb_se_menu li .gm_best {
	width: 58px;
}

.gnb_menu .ico_promotion {
	position: absolute;
	top: 8px;
	left: 60px;
}

.footer {
	margin-top: 8px;
	border-top: 1px solid #e3e7ee;
	background: #f8f8f8;
	text-align: left;
	padding: 4px 0 6px 0;
}

.m_banner {
	position: relative;
	width: 900px;
	height: 395px;
	margin: 0 auto;
}

.m_banner .swiper-container {
	width: 960px;
	height: 352px;
	margin: 0 auto;
	overflow: hidden;
}

.footer .mob {
	display: table;
	position: relative;
	margin: 0 auto;
	width: 900px;
	text-align: center;
}

.mob_btn {
	width: 300px;
	border-radius: 5px;
	padding: 5px 7px;
	border: none;
	text-decoration: none;
	color: #368AFF;
	cursor: pointer;
	margin-top: 4px;
}

.gnb_menu .cate_total_wrap .h4_gap {
	clear: both;
	margin-top: 10px;
}

.gnb_menu .cate_total_wrap h4 {
	margin: 0 0 12px 0;
}

.m_banner {
	position: relative;
	width: 960px;
	height: 395px;
	margin: 0 auto;
}

div {
	display: block;
}

button {
	border: none;
}
/* 이전버튼 */
.aw_type_main_box .aw_l {
	z-index: 10;
	position: absolute;
	top: 40%;
	left: -23px;
	width: 23px;
	height: 45px;
	background: #FFF
		url(http://www.bandinlunis.com/images/common/2014/sp_common.gif)
		no-repeat 0 -58px;
	cursor: pointer;
}
/* 이전, 다음 버튼 */
.aw_type_main_box .ns {
	display: none;
}
/* 다음버튼 */
.aw_type_main_box .aw_r {
	z-index: 10;
	position: absolute;
	top: 40%;
	right: -23px;
	width: 23px;
	height: 45px;
	background: #FFF
		url(http://www.bandinlunis.com/images/common/2014/sp_common.gif)
		no-repeat -46px -58px;
	cursor: pointer;
}

.m_banner {
	position: relative;
	width: 960px;
	height: 352px;
	margin: 0 auto
}

.chart_best {
	width: 900px;
	margin: 0 auto;
	position: relative;
	clear: both;
	margin-top: 40px;
	padding-bottom: 20px;
}

.title_1 {
	position: relative;
	cursor: default;
}

.best_list_wrapper {
	padding-left: 240px;
	padding-top: 20px;
	position: relative;
}

.best_rank {
	width: 16.66667%;
	float: left;
	margin-top: 20px;
}

.best_ranking_num {
	padding-bottom: 5px;
	text-align: center;
	font-size: large;
	color: #666;
}

.bestbook_img img {
	height: 167px;
}

.best_rank .bestbook_img {
	position: relative;
	text-align: left;
	display: block;
	margin: 0 auto;
}

.best_rank .bestbook_img {
	width: 110px;
}

.best_rank .bestbook_name {
	width: 110px;
	text-align: left;
	display: block;
	margin: 8px auto 0 auto;
}

.bestbook_name {
	margin-top: 3px;
}

.bestbook_name .author {
	color: #666;
	font-weight: 400;
}
</style>

</head>
<body>
	<div class="top_header">
		<div class="top_header_contents">
			<div class="top_right">
				<ul
					style="display: inline-block; text-align: left; margin-right: -8px;">
					<c:if test="${userId == null}">
						<li
							style="float: left; position: relative; margin: 5px; color: white;">
							<a href="login.bm" style="color: white;"><b>로그인</b></a>
						</li>
						<li
							style="float: left; position: relative; margin: 5px; color: white;">
							<a href="insert.bm" style="color: white;"><b>회원가입</b></a>
						</li>
					</c:if>
					<c:if test="${userId != null}">
						<li
							style="float: left; position: relative; margin: 5px; color: white;">${userId}님</li>
						<li
							style="float: left; position: relative; margin: 5px; color: white;">
							<a href="logOut.bm" style="color: white;"><b>로그아웃</b></a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="top_middle">
		<div class="top_middle_contents">
			<div class="top_center">
				<div class="logo" style="margin: 0;">
					<a href="main.bs"><img alt="홈으로"
						src="${pageContext.request.contextPath}/resources/Img/Logo/1.jpg"
						width="100px;"></a>
				</div>
				<div class="search">
					<form name="f" action="list.bs">
						<div id="Main_cate">
							<div>
								<select id="sel_cateMain" name="category">
									<option value="all">전체</option>
									<option value="title">제목</option>
									<option value="author">저자</option>
									<option value="publisher">출판사</option>
								</select> <input type="text" name="keyword" id="searchMain"> <input
									type="submit" value="검색" class="btn"
									style="background-color: white; color: #4572ed;">

							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- <hr style="margin-top: 0; border-bottom: 2px solid #A6A6A6;"> -->
		</div>
	</div>

	<div class="top_bottom">
		<div class="gnb_menu">
			<ul class="gnb_ca_menu">
				<!-- 전체보기 카테고리 -->
				<li class="gcm"><a href="" class="gcm_link gmtotal"
					onmouseover="javascript:toggleLayer('01')"
					onmouseout="javascript:toggleLayer('01')"> <span></span>&equiv;전체보기
				</a>
					<div id="cLayer01" class="cate_total_wrap" style="display: none"
						onmouseover="javascript:toggleLayer('01')"
						onmouseout="javascript:toggleLayer('01')">
						<div class="ct_01">
							<h4>
								<a href="#">도서</a>
							</h4>
							<ul class="cate_list">
								<li><a href="#">소설</a></li>
								<li class="alt"><a href="#">장르소설</a></li>
								<li><a href="#">시/에세이/기행</a></li>
								<li><a href="#">청소년교양</a></li>
								<li><a href="#">경제/경영</a></li>
								<li><a href="#">자기계발</a></li>
							</ul>
							<h4 class="h4_gap">
								<a href="#">수험서</a>
							</h4>
							<ul class="cate_list">
								<li><a href="#">공무원</a></li>
								<li><a href="#">국가고시</a></li>
								<li><a href="#">임용시험</a></li>
								<li><a href="#">대기업/공기업/면접</a></li>
								<li><a href="#">대표저자수험서</a></li>
							</ul>
							<ul class="cate_list">
								<li><a href="#">국가기술자격증</a></li>
								<li><a href="#">국가전문자격증</a></li>
								<li><a href="#">민간전문자격증</a></li>
								<li><a href="#">외국자격증</a></li>
								<li></li>
							</ul>
							<ul class="cate_list">
								<li><a href="#">편입/진학/전문대학원</a></li>
								<li><a href="#">공부법/안내서</a></li>
							</ul>
						</div>
						<!-- ct_01 -->
						<div class="ct_02">
							<h4>
								<a href="#">인문도서</a>
							</h4>
							<ul class="cate_list">
								<li><a href="#">로맨스소설</a></li>
								<li><a href="#">장르소설</a></li>
								<li><a href="#">만화</a></li>
							</ul>
							<ul class="cate_list">
								<li><a href="#">소설</a></li>
								<li><a href="#">시/에세이/기행</a></li>
								<li><a href="#">여행/취미/레저</a></li>
							</ul>
							<ul class="cate_list">
								<li><a href="#">경제/경영</a></li>
								<li><a href="#">자기계발</a></li>
							</ul>
							<ul class="cate_list">
								<li><a href="#">인문</a></li>
								<li><a href="#">역사/신화/문화</a></li>
								<li><a href="#">사회/정치/법률</a></li>
								<li><a href="#">예술/대중문화</a></li>
								<li><a href="#">종교/역학</a></li>
							</ul>
							<ul class="cate_list">
								<li><a href="#">유아</a></li>
								<li><a href="#">어린이</a></li>
								<li><a href="#">청소년</a></li>
								<li><a href="#">학습/참고서</a></li>
								<li><a href="#">외국어/사전</a></li>
							</ul>
							<ul class="cate_list">
								<li><a href="#">건강/의학</a></li>
								<li><a href="#">자연과학/공학</a></li>
								<li><a href="#">컴퓨터/IT</a></li>
								<li><a href="#">개인출판물</a></li>
							</ul>
						</div>
						<!-- ct_02 -->
						<div class="ct_05">
							<h4>
								<a href="#">GIFT</a>
							</h4>
							<ul class="cate_list">
								<li><a href="list.gt">사은품 리스트</a></li>
							</ul>
							<h4 class="h4_gap">
								<a href="minigame_select.mg">미니게임</a>
							</h4>
							<ul class="cate_list">
							</ul>
						</div>
					</div></li>
				<!-- 메인카테고리 -->
				<li class="gcm"><a href="list.bs" class="gcm_link"><span></span><b>도서</b></a>
				</li>
				<li class="gcm"><a href="minigame_select.mg" class="gcm_link"><span></span><b>미니게임</b></a>
				</li>
				<li class="gcm"><a href="list.gt" class="gcm_link"><span></span><b>GIFT</b></a>
				</li>
			</ul>
			<ul class="gnb_se_menu">
				<c:choose>
					<c:when test="${userId ne null and userId ne 'admin' }">
						<li><a href="order.bsmall" class="gm_best"><span></span>내
								서재</a></li>
						<li><a href="list.bsmall" class="gm_reprice"><span></span>장바구니</a></li>
						<li><a href="list.rv" class="gm_reprice"><span></span>리뷰게시판</a></li>
						<li class="alt"><a href="#" class="gm_now"><span></span>지금혜택</a>
							<div class="ico_promotion">
								<img
									src="http://image.bandinlunis.com/images/common/2014/ico_reprice_dot_2.gif">
							</div></li>
					</c:when>
					<c:when test="${userId ne null and userId eq 'admin' }">
						<li><a href="list.bm" class="gm_new"><span></span>회원리스트</a></li>
						<li><a href="statisticsMember.bm" class="gm_new"><span></span>사용자 통계</a></li>
						<li><a href="incomeView.bsmall" class="gm_new"><span></span>매출확인</a></li>
						<li><a href="insert.bs" class="gm_new"><span></span>책 넣기</a></li>
						<li><a href="list.gt" class="gm_new"><span></span>사은품 관리</a></li>
						<li><a href="list.rv" class="gm_new"><span></span>리뷰 게시판</a></li>
					</c:when>
				</c:choose>

			</ul>
		</div>
	</div>
	<!-- 본문배너 -->
	<div class="m_banner">
		<div class="carousel slide" id="carousel-example-generic">
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/resources/Img/Main/1.jpg"
						alt="First slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/resources/Img/Main/2.jpg"
						alt="Second slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/resources/Img/Main/3.jpg"
						alt="Third slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/resources/Img/Main/4.jpg"
						alt="Fourth slide">
				</div>
			</div>
		</div>
	</div>
	<!-- 본문배너 끝 -->
	<!-- 책 순위 차트  -->
	<div class="chart_best">
		<div class="title_1">
			<h3>베스트 셀러</h3>
		</div>

		<%@include file="BestSellerList.jsp" %>

	</div>
	
	<!-- 바닥 -->
	<div class="footer">
		<div class="mob">
			<button onclick="mobileVersion()" class="mob_btn">모바일 버전</button>
		</div>

	</div>
	<script type="text/javascript">
		var BookArray = new Array();
	</script>

	<script src="resources/js/bootstrap.min.js"></script>
	<script>
		$('.carousel').carousel() /* 1 */
		function toggleLayer(id) {
		      if (document.getElementById("cLayer" + id).style.display == "block") {
		         document.getElementById("cLayer" + id).style.display = "none";
		      } else {
		         document.getElementById("cLayer" + id).style.display = "block";
		      }
		   }
		<%HttpSession remember = request.getSession();%>
		function LogIn(){
			location.href = "login.bm"
		}
		function minigame(){
			location.href = "minigame_select.mg"
		}
		function mobileVersion(){
			<%remember.removeAttribute("mobile");%>
			location.href = "main.bs?mobile=1"
		}
		
		
	</script>



</body>
</html>