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
<link rel ="stylesheet" href="resources/CSS/Bookstore/Main.css">
<c:set value="${sessionScope.loginfo.id}" var="userId" />

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