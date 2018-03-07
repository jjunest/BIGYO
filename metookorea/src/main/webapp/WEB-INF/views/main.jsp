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
<title>미투코리아</title>


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
	<div class="container">
		<!--rev slider start-->
		<div class="fullwidthbanner">
			<div class="tp-banner">
				<ul>
					<!-- SLIDE -->
					<li data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="미투코리아">
						<!-- MAIN IMAGE --> <img src="${pageContext.request.contextPath}/resources/img/m2/front1.png" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
						<div class="caption title-2 sft" data-x="50" data-y="160" data-speed="1000" data-start="1000" data-easing="easeOutExpo">
							대한민국 미투운동을 <br> #미투코리아가 적극 지지합니다
						</div>
						<div class="caption text sfl" data-x="50" data-y="290" data-speed="1000" data-start="1800" data-easing="easeOutExpo">
							더 이상 혼자가 아닙니다<br> 이제, 미투코리아에 제보하세요
						</div>
						<div class="caption sfb rev-buttons tp-resizeme" data-x="50" data-y="360" data-speed="500" data-start="1800" data-easing="Sine.easeOut">
							<a href="${pageContext.request.contextPath}/me_report_list" class="btn btn-theme-bg btn-lg">제보리스트</a>
						</div>
				<br>
						<div class="caption sfb rev-buttons tp-resizeme" data-x="250" data-y="360" data-speed="500" data-start="2100" data-easing="Sine.easeOut">
							<a href="${pageContext.request.contextPath}/me_report_write" class="btn btn-theme-bg btn-lg">제보하러가기</a>
						</div>

					</li>
					<!-- SLIDE -->
					<li data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="미투코리아">
						<!-- MAIN IMAGE --> <img src="${pageContext.request.contextPath}/resources/img/m2/front3.png" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">

						<div class="caption text-center-top sft" data-x="center" data-y="210" data-speed="1000" data-start="1400" data-easing="easeOutExpo">#미투코리아가 도와드리겠습니다.</div>

						<div class="caption text-center-btm sfr text-center" data-x="center" data-y="265" data-speed="1000" data-start="1600" data-easing="easeOutExpo">
							당신의 잘못이 아닙니다. 
							<br>고통받아야할 사람은 피해자가 아닌 가해자입니다.<br>
						</div>
						<br><br>
					</li>
				</ul>
			</div>
		</div>
		<!--full width banner-->
		<!--revolution end-->

		<div class="divide60"></div>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<div class="center-heading">
						<h2>
							# WithYou <strong></strong>
						</h2>
						<span class="center-line"></span>
						<p class="sub-text margin40">
							용기있는 목소리들이 하나 둘 모여 대한민국에도 #미투의 불씨가 점점 커지고 있습니다. <br> #미투코리아는 여러 곳에 산재되어 있는 #미투의 목소리를 하나로 응집시켜 <br>사회정의를 바로세우는 데 기여하고자 탄생된 비영리 서비스입니다.
						</p>
						<p>
						<a href="${pageContext.request.contextPath}/me_report_write" style = "width: 50%"class="btn btn-theme-bg btn-lg">제보하러가기</a>
						</p>
					</div>
				</div>

			</div>
			<!--center heading end-->
			<div class="divide50"></div>
			<div class="row">
				<div class="col-md-3 col-sm-6 margin30">
					<div class="colored-boxed green">
						<i class="fas fa-lock " style="font-size: 50px"></i>
						<h3>익명 보호</h3>
						<span class="center-line"></span>
						<p>#미투코리아는 제보자의 <br>신원을 철저히 보호하겠습니다</p>
					</div>
				</div>
				<!--colored boxed col end-->
				<div class="col-md-3 col-sm-6 margin30">
					<div class="colored-boxed dark">
						<i class="fas fa-hand-point-up" style="font-size: 50px"></i>
						<h3>올려 지수</h3>
						<span class="center-line"></span>
						<p>보다 관심이 가는 제보에 <br>올려지수를 눌러주세요 </p>
					</div>
				</div>
				<!--colored boxed col end-->
				<div class="col-md-3 col-sm-6 margin30">
					<div class="colored-boxed blue">
						<i class="fas fa-users" style="font-size: 50px"></i>
						<h3>자유게시판</h3>
						<span class="center-line"></span>
						<p>미투운동과 관련한  <br> 다양한 생각들을 공유해주세요</p>
					</div>
				</div>
				<!--colored boxed col end-->
				<div class="col-md-3 col-sm-6 margin30">
					<div class="colored-boxed red">
						<i class="fas fa-exclamation-circle " style="font-size: 50px"></i>
						<h3>신고 제도</h3>
						<span class="center-line"></span>
						<p>#미투코리아는 허위제보에 <br>단호히 대처하겠습니다</p>
					</div>
				</div>
				<!--colored boxed col end-->
			</div>
		</div>
		<!--services container-->

	</div>
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
	<!-- CAROUSEL 를 위한 자바스크립트 추가-->
	<script src="${pageContext.request.contextPath}/resources/cubeportfolio/js/jquery.cubeportfolio.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/cube-portfolio.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/pace.min.js" type="text/javascript"></script>

	<script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
		});

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/main") != -1) {
			
				$("#navmenu_main").css("color", "#39a1f4");

			}

		}
	</script>
</body>

</html>
