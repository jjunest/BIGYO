<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

<!-- SITE TITTLE -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>프리미엄 건강검진 비교 검색 서비스 BIGYO</title>

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
<link href="resources/css/style.css" rel="stylesheet">

<!-- FAVICON -->
<link href="resources/img/favicon.png" rel="shortcut icon">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="body-wrapper">
	<div class="page-loader" style="background: url(resources/img/preloader.gif) center no-repeat #fff;"></div>

	<div class="main-wrapper">
		<!-- HEADER FILE INCLUDE  -->
		<jsp:include page="header.jsp"></jsp:include>


		<!-- PAGE TITLE SECTION -->
		<section class="clearfix pageTitleSection bg-image" style="background-image: url(resources/img/background/bg-page-title.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="pageTitle">
						<h2>검진모아란?</h2>
					</div>
				</div>
			</div>
		</div>
		</section>

		<!-- HOW WORKS SECTION -->
		<section class="clearfix howWorksSection">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="howWorksInner">
						<div class="row">
							<div class="col-sm-4 col-sm-push-8 col-xs-12">
								<div class="howWorksImage text-right">
									<i class="fa fa-binoculars processImg" aria-hidden="true" style="color: #2980bc; font-size: 80px; vertical-align: middle; margin-right: 200px"></i>
								</div>
							</div>
							<div class="col-sm-8 col-sm-pull-4 col-xs-12">
								<div class="howWorksInfo text-left">
									<p style="font-size: 25px; color: black; font-weight: bold;">Step 1</p>
									<h3>전국 건강 검진 상품 정보 수집</h3>
									<p>검진모아가 대한민국에 존재하는 모든 할인 건강검진 상품을 수집합니다.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="howWorksInner">
						<div class="row">
							<div class="col-sm-4 col-xs-12">
								<div class="howWorksImage text-left">
									<i class="fa fa-balance-scale processImg" aria-hidden="true" style="color: #2980bc; font-size: 80px; vertical-align: middle; margin-left: 200px"></i>
								</div>
							</div>
							<div class="col-sm-8 col-xs-12">
								<div class="howWorksInfo text-right">
									<p style="font-size: 25px;color: black; font-weight: bold;">Step 2</p>
									<h3>검진모아에서 건강검진 상품 비교 및 선택</h3>
									<p>검진모아에서 전국 건강검진 상품들을 자세히 비교하세요.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="howWorksInner">
						<div class="row">
							<div class="col-sm-4 col-sm-push-8 col-xs-12">
								<div class="howWorksImage text-right">
									<i class="fa fa-hospital-o processImg" aria-hidden="true" style="color: #2980bc; font-size: 80px; vertical-align: middle; margin-right: 200px"></i>

								</div>
							</div>
							<div class="col-sm-8 col-sm-pull-4 col-xs-12">
								<div class="howWorksInfo text-left">
									<p style="font-size: 25px;color: black; font-weight: bold;">Step 3</p>
									<h3>주관 업체 및 중개업체를 통해 예약과 검진</h3>
									<p>주관 업체 및 중개 업체를 통해서 건강검진을 예약하고 검진받으세요.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>




		<section></section>



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
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			
			//로컬용
	/* 		if (urlpath.includes("/bigyo/serviceIntro")) {

				$("#navmenu_serviceIntro").css("color", "#39a1f4");

			} */
			
			//서버용
					if (urlpath.indexOf("/serviceIntro") != -1) {

				$("#navmenu_serviceIntro").css("color", "#39a1f4");

			}
			
			/* navigation menu 주소에 따라서 active 설정 끝 */
			
			
			// 모바일 버전 
			alert('현재 검진모아는 PC 전용 기준으로 개발되었습니다. \n스마트폰 화면은 다소 불편하실 수 있으니 PC버전 화면으로 사용해주시면 감사하겠습니다.\n또한, 검진모아 Android/IOS 버전 어플리케이션은 12월 안에 출시할 예정입니다. \n검진모아를 기억해주시고 많은 이용 부탁드립니다. \n감사합니다.');
		});
	</script>
</body>

</html>
