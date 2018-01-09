<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<style type="text/css">
@font-face {
	font-family: 'MyFont';
	src: url(resources/font/BM_HANNA_11yrs.ttf);
	font-weight: bold;
}

@media ( min-width : 768px) {
	p {
		line-height: normal;
	}
}

@media ( min-width : 320px) {
	p {
		line-height: normal;
	}
}

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
			<div class="row">
				<div class="col-xs-12">
					<div class="pageTitle">
						<h2>준비트 사용 방법</h2>
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
									<i class="fa fa-chrome processImg" aria-hidden="true" style="color: #2980bc; font-size: 80px; vertical-align: middle; margin-right: 200px"></i>
								</div>
							</div>
							<div class="col-sm-8 col-sm-pull-4 col-xs-12">
								<div class="howWorksInfo text-left">
									<p style="font-size: 25px; color: black; font-weight: bold;">Step 1</p>
									<h3>준비트 사용 전 필수 사항 - 크롬 브라우저 설치</h3>
									<p>준비트는 '크롬 브라우저'를 바탕으로 작동합니다. 반드시 컴퓨터에 크롬 브라우저를 깔아주세요.</p>
									<a target="_blank" href="https://www.google.co.kr/chrome/browser/desktop/index.html">크롬 브라우저 다운받으러 가기</a>
								</div>
							</div>
						</div>
					</div>
					<div class="howWorksInner">
						<div class="row">
							<div class="col-sm-4 col-xs-12">
								<div class="howWorksImage text-left">
									<i class="fa fa-download processImg" aria-hidden="true" style="color: #2980bc; font-size: 80px; vertical-align: middle; margin-left: 200px"></i>
								</div>
							</div>
							<div class="col-sm-8 col-xs-12">
								<div class="howWorksInfo text-right">
									<p style="font-size: 25px; color: black; font-weight: bold;">Step 2</p>
									<h3>준비트 프로그램 다운로드</h3>
									<p>준비트는 윈도우용 프로그램입니다. 현재는 upbit 사용자 전용으로 만들어졌습니다.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="howWorksInner">
						<div class="row">
							<div class="col-sm-4 col-sm-push-8 col-xs-12">
								<div class="howWorksImage text-right">
									<i class="fa fa-btc processImg" aria-hidden="true" style="color: #2980bc; font-size: 80px; vertical-align: middle; margin-right: 200px"></i>

								</div>
							</div>
							<div class="col-sm-8 col-sm-pull-4 col-xs-12">
								<div class="howWorksInfo text-left">
									<p style="font-size: 25px; color: black; font-weight: bold;">Step 3</p>
									<h3>사용방법에 따라 비트코인 거래</h3>
									<p>가장 빠르게 매수/매도/주문 취소 접수를 하세요. 매매 기회는 찰나의 순간에 날라갑니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>




		<!-- ARTICLES SECTION-->
		<section class="clearfix articlesArea">
		<div class="container">
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
		
			<div class="page-header text-center">
				<h2>
					* 준비트 실제 사용 동작 - 구분동작 <small>아래 화면을 반드시 참고하시고 몇 번의 테스트 후 실제 사용하시기 바랍니다. </small>
				</h2>
			</div>
			

		

			<div class="row" style="border-bottom: 1px solid; margin-bottom: 2px">
				<br>
				<div class="col-sm-12 col-xs-12">
					<div class="thumbnail articleContent">
						<div class="caption" style="text-align: center">
							<h3>실제 사용 동작1 - 준비트 프로그램 로그인</h3>
							<p>'준비트'홈페이지의 아이디와 비밀번호로 로그인을 하세요</p>
						</div>
						<img src="resources/img/howtouse/step1.png" alt="Image articles" class="img-responsive">

					</div>
				</div>
			</div>
			<div class="row" style="border-bottom: 1px solid; margin-bottom: 2px">
				<br>
				<div class="col-sm-12 col-xs-12">
					<div class="thumbnail articleContent">
						<div class="caption" style="text-align: center">
							<h3>실제 사용 동작2 - 준비트 프로그램 시작 화면</h3>
							<p>로그인 후 기본화면 입니다. '준비트 서비스 시작 - 업비트용'버튼을 눌러주세요.</p>
						</div>
						<img src="resources/img/howtouse/step2.png" alt="Image articles" class="img-responsive">

					</div>
				</div>
			</div>
			<div class="row" style="border-bottom: 1px solid; margin-bottom: 2px">
				<br>
				<div class="col-sm-12 col-xs-12">
					<div class="thumbnail articleContent">
						<div class="caption" style="text-align: center">
							<h3>실제 사용 동작3 - 준비트 크롬 브라우저 실행</h3>
							<p>준비트 프로그램이 시작 될 크롬 브라우저가 자동으로 실행됩니다.</p>
							<p>*Chrome이 자동화된 테스트 소프트웨어에 의해 제어되고 있습니다. 라는 문구가 보이는 브라우저를 통해 준비트가 실행됩니다.</p>
						</div>
						<img src="resources/img/howtouse/step3.png" alt="Image articles" class="img-responsive">

					</div>
				</div>
			</div>
			<div class="row" style="border-bottom: 1px solid; margin-bottom: 2px">
				<br>
				<div class="col-sm-12 col-xs-12">
					<div class="thumbnail articleContent">
						<div class="caption" style="text-align: center">
							<h4>실제 사용 동작4</h4>
							<h3>업비트 로그인</h3>
							<p>평상시와 같이 업비트에 로그인 하시면 됩니다.</p>
						</div>
						<img src="resources/img/howtouse/step4.png" alt="Image articles" class="img-responsive">

					</div>
				</div>
			</div>
			<div class="row" style="border-bottom: 1px solid; margin-bottom: 2px">
				<br>
				<div class="col-sm-12 col-xs-12">
					<div class="thumbnail articleContent">
						<div class="caption" style="text-align: center">
							<h3>실제 사용 동작5 - 매수 자동 버튼 클릭</h3>
							<p>매수 비중 설정 후, 매수 가격을 업비트 페이지에서 클릭한 후 '준비트'프로그램에서 '자동 매수 버튼'을 클릭 시에 자동으로 주문 접수가 됩니다.</p>
							<p style="font-size: 15px; color: red">(주의) 브라우저 상에 빨간 별표 친 "매수"탭이 클릭 되어 있어야 합니다. (매도 탭이 클릭된 상태에서, 자동매수 버튼을 누를 시 자동매수가 되지 않습니다.</p>
							<p style="font-size: 15px; color: red">사람을 대신해서 클릭해주는 것이기 때문에, 별표 부분이 클릭되지 않은 상태에서 "준비트프로그램 자동 매수 버튼"을 클릭하면 자동 매수가 되지 않습니다.</p>
							<p style="font-size: 15px; color: red">그리고 반드시 브라우저 상에 내가 눌러야할 버튼들이 보여야 합니다. 스크롤을 내려서 자동으로 눌러야 할 버튼이 안 보이면, 자동매수가 되지 않습니다.</p>
						</div>
						<img src="resources/img/howtouse/step5.png" alt="Image articles" class="img-responsive">

					</div>
				</div>
			</div>
			<div class="row" style="border-bottom: 1px solid; margin-bottom: 2px">
				<br>
				<div class="col-sm-12 col-xs-12">
					<div class="thumbnail articleContent">
						<div class="caption" style="text-align: center">
							<h3>실제 사용 동작6 - 매도 자동 버튼 클릭</h3>
							<p>매도 비중 설정 후, 매도 가격을 마우스로 클릭 한 후에 '준비트'프로그램에서 '자동 매도 버튼'을 클릭 시에 자동으로 주문 접수가 됩니다.</p>
							<p style="font-size: 15px; color: blue">(주의) 브라우저 상에 파간 별표 친 "매도"탭이 클릭 되어 있어야 합니다. (매수 탭이 클릭된 상태에서, 자동매도 버튼을 누를 시 자동매도가 되지 않습니다.</p>
							<p style="font-size: 15px; color: blue">사람을 대신해서 클릭해주는 것이기 때문에, 별표 부분이 클릭되지 않은 상태에서 "준비트프로그램 자동 매도 버튼"을 클릭하면 자동 매도가 되지 않습니다.</p>
							<p style="font-size: 15px; color: blue">그리고 반드시 브라우저 상에 내가 눌러야할 버튼들이 보여야 합니다. 스크롤을 내려서 자동으로 눌러야할 버튼이 안 보이면, 자동매도가 되지 않습니다.</p>
						</div>
						<img src="resources/img/howtouse/step6.png" alt="Image articles" class="img-responsive">

					</div>
				</div>
			</div>

			<div class="row" style="border-bottom: 1px solid; margin-bottom: 2px">
				<br>
				<div class="col-sm-12 col-xs-12">
					<div class="thumbnail articleContent">
						<div class="caption" style="text-align: center">
							<h3>실제 사용 동작7 - 최근 미체결 자동 취소 버튼</h3>
							<p>최근 미체결 자동 취소 버튼을 누르시면, 가장 최근의 미체결 된 거래가 취소됩니다.</p>
							<p style="font-size: 15px; color: red">(주의) 별표친 거래내역 부분이 브라우저 상에 보여야 합니다 (클릭이 되 있을 필요는 없습니다)</p>
							<p style="font-size: 15px; color: red">매수탭 혹은 매도탭 활성화 시에도 자동 취소 버튼은 작동합니다.</p>
						</div>
						<img src="resources/img/howtouse/step7.png" alt="Image articles" class="img-responsive">

					</div>
				</div>
			</div>




		</div>
		</section>






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
			if (urlpath.indexOf("/howToUseJunbit") != -1) {
				$("#navmenu_howToUseJunbit").css("color", "#39a1f4");
			}

		}
	</script>
</body>

</html>
