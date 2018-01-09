<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 나누기의 몫을 정수값으로 구하기 위한 jstl 태그 라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Listsize를 위한 jstl태그라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collections"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

<!-- SITE TITTLE -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>준비트 홈페이지</title>

<!-- PLUGINS CSS STYLE -->
<link href="resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link href="resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/plugins/listtyicons/style.css" rel="stylesheet">
<link href="resources/plugins/bootstrapthumbnail/bootstrap-thumbnail.css" rel="stylesheet">
<link href="resources/plugins/datepicker/datepicker.min.css" rel="stylesheet">
<link href="resources/plugins/selectbox/select_option1.css" rel="stylesheet">
<link href="resources/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet">
<link href="resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
<link href="resources/plugins/isotope/isotope.min.css" rel="stylesheet">
<link href="resources/plugins/map/css/map.css" rel="stylesheet">

<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Muli:200,300,400,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">

<!-- CUSTOM CSS -->
<link href="resources/css/style.css?ver=1" rel="stylesheet">

<!-- FAVICON -->
<link href="resources/img/favicon.png" rel="shortcut icon">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<style>
@font-face {
	font-family: 'MyFont';
	src: url(resources/font/BM_HANNA_11yrs.ttf);
	font-weight: bold;
}

.articleContent {
	text-align: center;
}

.worksArea .fa {
	font-size: 100px;
	margin: 0px 0px 30px 0px;
	color: #2980bc;
}

body {
	font-family: MyFont;
}

h1 {
	color: #373c48;
}

.howWorksSection .fa {
	font-size: 100px;
	color: #2980bc;
}

.processText {
	position: absolute;
	top: 70%;
	right: 30%;
	font-size: 30px
}

.processImg {
	position: absolute;
	top: 20%;
	right: 33%;
}

@media ( max-width :768px) {
	#quickMapMenu {
		display: none;
	}
	.processText {
		margin-top: 140px;
	}
	.processImg {
		
	}
}

#footer {
	margin-bottom: -55px;
	height: 55px;
	min-height: 100%;
	height: 100%;
	_height: 100%;
}
</style>

</head>

