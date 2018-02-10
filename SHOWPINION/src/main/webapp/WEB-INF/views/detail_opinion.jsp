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
					<h4>상세 오피니언 의견</h4>
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

		<div class="about-author" style="border-radius: 3%; border: 4px solid #59df57; border-radius: 5px;">
			<div class="row">
				<div class="col-md-2" style="text-align: center">
					<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="img-responsive" alt="" style="border-radius: 50%; width: 60px; height: 60px">
					<p style="margin: 2px">jjunest</p>
					<p style="font-size: 80%; color: gray; margin: 2px">${opinion_DTO.sp_opinion_datetime }</p>
				</div>
				<div class="col-md-6" style="">

					<h4 class="colored-text" style="height: 50px; line-height: 50px; white-space: nowrap;">
						<a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${opinion_DTO.sp_opinion_topicrcdno }">${opinion_DTO.sp_opinion_topictitle }</a>
					</h4>
				</div>
				<div class="col-md-4">
					<c:if test="${opinion_DTO.sp_opinion_side eq 'pro'}">
						<div>찬성</div>
					</c:if>
					<c:if test="${opinion_DTO.sp_opinion_side eq 'con'}">
						<div>반대</div>
					</c:if>


					<p>
						<span>* 본 의견은 <c:if test="${opinion_DTO.sp_opinion_type eq 'normal'}">
							'일반'
						</c:if> <c:if test="${opinion_DTO.sp_opinion_type eq 'show'}">
						'쇼피니언'
						</c:if> 의견입니다 <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="본인의 의견을 SNS에 올리시면, 쇼피니언 지수가 높아집니다."></i></span>
					</p>
				</div>

			</div>

			<div class="row" style="margin-top: 5px">
				<div class="col-md-6" style="">
					<p>
						나의
						<c:if test="${opinion_DTO.sp_opinion_side eq 'pro'}">
							찬성
						</c:if>
						<c:if test="${opinion_DTO.sp_opinion_side eq 'con'}">
						반대
						</c:if>
						근거
					</p>
					<p>
						<span class="badge" style="text-align: left; border-radius: 15%">결정적 이유</span>&nbsp ${opinion_DTO.sp_opinion_reason1 }
					</p>
					<p>
						<span class="badge" style="text-align: left; border-radius: 15%">Top2</span>&nbsp ${opinion_DTO.sp_opinion_reason2 }
					</p>
					<p>
						<span class="badge" style="text-align: left; border-radius: 15%">Top3</span>&nbsp ${opinion_DTO.sp_opinion_reason3 }
					</p>
				</div>
				<div class="col-md-6" style="">
					<p>공감하는 반대편 근거</p>
					<p>
						<span class="label label-warning">공감: <span>${opinion_DTO.sp_opinion_opreason1_agree }</span>%
						</span>&nbsp ${opinion_DTO.sp_opinion_opreason1}
					</p>
					<p>
						<span class="label label-warning">공감: <span>${opinion_DTO.sp_opinion_opreason2_agree }</span>%
						</span>&nbsp ${opinion_DTO.sp_opinion_opreason2}
					</p>
					<p>
						<span class="label label-warning">공감: <span>${opinion_DTO.sp_opinion_opreason3_agree }</span>%
						</span>&nbsp ${opinion_DTO.sp_opinion_opreason3 }
					</p>
				</div>
			</div>
			<div class="row" style="margin-top: 5px">

				<div class="col-md-10" style="">
					<div>상세 의견</div>

					${opinion_DTO.sp_opinion_detail }
				</div>
			</div>
			<div class="row" style="text-align: right;">
				<a href="#"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 신고</a> <a href="#"> <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 추천 <span>6개</span></a> <a href="#"> <i
					class="fa fa-commenting-o" aria-hidden="true"></i> 댓글 <span> 3개</span></a>
			</div>
			<div class="row" style="margin-top: 5px">
				<div class="col-md-10" style="">
					<div>
						댓글 1 JJUNEST <span>2017-05-27 시간</span> 내용 블라블라블라블라
					</div>

				</div>
				<div class="col-md-10" style="">
					<div>
						댓글 1 JJUNEST <span>2017-05-27 시간</span> 내용 블라블라블라블라
					</div>

				</div>
				<div class="col-md-10" style="">
					<div>
						댓글 1 JJUNEST <span>2017-05-27 시간</span> 내용 블라블라블라블라
					</div>

				</div>
				<div class="col-md-10" style="">
					<div>
						댓글 1 JJUNEST <span>2017-05-27 시간</span> 내용 블라블라블라블라
					</div>

				</div>
			</div>

		</div>

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


	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
		});

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
