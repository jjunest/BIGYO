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
	<!--rev slider start-->
	<div class="fullwidthbanner">
		<div class="tp-banner">
			<ul>
				<!-- SLIDE -->
				<li data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="쇼피니언">
					<!-- MAIN IMAGE --> <img src="${pageContext.request.contextPath}/resources/img_main/mainfront1.png" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
					<div class="caption title-2 sft" data-x="50" data-y="160" data-speed="1000" data-start="1000" data-easing="easeOutExpo">
						대한민국 건전한 토론 문화를<br> #쇼피니언이 적극 지지합니다
					</div>
					<div style="font-size: 27px;" class="caption text sfl" data-x="50" data-y="290" data-speed="1000" data-start="1800" data-easing="easeOutExpo">
						<span>대한민국 발전을 위해 시사/정치/사회 문제에 대해<br>합리적이고 이성적으로 고민하고 자신의 의견을 보여주세요.
						</span>
					</div> <br>
					<div class="caption sfb rev-buttons tp-resizeme" data-x="50" data-y="360" data-speed="500" data-start="1800" data-easing="Sine.easeOut">
						<a href="${pageContext.request.contextPath}/all_TVshow_Topics" class="btn btn-theme-bg btn-lg">TV쇼 주제</a>
					</div>
					<div class="caption sfb rev-buttons tp-resizeme" data-x="250" data-y="360" data-speed="500" data-start="2100" data-easing="Sine.easeOut">
						<a href="${pageContext.request.contextPath}/all_Showpinion_Topics" class="btn btn-theme-bg btn-lg">쇼피니언 주제</a>
					</div>

				</li>
				<!-- SLIDE -->
				<li data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="쇼피니언">
					<!-- MAIN IMAGE --> <img src="${pageContext.request.contextPath}/resources/img_main/mainfront2.png" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
					<div class="caption text-center-top sft" data-x="center" data-y="210" data-speed="1000" data-start="1400" data-easing="easeOutExpo">#SHOW YOUR OPINION</div>

					<div class="caption text-center-btm sfr text-center" data-x="center" data-y="265" data-speed="1000" data-start="1600" data-easing="easeOutExpo">
						이제 SNS를 통해 '예쁘고 잘생긴 생각'들을 당당히 보여주세요 <br> 당신의 당당한 생각이 대한민국 사회를 바꾸어갑니다<br>
					</div> <br>

				</li>

				<!-- SLIDE -->
				<li data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="쇼피니언">
					<!-- MAIN IMAGE --> <img src="${pageContext.request.contextPath}/resources/img_main/mainfront3.png" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
					<div class="caption title-2 sft" data-x="50" data-y="160" data-speed="1000" data-start="1000" data-easing="easeOutExpo">
						이번주 TV 토론에 대해<br> 고민해보고 자신의 의견을 보여주세요. <br>
					</div>
					<div style="font-size: 27px;" class="caption text sfl" data-x="50" data-y="290" data-speed="1000" data-start="1800" data-easing="easeOutExpo">여러분들의 고민과 의견이 대한민국을 성장시킵니다.</div>

				</li>



			</ul>
		</div>
	</div>
	<!--full width banner-->
	<!--breadcrumbs-->
	<div class="divide80"></div>


	<div class="divide60"></div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="center-heading">
					<h2># Show Your Opinion</h2>
					<span class="center-line"></span>
					<p class="sub-text margin40">
						현재 대한민국에 좌와우, 지역감정, 남성과 여성, 세대간 갈등이 심해지고 있고, <br> 합리적인 사고, 서로에 대한 공감 그리고 이해는 줄어들고 있습니다. <br> <strong style="font-weight: bold; color: #32c5d2">#쇼피니언</strong>은 건전한 사고 방식을 유도하고, 사회 통합과
						사회발전에 도움이 되기 위해 만든 서비스입니다. <br> 대한민국의 건전한 사회 성장을 위해 <strong style="font-weight: bold; color: #32c5d2">#쇼피니언</strong>이 되어주세요.
					</p>
				</div>
			</div>

		</div>
		<!--center heading end-->
		<!-- 이번주 TV토론 SECTION 시작 -->
		<!--breadcrumbs-->
		<div class="divide80"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="center-heading">
						<h2>이번주 TV토론 주제 &nbsp +${fn:length(result_list_thisweek_tvtopics)}</h2>
						<span class="center-line"></span>
					</div>
					<!--center-heading-->
				</div>
			</div>
			<!--row-->
			<div class="row">
				<div class="col-md-12">
					<div id="thisWeek_tvTopics-carousel" class="owl-carousel owl-theme owl-spaced">
						<!--ITEM 시작 -->
						<c:forEach var="listValue_topic" items="${result_list_thisweek_tvtopics}">
							<div>
								<div class="item-img-wrap" style="border: 4px solid #59df57; border-radius: 5px;">
									<a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${listValue_topic.sp_tvtopics_rcdno}"> <img
										src="${pageContext.request.contextPath}/${listValue_tvtopic.sp_tvtopics_tvshow_imgurl}"
										onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_tvshow_img.png';" class="img-responsive" alt="workimg">
									</a>

								</div>
								<!--item img wrap-->
								<div class="work-desc">
									<h3>
										<a href="portfolio-single.html">${listValue_topic.sp_tvtopics_title}</a>
									</h3>
									<span>방송날짜 :</span> <span id="tvShowDate"> ${listValue_topic.sp_tvtopics_tvshow_date}</span>
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
						</c:forEach>
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
						<h2>이번주 쇼피니언 선정 주제 +${fn:length(result_list_thisweek_normaltopics)}</h2>
						<span class="center-line"></span>
					</div>
					<!--center-heading-->
				</div>
			</div>
			<!--row-->
			<div class="row">
				<div class="col-md-12">
					<div id="thisWeek_normalTopics-carousel" class="owl-carousel owl-theme owl-spaced">
						<!--ITEM 시작 -->
						<c:forEach var="listValue_topic" items="${result_list_thisweek_normaltopics}">
							<div>
								<div class="item-img-wrap" style="border: 4px solid #59df57; border-radius: 5px;">
									<a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${listValue_topic.sp_tvtopics_rcdno}"> <img
										src="${pageContext.request.contextPath}/${listValue_tvtopic.sp_tvtopics_tvshow_imgurl}"
										onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_tvshow_img.png';" class="img-responsive" alt="workimg">
									</a>

								</div>
								<!--item img wrap-->
								<div class="work-desc">
									<h3>
										<a href="portfolio-single.html">${listValue_topic.sp_tvtopics_title}</a>
									</h3>
									<span>주제등록 :</span> <span id="tvShowDate"> ${listValue_topic.sp_tvtopics_write_date}</span>
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
						</c:forEach>
					</div>

				</div>
			</div>
			<!--row-->
		</div>
		<div class="divide80"></div>
		<!-- 이번주 showpinion SECTION 끝 -->
		<div class="row">
			<div class="row">
				<div class="col-md-12">
					<div class="center-heading">
						<h2>#쇼피니언 서비스 및 장점</h2>
						<span class="center-line"></span>
					</div>
					<!--center-heading-->
				</div>
			</div>

			<div class="col-md-3 col-sm-6 margin30">
				<div class="colored-boxed green">

					<i class="fab fa-facebook-square" style="font-size: 50px; color: #32c5d2"></i>
					<h3>SNS에 의견 올리기</h3>
					<span class="center-line"></span>
					<p>
						관심있는 사회 문제에 대한 <br> 자신의 의견을 당당히 보여주세요 <br> 합리적인 근거라면 <br> 어떤 주장도 당당할 수 있습니다
					</p>
				</div>
			</div>
			<!--colored boxed col end-->
			<div class="col-md-3 col-sm-6 margin30">
				<div class="colored-boxed dark">
					<i class="fas fas fa-share-alt" style="font-size: 50px; color: #32c5d2"></i>
					<h3>사회 문제 공유하기</h3>
					<span class="center-line"></span>
					<p>
						이쁘고 멋진 사진만 공유하기보다 <br> 사회 문제를 공유함으로써 <br> 이쁘고 멋진 생각을 <br>친구와 나눠보는 것은 어떨까요?

					</p>
				</div>
			</div>


			<!--colored boxed col end-->
			<div class="col-md-3 col-sm-6 margin30">
				<div class="colored-boxed blue">
					<i class="fas fa-hand-pointer" style="font-size: 50px; color: #32c5d2"></i>
					<h3>쉬운 근거 선택</h3>
					<span class="center-line"></span>
					<p>
						논리적인 주장을 펼치기 어려우시다고요?<br> 처음에는 누구나 그렇습니다 <br> 쇼피니언에서는 클릭만으로 <br> 논리적인 의견 표현이 가능합니다
					</p>
				</div>
			</div>
			<!--colored boxed col end-->
			<div class="col-md-3 col-sm-6 margin30">
				<div class="colored-boxed red">
					<i class="fas fa-handshake " style="font-size: 50px; color: #32c5d2"></i>
					<h3>상대방 의견에 공감하기</h3>
					<span class="center-line"></span>
					<p>
						상대방 의견에 대한 맹목적 비방은<br> 합리적인 주장이 아닙니다<br> 어느 주장이건 합리적 근거는 있습니다. <br> 공감하는 부분은 멋있게 인정해주세요

					</p>
				</div>
			</div>
			<!--colored boxed col end-->
		</div>
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
			//이번주 TV토론 주제 및 이번주 쇼피니언 주제 슬라이드쇼 시작
			sildeShowSetting();

		});

		function sildeShowSetting() {
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
		}

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
