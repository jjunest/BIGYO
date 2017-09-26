<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 나누기의 몫을 정수값으로 구하기 위한 jstl 태그 라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Listsize를 위한 jstl태그라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String cp = request.getContextPath();
%>
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
						<h2>할인 제휴 병원 목록</h2>
					</div>
				</div>
			</div>
		</div>
		</section>


		<!-- CATEGORY SEARCH SECTION -->
		<section class="clearfix searchArea banerInfo searchAreaGray">
		<form action="">
			<div class="container">
				<div class="row">
					<div class="col-sm-4 col-xs-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">Find</div>
								<input type="text" class="form-control" id="findItem" placeholder="What are you looking for?">
								<div class="input-group-addon addon-right"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">Near</div>
								<input type="text" class="form-control" id="nearLocation" placeholder="Location">
								<div class="input-group-addon addon-right">
									<i class="icon-listy icon-target" aria-hidden="true"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-12">

						<button type="submit" class="btn btn-primary">Search</button>

					</div>


				</div>
			</div>
		</form>
		</section>

		<!-- HOSPITALS LIST SECTION -->
		<section class="clerfix">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-xs-12">
					<div class="resultBar barSpaceAdjust">
						<h2>
							We found <span>${fn:length(result_list)}</span> Results for you
						</h2>
					</div>
					<c:forEach var="listValue" items="${result_list}">
						<div class="listContent">
							<div class="row">
								<div class="col-sm-5 col-xs-12">
									<div class="categoryImage">
										<a href="hospitalDetails?hcnNo=${listValue.hcmNo}"><img src="resources/img/things/things-1.jpg" alt="Image category" class="img-responsive img-rounded"> <span
											class="label label-primary"
										>Verified</span> </a>
									</div>
								</div>
								<div class="col-sm-7 col-xs-12">
									<div class="categoryDetails">
										<ul class="list-inline rating">
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
										</ul>
										<h2>
											<a href="hospitalDetails?hcnNo=${listValue.hcmNo}" style="color: #222222">${listValue.hmcNm}</a> <span class="likeCount"><i class="fa fa-heart-o" aria-hidden="true"></i> 10 k</span>
										</h2>
										<p>
											1569 Queen Street West <span class="placeName">Toronto</span>
										</p>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed eiusmod tempor incididunt labore et dolore magna aliqua.</p>
										<ul class="list-inline list-tag">
											<li><a href="hospitalDetails?hcnNo=${listValue.hcmNo}">${listValue.locAddr}</a></li>
											<li><a href="hospitalDetails?hcnNo=${listValue.hcmNo}">Restaurant</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
	</div>
	</section>


	<!--  페이지게이션 시작! -->
	<!--  pNo_shre 부분은 나눗셈의 몫을 만들어 주는 역할을 한다.  -->
	<fmt:parseNumber var="pNo_share" value="${(pNo-1)/5}" integerOnly="true" />


	<div class="row" style="border-top: 1px solid #ccc;">
		<nav style="text-align: center">
		<ul class="pagination">
			<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>

			<li id="pageNavi1"><a href="eventHospitals?pNo=${pNo_share*5+1}">${pNo_share*5+1}</a></li>
			<li id="pageNavi2"><a href="eventHospitals?pNo=${pNo_share*5+2}">${pNo_share*5+2}</a></li>
			<li id="pageNavi3"><a href="eventHospitals?pNo=${pNo_share*5+3}">${pNo_share*5+3}</a></li>
			<li id="pageNavi4"><a href="eventHospitals?pNo=${pNo_share*5+4}">${pNo_share*5+4}</a></li>
			<li id="pageNavi0"><a href="eventHospitals?pNo=${pNo_share*5+5}">${pNo_share*5+5}</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
		</nav>
	</div>

	<!--  페이지게이션 끝! -->

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
			/* PAGENAVIGATION 색칠 */
			var activePageNum = '${pNo % 5}';
			$("#pageNavi" + activePageNum).addClass("active");

		});
	</script>
</body>

</html>
