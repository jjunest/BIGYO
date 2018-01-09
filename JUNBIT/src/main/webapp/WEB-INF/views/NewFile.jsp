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
<title>비트코인 주식 제테크 - 준트</title>

<!-- PLUGINS CSS STYLE -->
<link href="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/listtyicons/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/bootstrapthumbnail/bootstrap-thumbnail.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/datepicker/datepicker.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/selectbox/select_option1.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/isotope/isotope.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/map/css/map.css" rel="stylesheet">

<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Muli:200,300,400,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">

<!-- CUSTOM CSS -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

<!-- FAVICON -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="shortcut icon">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- INTERNAL CSS STYLE -->
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
						<h2>PAGETITLESECTION</h2>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section></section>

		<section></section>

		<section></section>







		<!-- FOOTER FILE INCLUDE  -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


	<!-- JAVASCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/counter-up/jquery.counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/isotope/isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/fancybox/jquery.fancybox.pack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/isotope/isotope-triger.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/map/js/rich-marker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/map/js/infobox_packed.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/single-map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>


	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
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
