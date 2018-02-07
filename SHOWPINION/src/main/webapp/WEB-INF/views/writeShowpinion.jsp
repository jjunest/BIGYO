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
					<h4></h4>
				</div>
				<div class="col-sm-6 hidden-xs text-right">
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li>Blank</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>

	<div class="container">

		<div class="center-heading">
			<h2>금융 실명제 도입이 필요한가?</h2>
			<span class="center-line"></span>
		</div>


		<div class="row">
			<div class="col-md-8">
				<div class="blog-post">
					<ul class="list-inline post-detail">
						<li><i class="fa fa-user"></i><a href="#" data-toggle="tooltip" data-placement="top" title="본 주제에 대하여 정리를 해주신 jjunest 님께 깊은 감사를 드립니다. "><span>작성자:</span>jjunest</a></li>
						<li><i class="fa fa-calendar"></i><span>작성일:</span> 31st july 2014</li>
						<li><i class="fa fa-users"></i> <a href="#"><span>조회수:</span>6</a></li>
						<li><i class="fa fa-comment"></i> <a href="#"><span>의견:</span>6</a>개</li>
					</ul>
					<div class="divide30"></div>
					<h3 class="heading">의견 남기기</h3>
					<div style="text-align: center;">
						<div class="btn-group" data-toggle="buttons" style="width: 100%; margin-bottom: 5px">
							<label class="btn btn-primary" style="width: 33%; border: solid 0.5 gray;"> <input type="radio" name="options" id="option1" autocomplete="off"> 찬성
							</label> <label class="btn btn-primary" style="width: 33%; border: solid 0.5 gray; "> <input type="radio" name="options" id="option2" autocomplete="off"> 중립
							</label> <label class="btn btn-primary" style="width: 33%; border: solid 0.5 gray; "> <input type="radio" name="options" id="option3" autocomplete="off"> 반대
							</label>
						</div>
					</div>
					<div class="row" style="border-bottom: 1px solid gray; margin-top: 20px">
						<div class="col-md-3" style="display: flex; align-items: center;">내가 선택한 근거</div>
						<div class="col-md-9" style="text-align: left;">
							<div class="row" style="margin: 10px">
								<p style="margin: 2px">
									<span class="label label-danger" style="margin-right: 10px">결정적</span>
								</p>
								<select class="selectpicker" data-width="100%">
									<option>가나다라마바사아자차,가나다라마바사아자차가나다라마바사아자차</option>
									<option>Ketchup</option>
									<option>Relish</option>
								</select>
							</div>
							<div class="row" style="margin: 10px">
								<p style="margin: 2px">
									<span class="label label-danger" style="margin-right: 10px">2순위</span>
								</p>
								<select class="selectpicker" data-width="100%">
									<option>가나다라마바사아자차,가나다라마바사아자차가나다라마바사아자차</option>
									<option>Ketchup</option>
									<option>Relish</option>
								</select>
							</div>
							<div class="row" style="margin: 10px">
								<p style="margin: 2px">
									<span class="label label-danger" style="margin-right: 10px">3순위</span>
								</p>
								<select class="selectpicker" data-width="100%">
									<option>가나다라마바사아자차,가나다라마바사아자차가나다라마바사아자차</option>
									<option>Ketchup</option>
									<option>Relish</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top: 20px">
						<div class="col-md-3" style="display: flex; align-items: center;">공감하는 반대편 근거</div>
						<div class="col-md-9" style="text-align: left;">
							<div class="row" style="margin: 10px">
								<p style="margin: 2px">
									<span class="label label-success" style="margin-right: 10px">1순위</span>
								</p>
								<select class="selectpicker" data-width="100%">
									<option>가나다라마바사아자차,가나다라마바사아자차가나다라마바사아자차</option>
									<option>Ketchup</option>
									<option>Relish</option>
								</select>
								<p>
									<input id="ex6-1" type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="50" /> <span id="ex6CurrentSliderValLabel"> &nbsp &nbsp 의견 공감 지수: <span
										id="ex6SliderVal1">50</span>%
									</span>
								</p>
							</div>
							<div class="row" style="margin: 10px">
								<p style="margin: 2px">
									<span class="label label-success" style="margin-right: 10px">1순위</span>
								</p>
								<select class="selectpicker" data-width="100%">
									<option>가나다라마바사아자차,가나다라마바사아자차가나다라마바사아자차</option>
									<option>Ketchup</option>
									<option>Relish</option>
								</select>
								<p>
									<input id="ex6-2" type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="50" /> <span id="ex6CurrentSliderValLabel"> &nbsp &nbsp 의견 공감 지수: <span
										id="ex6SliderVal2">50</span>%
									</span>
								</p>
							</div>
							<div class="row" style="margin: 10px">
								<p style="margin: 2px">
									<span class="label label-success" style="margin-right: 10px">1순위</span>
								</p>
								<select class="selectpicker" data-width="100%">
									<option>가나다라마바사아자차,가나다라마바사아자차가나다라마바사아자차</option>
									<option>Ketchup</option>
									<option>Relish</option>
								</select>
								<p>
									<input id="ex6-3" type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="50" /> <span id="ex6CurrentSliderValLabel"> &nbsp &nbsp 의견 공감 지수: <span
										id="ex6SliderVal3">50</span>%
									</span>
								</p>
							</div>
						</div>
					</div>

					<h3 class="heading" style="margin-top: 5px">상세 의견</h3>
					<div style="text-align: center;">
						<textarea rows="4" cols="100%"></textarea>
					</div>
					<h3 class="heading" style="margin-top: 5px"></h3>
					<div>
						<div style="margin: 20px">
							<button type="button" class="btn btn-primary">일반 의견으로 등록하기</button>
							<a href="#" class="btn btn-fb-login" style="width: 70%"><i class="fa fa-facebook"></i> FACEBOOK 에 등록하고 쇼피니언 되기</a>

						</div>
					</div>
				</div>
				<!--blog post-->

			</div>
			<!--col-->
			<div class="col-md-3 col-md-offset-1">
				<div class="row">
					<div class="col-md-12 margin20">
						<div class="team-wrap">
							<img src="${pageContext.request.contextPath}/resources/img/tvshow_poster_SSULJON.jpg" class="img-responsive" alt="">
							<h4>썰전</h4>
							<span>방영 날짜: 2017-12-10</span>
							<p>방송 설명: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam, adipiscing condimentum tristique vel, eleifend sed turpis</p>
						</div>
						<!--team-wrap-->
					</div>
					<!--team col-->
					<div class="col-md-12 margin20">
						<div class="team-wrap" style="border: 4px solid #59df57; border-radius: 5px;">
							<h4>쇼피니언 지수</h4>
							<div id="piechart1"></div>
						</div>
						<!--team-wrap-->
					</div>
					<!--team col-->
					<div class="col-md-12 margin20">
						<div class="team-wrap" style="border: 4px solid #59df57; border-radius: 5px;">
							<h4>일반 의견 지수</h4>
							<div id="piechart2"></div>
						</div>
						<!--team-wrap-->
					</div>
					<!--team col-->
				</div>
			</div>
			<!--row for blog post-->
		</div>
	</div>
	<!--blog full main container-->
	<div class="divide60"></div>



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
	<!-- 부트스트랩 SLIDER SELECTOR를 위한 자바스크립트 추가  -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/bootstrap-slider.min.js"></script>
	<!-- 부트스트랩 CUSTOM-SELECTOR 를 위한 자바스크립트 추가  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>



	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();

			google_chart_Setting();

			// With JQuery
			$("#ex6-1").slider();
			$("#ex6-1").on("slide", function(slideEvt) {
				$("#ex6SliderVal1").text(slideEvt.value);
			});
			
			// With JQuery
			$("#ex6-2").slider();
			$("#ex6-2").on("slide", function(slideEvt) {
				$("#ex6SliderVal2").text(slideEvt.value);
			});
			
			// With JQuery
			$("#ex6-3").slider();
			$("#ex6-3").on("slide", function(slideEvt) {
				$("#ex6SliderVal3").text(slideEvt.value);
			});

		});

		function google_chart_Setting() {
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawChart);
		}
		function drawChart() {
			var data = google.visualization.arrayToDataTable([ [ 'Task', 'Hours per Day' ], [ '찬성', 110 ], [ '중립', 630 ], [ '반대', 22 ] ]);
			var options = {
				legend : 'bottom',
				colors : [ '#e0440e', '#e6693e', '#ec8f6e' ],
				is3D : true
			};
			var chart1 = new google.visualization.PieChart(document.getElementById('piechart1'));
			var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
			chart1.draw(data, options);
			chart2.draw(data, options);
		}

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
