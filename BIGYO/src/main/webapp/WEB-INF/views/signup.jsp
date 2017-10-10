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
						<h2>회원 가입</h2>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section class="clearfix signUpSection">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-xs-12">
					<div class="signUpFormArea">
						<div class="priceTableTitle">
							<h2>회원 가입 양식</h2>
							<p>
								Please fill out the fields below to create your account. We will send your account information to the email address you enter. Your email address and information will NOT be sold or shared
								with any 3rd party. If you already have an account, please, <a href="login.html">click here</a>.
							</p>
						</div>
						<div class="signUpForm">
							<form action="#">
								<div class="formSection">
									<h3>기본 정보</h3>
									<div class="row">
										<div class="form-group col-sm-6 col-xs-12">
											<label for="firstName" class="control-label">이름*</label> <input type="text" class="form-control" id="firstName">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="phoneNum" class="control-label">휴대전화*</label> <input type="text" class="form-control" id="phoneNum">
										</div>
										<div class="form-group col-xs-12">
											<label for="emailAdress" class="control-label">이메일 주소* 비밀번호 분실 시 사용됩니다. 정확한 이메일 주소인지 다시 한번 확인해 주십시오.</label> <input type="email" class="form-control" id="emailAdress">
										</div>
									</div>
								</div>
								<div class="formSection">
									<h3>계정 정보</h3>
									<div class="row">
										<div class="form-group col-sm-6 col-xs-12">
											<label for="usernames" class="control-label">아이디*</label> <input type="text" class="form-control" id="usernames">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="usernames" class="control-label">아이디 중복 확인</label>
											<button type="button" class="btn btn-primary" id="idMultipleCheck" onclick="javascript:chkDupId();">확인</button>
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="passwordFirst" class="control-label">비밀번호*</label> <input type="password" class="form-control" id="password">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="passwordAgain" class="control-label">비밀번호 재입력*</label> <input type="password" class="form-control" id="passwordAgain">
										</div>
									</div>
								</div>
								<div class="formSection">
									<h3>개인정보 제공 동의</h3>
									<div class="row">

										<div class="form-group col-xs-12">
											<div class="checkbox">
												<label> <input type="checkbox"> I agree to the <a href="terms-of-services.html">Terms of Use</a> & <a href="#">Privacy Policy</a>. Your business listing is fully backed by
													our 100% money back guarantee.
												</label>
											</div>
										</div>
										<div class="form-group col-xs-12 mb0">
											<button type="submit" class="btn btn-primary">계정 만들기</button>
										</div>
									</div>
								</div>

							</form>
						</div>
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

</body>

</html>
