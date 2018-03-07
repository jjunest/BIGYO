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
<!-- bootstrap SLIDER 라이브러리 CSS 추가 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/css/bootstrap-slider.min.css" rel="stylesheet" type="text/css">
<!-- bootsstrap SELECT 라이브러리 CSS 추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
<!-- 내가 만든 custom css 파일 첨부 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jjunest.css">
<!-- 랭킹을 위한 데이터 테이블 -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

<!-- carousel 를 위한 css 추가 -->
<!-- Revolution Style-sheet -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/rs-plugin/css/settings.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rev-style.css">



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
					<h4>SHOW YOUR OPINION</h4><h4>- 쇼피니언 소개</h4>
				</div>
			</div>
		</div>
	</div>
	<div class="divide80"></div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="center-heading">
					<h2 ># Show Your Opinion</h2>
					<span class="center-line"></span>
					<p class="sub-text margin40">
						현재 대한민국에 좌와우, 지역감정, 남성과 여성, 세대간 갈등이 심해지고 있고, <br> 합리적인 사고, 서로에 대한 공감 그리고 이해는 줄어들고 있습니다. <br> <strong style="font-weight: bold; color: #32c5d2">#쇼피니언</strong>은 건전한 사고 방식을 유도하고, 사회 통합과 사회발전에 도움이 되기 위해
						만든 서비스입니다.  <br> 대한민국의 건전한 사회 성장을 위해 <strong style="font-weight: bold; color: #32c5d2">#쇼피니언</strong>이 되어주세요.
					</p>
				</div>
			</div>

		</div>

		<section class="services-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="center-heading">
						<h2>#쇼피니언의 탄생 이유</h2>
						<span class="center-line"></span>
					</div>
				</div>
			</div>
			<!--center heading row-->
			<div class="row">
				<div class="col-md-4 col-sm-6 margin20">
					<div class="services-box wow animated fadeInUp" data-wow-duration="700ms" data-wow-delay="100ms">
						<div class="services-box-icon">
							<i class="far fa-check-circle" style="font-size: 50px; color: #32c5d2"></i>
						</div>
						<!--services icon-->
						<div class="services-box-info">
							<h4>양극으로 치닷는 갈등</h4>
							<p>
								합리적인 토론 공간과 문화를 제공함으로써<br>양극 갈등의 문제를 해결하고 싶습니다.
							</p>
						</div>
					</div>
					<!--services box-->
				</div>
				<!--services col-->
				<div class="col-md-4 col-sm-6 margin20">
					<div class="services-box wow animated fadeInUp" data-wow-duration="700ms" data-wow-delay="300ms">
						<div class="services-box-icon">
							<i class="far fa-check-circle" style="font-size: 50px; color: #32c5d2"></i>
						</div>
						<!--services icon-->
						<div class="services-box-info">
							<h4>예쁘고 멋진 생각을 공유하는 SNS</h4>
							<p>
								예쁘고 잘생긴 사진만을 공유하는 것이 아니라<br> 예쁘고 멋진 '생각'을 공유해보면 어떨까요?
							</p>
						</div>
					</div>
					<!--services box-->
				</div>
				<!--services col-->

				<!--services col-->
				<div class="col-md-4 col-sm-6 margin20">
					<div class="services-box wow animated fadeInUp" data-wow-duration="700ms" data-wow-delay="200ms">
						<div class="services-box-icon">
							<i class="far fa-check-circle" style="font-size: 50px; color: #32c5d2"></i>
						</div>
						<!--services icon-->
						<div class="services-box-info">
							<h4>합리적/이성적인 여론 동향 정보</h4>
							<p>
								쇼피니언 및 일반 지수를 통해 <br> 합리적인 여론의 동향을 제공하겠습니다. <br>
							</p>

						</div>
					</div>
					<!--services box-->
				</div>
				<!--services col-->
				<div class="col-md-4 col-sm-6 margin20">
					<div class="services-box wow animated fadeInUp" data-wow-duration="700ms" data-wow-delay="300ms">
						<div class="services-box-icon">
							<i class="far fa-check-circle" style="font-size: 50px; color: #32c5d2"></i>
						</div>
						<!--services icon-->
						<div class="services-box-info">
							<h4>상대방 의견에 대한 공감지수</h4>
							<p>
								상대방 의견에도 합리적인 근거가 있습니다.<br>상대방의 합리적 근거에 멋있게 공감해주세요.
							</p>
						</div>
					</div>
					<!--services box-->
				</div>
				<!--services col-->
				<div class="col-md-4 col-sm-6 margin20">
					<div class="services-box wow animated fadeInUp" data-wow-duration="700ms" data-wow-delay="500ms">
						<div class="services-box-icon">
							<i class="far fa-check-circle" style="font-size: 50px; color: #32c5d2"></i>
						</div>
						<!--services icon-->
						<div class="services-box-info">
							<h4>소극적인 의견 표출 문화</h4>
							<p>
								시사/정치/사회문제에 유독 말을 아끼는 사회!<br> 적극적인 의견 개진 문화를 지향합니다
							</p>
						</div>
					</div>
					<!--services box-->
				</div>
				<!--services col-->
				<div class="col-md-4 col-sm-6 margin20">
					<div class="services-box wow animated fadeInUp" data-wow-duration="700ms" data-wow-delay="600ms">
						<div class="services-box-icon">
							<i class="far fa-check-circle" style="font-size: 50px; color: #32c5d2"></i>
						</div>
						<!--services icon-->
						<div class="services-box-info">
							<h4>낯설고 어려운 논리적인 주장 표출</h4>
							<p>
								주요 근거들을 쉽게 선택하는 방법으로 <br> 누구나 논리적인 주장을 펼칠 수 있습니다.
							</p>
						</div>
					</div>
					<!--services box-->
				</div>
				<!--services col-->
			</div>
			<!--services row-->
		</div>
		</section>
		<!--section services-->

		<div class="divide80"></div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	<!--scripts and plugins -->
	<!--must need plugin jquery-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!--bootstrap js plugin-->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!--easing plugin for smooth scroll-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.min.js" type="text/javascript"></script>
	<!--sticky header-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
	<!--flex slider plugin-->
	<script src="${pageContext.request.contextPath}/resources//js/jquery.flexslider-min.js" type="text/javascript"></script>
	<!--parallax background plugin-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.isotope.min.js" type="text/javascript"></script>
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
	<!--image loads plugin -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.imagesloaded.min.js" type="text/javascript"></script>
	<!--customizable plugin edit according to your needs-->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/isotope-custom.js" type="text/javascript"></script>
	<!-- 구글 차트를 위한 스크립트 추가 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<!-- multipart 폼을 AJAX로 처리하기 위한 제이ㅝ리 -->
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<!-- 부트스트랩 SLIDER SELECTOR를 위한 자바스크립트 추가  -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/bootstrap-slider.min.js"></script>
	<!-- 부트스트랩 CUSTOM-SELECTOR 를 위한 자바스크립트 추가  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	<!-- multipart 폼을 AJAX로 처리하기 위한 제이ㅝ리 -->
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<!-- fa class 추가  -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<!-- DataTable 테이블 랭킹을 위한 자바스크립트 CDN -->
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js" type="text/javascript"></script>


	<!-- CAROUSEL 를 위한 자바스크립트 추가-->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/revolution-custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/cubeportfolio/js/jquery.cubeportfolio.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/cube-portfolio.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/pace.min.js" type="text/javascript"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
		});

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/introduce") != -1) {

				$("#navmenu_introduce").css("color", "#39a1f4");

			}

		}
	</script>
</body>

</html>