<body class="body-wrapper">
	<div class="page-loader" style="background: url(resources/img/preloader.gif) center no-repeat #fff;"></div>
	<div class="main-wrapper">
		<!-- HEADER FILE INCLUDE  -->
		<jsp:include page="header.jsp"></jsp:include>


		<!-- SLIDER SECTION -->
		<section class="main-slider" data-loop="true" data-autoplay="true" data-interval="7000">
		<div class="inner">

			<!-- Slide One -->
			<div class="slide slide1" style="background-image: url(resources/img/index_imgs/junbit_banner1.png);">
				<div class="container">
					<div class="slide-inner1 common-inner">
						<span class="h2 from-bottom" style="font-family: MyFont; color: #ffffff; font-size: 40px">준비트를 사용하시면 가장 빠르게 <br> 비트코인 거래를 할 수 있습니다.</span><br> <span class="h1 from-bottom"
							style="font-family: MyFont; color: #ffffff; text-align: center">더 이상 좋은 기회를 놓치지 마세요.</span><br>
					</div>
				</div>
			</div>

			<!-- Slide Two -->
			<div class="slide slide2" style="background-image: url(resources/img/index_imgs/junbit_banner2.png);">
				<div class="container">
					<div class="slide-inner2 common-inner">
						<span class="h2 from-bottom" style="font-family: MyFont; color: #ffffff; font-size: 40px">Bitcoin Trading Assisting Service</span><br> <span class="h1 from-bottom"
							style="font-family: MyFont; color: #ffffff; text-align: center"> - JUNBIT beta - </span><br>
					</div>
				</div>
			</div>

			<!-- Slide Three -->
			<div class="slide slide3" style="background-image: url(resources/img/index_imgs/junbit_banner3.png);">
				<div class="container">
					<div class="slide-inner3 common-inner">
						<span class="h2 from-bottom" style="font-family: MyFont; color: #ffffff; font-size: 40px">- 아프리카tv와 유튜브 방송에서 <br>프로그램 개발 및 비트코인 방송을 시작했습니다.</span><br> <span class="h1 from-bottom"
							style="font-family: MyFont; color: #ffffff; text-align: center"> '준트'를 검색해주시고 많은 관심 부탁드립니다.</span><br>
					</div>
				</div>
			</div>



		</div>
		</section>



		<!-- YOUTUBE VIDEO SECTION -->
		<!-- 		<section>
		<div class="container">
			<div class="thumbnail blogInner">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/jdMXyXuualc"></iframe>
				</div>
			</div>
		</div>
		</section> -->


		<!-- worksArea SECTION-->
		<section class="clearfix worksArea">
		<div class="container">
			<div class="page-header text-center">
				<h1>
					버튼 한 번 클릭으로 남들보다 빠르게 <br> 비트코인 거래를 성사시키세요
				</h1>
			</div>
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail articleContent">
						<i class="fa fa-btc" aria-hidden="true"></i>
						<div class="caption">

							<h3 style="font-family: MyFont; font-size: 27px">자동 매수 버튼</h3>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail articleContent">
						<i class="fa fa-krw" aria-hidden="true"></i>
						<div class="caption">

							<h3 style="font-family: MyFont; font-size: 27px">
								자동 매도 버튼
								<p>*Beta버전은 현재 업비트용만 존재합니다.</p>
							</h3>
						</div>

					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail articleContent">
						<i class="fa fa-ban" aria-hidden="true"></i>
						<div class="caption">

							<h3 style="font-family: MyFont; font-size: 27px">최근 미체결 자동 취소</h3>
						</div>

					</div>
				</div>
			</div>
		</div>
		</section>

		<section>

		<div class="thumbnail blogInner">
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/7n2-YCxJu3c"></iframe>
			</div>
			<div class="caption" style ="text-align: center;">
				<h3>
				준비트 프로그램 사용 동영상
				</h3>
				<p>위는 준비트 프로그램을 실제 사용한 시연 동영상입니다.</p>
			</div>
		</div>

		</section>
		<!-- WORKS SECTION -->
		<section class="clearfix worksArea" style="background:#F2F2F2">
		<div class="container">
			<div class="page-header text-center">
				<h2>
					준비트가 어떻게 작동하냐고요? <small>당신이 다음에 눌러야 할 버튼을 '준비트'가 대신 눌러드립니다.</small>
				</h2>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="servicesItem">
						<ul class="list-inline listServices">
							<li>
								<div class="servicesIcon">
									<i class="icon-listy icon-key"></i>
								</div>
								<div class="servicesInfo">
									<h2>비트코인 매매 동작 분석</h2>
									<p>매매 시 사용자가 필요한 동작들을 일일이 분석</p>
								</div>
							</li>
							<li>
								<div class="servicesIcon">
									<i class="icon-listy icon-wreath"></i>
								</div>
								<div class="servicesInfo">
									<h2>매매 동작 저장 및 프로그래밍</h2>
									<p>필요한 동작들을 프로그래밍화시켜 저장</p>
								</div>
							</li>
							<li>
								<div class="servicesIcon">
									<i class="icon-listy icon-tag3"></i>
								</div>
								<div class="servicesInfo">
									<h2>자동 매수/매도/취소 접수</h2>
									<p>버튼 하나로 가장 빠르게 주문 접수 성공</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
		</section>

		<section style="background:#F2F2F2"></section>




	</div>


	<!-- FOOTER FILE INCLUDE  -->
	<jsp:include page="footer.jsp"></jsp:include>
	</div>



	<!-- JAVASCRIPTS -->
	<script src="resources/plugins/jquery/jquery.min.js"></script>
	<script src="resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
	<script src="resources/plugins/waypoints/waypoints.min.js"></script>
	<script src="resources/plugins/counter-up/jquery.counterup.min.js"></script>
	<script src="resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="resources/plugins/isotope/isotope.min.js"></script>
	<script src="resources/plugins/fancybox/jquery.fancybox.pack.js"></script>
	<script src="resources/plugins/isotope/isotope-triger.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58"></script>
	<script src="resources/plugins/map/js/rich-marker.js"></script>
	<script src="resources/plugins/map/js/infobox_packed.js"></script>
	<script src="resources/js/single-map.js"></script>
	<script src="resources/js/map.js"></script>
	<script src="resources/js/custom.js"></script>
	<script>
		// html dom 이 다 로딩된 후 실행된다.
		$(document).ready(function() {

		});
	</script>
</body>

</html>
