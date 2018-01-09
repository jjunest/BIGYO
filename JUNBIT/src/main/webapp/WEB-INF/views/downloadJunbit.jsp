h<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="resources/css/style.css" rel="stylesheet">

<!-- FAVICON -->
<link href="resources/img/favicon.png" rel="shortcut icon">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<style>
#footer {
	margin-top: -1.9em;
	height: 200px;
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
			<div class="row"></div>
		</div>
		</section>

		<section></section>

		<!-- APP DOWNLOAD SECTION -->
		<section class="clearfix appDownload">
		<div class="container">
			<div class="page-header text-center">
				<h2>준비트 프로그램 다운로드</h2>
			</div>
			<div class="row">
				<div class="col-sm-12 col-xs-12" style="text-align: center; padding: 20px"">
					<a href="resources/download_junbit/JUNBIT_ver1.0.zip" class="btn btn-primary btn-transparent"> <i class="fa fa-windows fa-3x" aria-hidden="true" style="margin: 20px"></i><span><strong>윈도우용
								'준비트' 프로그램 다운로드 하기</strong></span>
					</a>
				</div>
			</div>
		</div>
		</section>
		<!-- ARTICLES SECTION-->
		<section class="clearfix articlesArea">
		<div class="container">
			<div class="thumbnail blogInner">
				<div class="caption" style="text-align: center;">
					<h3>*win7을 포함한 Window7 이하 버전 사용자들은 <br>.NetFramework 4.61ver 프로그램을 설치하셔야 합니다.</h3>
					<p>MicroSoft사에서 배포하는 .netframework 프로그램은 윈도우 프로그램들을 실행할 수 있게 해주는 프로그램입니다.</p>
				</div>
			</div>




			<div class="row" style="border-bottom: 1px solid; margin-bottom: 2px">
				<br>
				<div class="col-sm-12 col-xs-12">
					<div class="thumbnail articleContent">
						<div class="caption" style="text-align: center">
							<h3>1. 압출을 풀고, 준비트.exe파일 (응용프로그램)을 실행시키면,<br> win7이하 사용자들은 다음과 같은 화면이 나옵니다</h3>
							<p>.netframework 버전 4.61이 미설치되어 있으니 설치를 하라는 의미입니다!<br> '예'를 누르시고 설치하시면됩니다.</p>
							<p>*설치하는 시간이 다소 오래 걸릴 수 있습니다.
						</div>
						<img src="resources/img/install_win71.png" alt="Image articles" class="img-responsive"> <img src="resources/img/install_win72.png" alt="Image articles" class="img-responsive"> <img
							src="resources/img/install_win73.png" alt="Image articles" class="img-responsive">

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

			navMenuColorSetting();

		});

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/downloadJunbit") != -1) {

				$("#navmenu_downloadJunbit").css("color", "#39a1f4");

			}

		}
	</script>
</body>

</html>
