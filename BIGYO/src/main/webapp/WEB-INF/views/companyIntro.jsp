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

<style type="text/css">
@font-face {
	font-family: 'MyFont';
	src: url(resources/font/BM_HANNA_11yrs.ttf);
	font-weight: bold;
}

@media (min-width: 768px){
p{
    line-height: normal;
}
}
@media (min-width: 320px){
p {
    line-height: normal;
}
}
</style>
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
						<h2>INNOVEST 소개</h2>
					</div>
				</div>
			</div>
		</div>
		</section>
		<!-- HOW WORKS SECTION -->
		<section class="clearfix howWorksSection" style="margin:50px">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<p style="text-align: center; font-family: MyFont; font-size: 40px; color: black; margin: 30px">INNOVEST는 세상에 도움이 되는 IT 서비스를 만들고자 합니다.</p>
					<p style="text-align: left; font-family: MyFont; font-size: 30px; margin-top: 80px">- INNOVEST의 첫 번째 프로젝트 “장학꿈”</p>
					<p style="font-size: 20px; line-height: 160%;">
						장학금 정보가 여기저기 흩어져 있어서, 정보력이 있는 학생들이 장학금을 받아가고, <br>정말로 장학금이 필요한 학생들은 장학금을 받지 못하고 있다는 문제를 발견하고, ‘장학꿈’이라는 어플을 개발하고 출시했습니다.
					</p>
					<p style="text-align: left; font-family: MyFont; font-size: 30px; margin-top: 50px">- INNOVEST의 두 번째 프로젝트 “검진모아”</p>
					<p style="font-size: 20px; line-height: 160%;">
						비 보험 항목의 건강검진 상품은 똑 같은 구성이라도, 병원 별/ 중개 업체 별/ 이벤트 별 가격이 천차만별입니다. <br>또한, 폐쇄적인 성격의 의료시장 특성으로 인하여, 일반인이 건강검진 상품의 구성을 쉽게 이해하고, <br> 비교할 수 있는 건강검진 서비스가 존재하지 않고 있습니다. 이 문제점들 때문에 건강검진에 대한 불신을
						가지고 있는 사람들도 있고, 건강검진 자체를 꺼리는 사람들도 존재합니다.<br> <br>검진모아는 대한민국 건강검진 상품비교 서비스를 모아서, 비교, 검색으로 <br>합리적인 건강검진 상품을 선택할 수 있게 도와주는 서비스입니다.<br> 검진모아를 통해서 많은 사람들이 부담 없이 건강검진을 받을 수 있는 시장이 형성이 되고, <br>이를 통해서 건강한 대한민국
						사회가 만들어 지기를 희망합니다. <br><br>현재 검진모아는 가격비교 서비스부터 시작하지만, 앞으로 한 눈에 볼 수 있는 시각화 된 건강검진 상품 항목 비교 서비스, 누구나 알아들을 수 있는 쉬운 건강검진 상품 설명 서비스, 나에게 적합한 건강검진 상품 추천 서비스, 소중한 사람들을 위한 건강검진 선물 상품권 기능, 기타 건강검진 정보 제공 등 건강한
						대한민국 사회를 위해 다양한 서비스를 제공하겠습니다.<br><br> 감사합니다.</p>
					<br><br><br>
					<p style="font-size: 20px; line-height: 160%; text-align: center;">&nbsp &nbsp (주) INNOVEST 대표 <span style = "font-size: 30px">&nbsp &nbsp김 준 혁</span></p>


				</div>
			</div>
		</div>
		</section>
		<section> </section>






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
		/* 	if (urlpath.includes("/bigyo/companyIntro")) {

				$("#navmenu_companyIntro").css("color", "#39a1f4");

			} */
			//서버용
			if (urlpath.indexOf("/companyIntro")!=-1) {

				$("#navmenu_companyIntro").css("color", "#39a1f4");

			}
			
			
			/* navigation menu 주소에 따라서 active 설정 끝 */
		});
	</script>
</body>

</html>
