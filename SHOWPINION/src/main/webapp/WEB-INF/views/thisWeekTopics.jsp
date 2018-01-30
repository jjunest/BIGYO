<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 나누기의 몫을 정수값으로 구하기 위한 jstl 태그 라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Listsize를 위한 jstl태그라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	/* contextpath cp : /bagyo */
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

<!-- SITE TITTLE -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Show Your Opinion - 쇼피니언</title>


<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- custom css (blue color by default) -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" media="screen">

<!-- font awesome for icons -->
<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- flex slider css -->
<link href="${pageContext.request.contextPath}/resources/css/flexslider.css" rel="stylesheet" type="text/css" media="screen">
<!-- animated css  -->
<link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet" type="text/css" media="screen">




<!--owl carousel css-->
<link href="${pageContext.request.contextPath}/resources/owl-carousel/assets/owl.carousel.css" rel="stylesheet" type="text/css" media="screen">
<link href="${pageContext.request.contextPath}/resources/owl-carousel/assets/owl.theme.default.css" rel="stylesheet" type="text/css" media="screen">
<!--mega menu -->
<link href="${pageContext.request.contextPath}/resources/css/yamm.css" rel="stylesheet" type="text/css">
<!--popups css-->
<link href="${pageContext.request.contextPath}/resources/css/magnific-popup.css" rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


<style>
.mouseOverHighlight {
	border-bottom: 1px solid blue;
	cursor: pointer !important;
	color: blue;
	pointer-events: auto;
}
</style>
</head>
<body class="body-wrapper">
	<!-- HEADER FILE INCLUDE  -->
	<jsp:include page="navbar_header.jsp"></jsp:include>
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h4>- 이번주 쇼피니언 주제</h4>
				</div>
				<div class="col-sm-6 hidden-xs text-right">
					<ol class="breadcrumb">
						<li><a href="index.html">TV 토론</a></li>
						<li>쇼피니언 선정</li>
					</ol>
				</div>
			</div>
		</div>
	</div>

	<!-- 이번주 TV토론 SECTION 시작 -->
	<!--breadcrumbs-->
	<div class="divide80"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="center-heading">
					<h2>이번주 TV토론 주제</h2>
					<span class="center-line"></span>
				</div>
				<!--center-heading-->
			</div>
		</div>
		<!--row-->
		<div class="row">
			<div class="col-md-12">
				<div id="thisWeek_tvTopics-carousel" class="owl-carousel owl-theme owl-spaced">
					<div>

						<div class="item-img-wrap" style="border: 4px solid #59df57; border-radius: 5px;">
							<a href="${pageContext.request.contextPath}/detail_TVshow_Topics"> <img src="${pageContext.request.contextPath}/resources/img/tvshow_poster_SSULJON.jpg" class="img-responsive" alt="workimg">
							</a>

						</div>
						<!--item img wrap-->
						<div class="work-desc">
							<h3>
								<a href="portfolio-single.html">금융실명제 도입이 필요한가?</a>
							</h3>
							<span>방송날짜 :</span> <span id="tvShowDate"> 2017-08-12</span>
							<p>
							<h3 class="heading-progress">
								실시간 쇼피니언 지수 <span class="pull-right">중립 우세</span>
							</h3>
							<div class="progress">
								<div class="progress-bar " style="width: 20%; background-color: blue" role="progressbar">찬성</div>
								<div class="progress-bar " style="width: 40%; background-color: green" role="progressbar">중립</div>
								<div class="progress-bar " style="width: 40%; background-color: red" role="progressbar">반대</div>
							</div>
						</div>
						<!--work desc-->
					</div>
					<!--owl item-->
				</div>

			</div>
		</div>
		<!--row-->
	</div>
	<!-- 이번주 TV토론 SECTION 끝 -->

	<!-- 이번주 showpinion SECTION 시작 -->
	<!--breadcrumbs-->
	<div class="divide80"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="center-heading">
					<h2>이번주 쇼피니언 선정 주제</h2>
					<span class="center-line"></span>
				</div>
				<!--center-heading-->
			</div>
		</div>
		<!--row-->
		<div class="row">
			<div class="col-md-12">
				<div id="thisWeek_showpinionTopics-carousel" class="owl-carousel owl-theme owl-spaced">
					<div>

						<div class="item-img-wrap " style="border: 4px solid #59df57; border-radius: 5px;">
							<a href="${pageContext.request.contextPath}/detail_TVshow_Topics"> <img src="${pageContext.request.contextPath}/resources/img/tvshow_poster_SSULJON.jpg" class="img-responsive" alt="workimg">
							</a>

						</div>
						<!--item img wrap-->
						<div class="work-desc">
							<h3>
								<a href="portfolio-single.html">금융실명제 도입이 필요한가?</a>
							</h3>
							<span>작성자:</span> <span id="tvShowDate"> jjunest </span>
							<p>
							<h3 class="heading-progress">
								실시간 쇼피니언 지수 <span class="pull-right">중립 우세</span>
							</h3>
							<div class="progress">
								<div class="progress-bar " style="width: 20%; background-color: blue" role="progressbar">찬성</div>
								<div class="progress-bar " style="width: 40%; background-color: green" role="progressbar">중립</div>
								<div class="progress-bar " style="width: 40%; background-color: red" role="progressbar">반대</div>
							</div>
						</div>
						<!--work desc-->
					</div>
					<!--owl item-->
				</div>

			</div>
		</div>
		<!--row-->
	</div>
	<div class="divide80"></div>
	<!-- 이번주 showpinion SECTION 끝 -->

	<!-- HEADER FILE INCLUDE  -->
	<jsp:include page="footer.jsp"></jsp:include>




	<!--scripts and plugins -->
	<!--must need plugin jquery-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!--bootstrap js plugin-->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!--easing plugin for smooth scroll-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.min.js" type="text/javascript"></script>
	<!--sticky header-->
	<script type="${pageContext.request.contextPath}/resources/text/javascript" src="js/jquery.sticky.js"></script>
	<!--flex slider plugin-->
	<script src="${pageContext.request.contextPath}/resources//js/jquery.flexslider-min.js" type="text/javascript"></script>
	<!--parallax background plugin-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js" type="text/javascript"></script>


	<!--digit countdown plugin-->
	<script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
	<!--digit countdown plugin-->
	<script src="${pageContext.request.contextPath}/resources//js/jquery.counterup.min.js" type="text/javascript"></script>
	<!--on scroll animation-->
	<script src="${pageContext.request.contextPath}/resources/js/wow.min.js" type="text/javascript"></script>
	<!--owl carousel slider-->
	<script src="${pageContext.request.contextPath}/resources/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
	<!--popup js-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js" type="text/javascript"></script>




	<!--customizable plugin edit according to your needs-->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js" type="text/javascript"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();

			$("#thisWeek_tvTopics-carousel").owlCarousel({
				loop : true,
				margin : 0,
				nav : false,
				responsive : {
					0 : {
						items : 1
					},
					600 : {
						items : 2
					},
					1000 : {
						items : 4
					}
				}
			});

			$("#thisWeek_showpinionTopics-carousel").owlCarousel({
				loop : true,
				margin : 0,
				nav : false,
				responsive : {
					0 : {
						items : 1
					},
					600 : {
						items : 2
					},
					1000 : {
						items : 4
					}
				}
			});

		});

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/coinCalendar") != -1) {

				$("#navmenu_coinCalendar").css("color", "#39a1f4");

			}

		}
	</script>

</body>

</html>
