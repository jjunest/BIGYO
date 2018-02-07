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


<style>
.mouseOverHighlight {
	border-bottom: 1px solid blue;
	cursor: pointer !important;
	color: blue;
	pointer-events: auto;
}

table {
	table-layout: fixed;
}

.table>tbody>tr>td {
	overflow: hidden;
	text-align: center;
	vertical-align: middle;
}

.vcenter {
	display: inline-block;
	vertical-align: middle;
	float: none;
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
					<h4>쇼피니언 랭킹</h4>
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
	<div class="divide60"></div>
	<!--breadcrumbs-->
	<div class="container">
		<div class="center-heading">
			<h2>쇼피니언 유저 검색</h2>
			<span class="center-line"></span>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12 margin30">
				<div class="footer-col">
					<form role="form" class="subscribe-form">
						<div class="input-group" style="margin: 0 auto; width: 50%">
							<input type="text" class="form-control" placeholder="유저 아이디 검색"> <span class="input-group-btn">
								<button class="btn  btn-theme-dark btn-lg" type="submit">검색</button>
							</span>
						</div>
					</form>
				</div>
			</div>
			<!--footer col-->
		</div>

	</div>
	<div class="container">
		<div class="row">
			<h3 class="heading">
				<span> 유저 검색 결과 &nbsp &nbsp 3 </span>
			</h3>
			<div class="row">
				<div class="dropdown" style="text-align: right">
					<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
						<i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp인기지수<span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
						<li role="presentation"><a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> &nbsp인기지수</a></li>
						<li role="presentation"><a href="#"><i class="fa fa-eye" aria-hidden="true"></i> &nbsp쇼피니언지수</a></li>
						<li role="presentation"><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp일반의견지수</a></li>
						<li role="presentation"><a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp추천</a></li>
						<li role="presentation"><a href="#"><i class="fa fa-commenting-o" aria-hidden="true"></i> &nbsp댓글</a></li>
					</ul>
				</div>
			</div>
			<div class="divide30"></div>
			<table class="table table-striped" style="text-align: center">
				<thead>
					<tr>
						<th style="width: 10%" class="text-center">검색결과</th>
						<th style="width: 30%" class="text-center">닉네임</th>
						<th style="width: 13%" class="text-center">인기지수</th>
						<th style="width: 13%" class="text-center">쇼피니언지수</th>
						<th style="width: 13%" class="text-center">일반의견지수</th>
						<th style="width: 13%" class="text-center">추천순</th>
						<th style="width: 13%" class="text-center">댓글순</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="font-size: large;">1</td>
						<td>
							<div class="row" style="">
								<div class="col-md-3 vcenter">
									<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="" alt="" style="border-radius: 50%; width: 60px; height: 60px">
								</div>
								<div class="col-md-7 vcenter">
									JJUNEST8989
									<div class="">연세대학ㅇㅇㅇ</div>
								</div>
							</div>
						</td>
						<td><i class="fa fa-heart-o" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-eye" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp 50</td>
						<td><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp 100</td>
						<td><i class="fa fa-commenting-o" aria-hidden="true"></i> &nbsp 30</td>
					</tr>
					<tr>
						<td style="font-size: large;">2</td>
						<td>
							<div class="row" style="">
								<div class="col-md-3 vcenter">
									<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="" alt="" style="border-radius: 50%; width: 60px; height: 60px">
								</div>
								<div class="col-md-7 vcenter">
									JJUNEST8989
									<div class="">연세대학ㅇㅇㅇ</div>
								</div>
							</div>
						</td>
						<td><i class="fa fa-heart-o" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-eye" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp 50</td>
						<td><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp 100</td>
						<td><i class="fa fa-commenting-o" aria-hidden="true"></i> &nbsp 30</td>
					</tr>
					<tr>
						<td style="font-size: large;">3</td>
						<td>
							<div class="row" style="">
								<div class="col-md-3 vcenter">
									<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="" alt="" style="border-radius: 50%; width: 60px; height: 60px">
								</div>
								<div class="col-md-7 vcenter">
									JJUNEST8989
									<div class="">연세대학ㅇㅇㅇ</div>
								</div>
							</div>
						</td>
						<td><i class="fa fa-heart-o" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-eye" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp 50</td>
						<td><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp 100</td>
						<td><i class="fa fa-commenting-o" aria-hidden="true"></i> &nbsp 30</td>
					</tr>
					<tr>
						<td style="font-size: large;">4</td>
						<td>
							<div class="row" style="">
								<div class="col-md-3 vcenter">
									<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="" alt="" style="border-radius: 50%; width: 60px; height: 60px">
								</div>
								<div class="col-md-7 vcenter">
									JJUNEST8989
									<div class="">연세대학ㅇㅇㅇ</div>
								</div>
							</div>
						</td>
						<td><i class="fa fa-heart-o" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-eye" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp 50</td>
						<td><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp 100</td>
						<td><i class="fa fa-commenting-o" aria-hidden="true"></i> &nbsp 30</td>
					</tr>
					<tr>
						<td style="font-size: large;">5</td>
						<td>
							<div class="row" style="">
								<div class="col-md-3 vcenter">
									<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="" alt="" style="border-radius: 50%; width: 60px; height: 60px">
								</div>
								<div class="col-md-7 vcenter">
									JJUNEST8989
									<div class="">연세대학ㅇㅇㅇ</div>
								</div>
							</div>
						</td>
						<td><i class="fa fa-heart-o" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-eye" aria-hidden="true"></i> &nbsp 30</td>
						<td><i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp 50</td>
						<td><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp 100</td>
						<td><i class="fa fa-commenting-o" aria-hidden="true"></i> &nbsp 30</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="divide80"></div>


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


	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();

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
