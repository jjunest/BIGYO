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
<!-- 랭킹을 위한 데이터 테이블 -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
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
			</div>
		</div>
	</div>
	<div class="divide60"></div>
	<div class="divide60"></div>
	<div class="container">
		<div class="row">
			<h3 class="heading">
				<span> &nbsp &nbsp유저 순위 </span>
			</h3>
			<div class="row">
				<div class="dropdown" style="text-align: right; margin-right: 10px">
					<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
						정렬기준 - <span class="user_order">추천지수 </span><span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
						<li role="presentation"><a href="${pageContext.request.contextPath}/rankings?user_order=ranking_user_like"><i class="fa fa-heart-o" aria-hidden="true"></i> &nbsp인기지수</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/rankings?user_order=ranking_opinion_show_total"><i class="fa fa-eye" aria-hidden="true"></i> &nbsp쇼피니언지수</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/rankings?user_order=ranking_opinion_normal_total"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								&nbsp일반의견지수</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/rankings?user_order=ranking_thumbup_total"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp추천지수</a></li>
					</ul>
				</div>
			</div>
			<div class="divide30"></div>
			<table id="example" class="display table table-striped stripe" cellspacing="0" width="100%" style="text-align: center">
				<thead>
					<tr>
						<th style="text-align: center; width: 10%">순위</th>
						<th style="text-align: center; width: 30%">활동명/소속</th>
						<th style="text-align: center; width: 15%">인기지수</th>
						<th style="text-align: center; width: 15%">쇼피니언지수</th>
						<th style="text-align: center; width: 15%">일반의견지수</th>
						<th style="text-align: center; width: 15%">추천지수</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="listValue_user_ranking" items="${user_ranking_list}" varStatus="status">
						<tr>
							<td style="font-size: large; width: 10%">${status.index+1 }</td>
							<td style="width: 30%">
								<div class="row">
									<div class="col-md-2 vcenter">
										<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_user_ranking.rcdno }"> <img src="${pageContext.request.contextPath}/${listValue_user_ranking.sp_user_picUrl }"
											class="" alt="" style="border-radius: 50%; width: 60px; height: 60px" onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_user_img.png';">
										</a>
									</div>
									<div class="col-md-7 vcenter">
										<span style="font-weight: bold"> <c:if test="${listValue_user_ranking.openname eq '이름'}">
												<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_user_ranking.rcdno }">${listValue_user_ranking.realname}</a>
											</c:if> <c:if test="${listValue_user_ranking.openname eq '닉네임'}">
												<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_user_ranking.rcdno }"> ${listValue_user_ranking.nickname}</a>
											</c:if></span>
										<div class="">
											<c:if test="${listValue_user_ranking.groupname_open eq 'on'}">
												<div style="margin: 10px">
													<span style="font-weight:; font-size: 16px">${listValue_user_ranking.groupname }</span>
												</div>
											</c:if>
											<c:if test="${empty listValue_user_ranking.groupname_open or listValue_user_ranking.groupname_open eq 'off'}">
												<div style="margin: 10px">
													<span style="font-weight:; font-size: 16px">소속 비공개</span>
												</div>
											</c:if>
										</div>
									</div>


								</div>
							</td>
							<td><i class="fa fa-heart-o" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="인기 추천을 받은 총 갯수"></i> &nbsp +${listValue_user_ranking.ranking_user_like}</td>
							<td><i class="fa fa-eye" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="쇼피니언 의견을 작성한 총 갯수"></i> &nbsp +${listValue_user_ranking.ranking_opinion_show_total}</td>
							<td><i class="fa fa-pencil-square-o" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="일반의견을 작성한 총 갯수"></i> &nbsp +${listValue_user_ranking.ranking_opinion_normal_total}</td>
							<td><i class="fa fa-thumbs-o-up" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="의견 추천을 받은 총 갯수"></i> &nbsp +${listValue_user_ranking.ranking_thumbup_total}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="divide80"></div>
	<div class="container">
		<div class="row">
			<h3 class="heading">
				<span> &nbsp &nbsp소속 순위 </span>
			</h3>
			<div class="row">
				<div class="dropdown" style="text-align: right; margin-right: 10px">
					<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
						정렬기준 - <span class="user_order">추천지수 </span><span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
						<li role="presentation"><a href="${pageContext.request.contextPath}/rankings?user_order=ranking_user_like"><i class="fa fa-heart-o" aria-hidden="true"></i> &nbsp인기지수</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/rankings?user_order=ranking_opinion_show_total"><i class="fa fa-eye" aria-hidden="true"></i> &nbsp쇼피니언지수</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/rankings?user_order=ranking_opinion_normal_total"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								&nbsp일반의견지수</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/rankings?user_order=ranking_thumbup_total"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp추천지수</a></li>
					</ul>
				</div>
			</div>
			<div class="divide30"></div>
			<table id="example" class="display table table-striped stripe" cellspacing="0" width="100%" style="text-align: center">
				<thead>
					<tr>
						<th style="text-align: center; width: 10%">순위</th>
						<th style="text-align: center; width: 30%">소속 이름</th>
						<th style="text-align: center; width: 15%">인기지수</th>
						<th style="text-align: center; width: 15%">쇼피니언지수</th>
						<th style="text-align: center; width: 15%">일반의견지수</th>
						<th style="text-align: center; width: 15%">추천지수</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="listValue_user_ranking" items="${group_ranking_list}" varStatus="status">
						<tr>
							<td style="font-size: large; width: 10%">${status.index+1 }</td>
							<td style="width: 30%">
								<div class="row">
									<div style="margin: 10px">
										<span style="font-weight:; font-size: 16px">${listValue_user_ranking.groupname }</span>
									</div>
								</div>
							</td>
							<td><i class="fa fa-heart-o" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="인기 추천을 받은 총 갯수"></i> &nbsp +${listValue_user_ranking.ranking_user_like}</td>
							<td><i class="fa fa-eye" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="쇼피니언 의견을 작성한 총 갯수"></i> &nbsp +${listValue_user_ranking.ranking_opinion_show_total}</td>
							<td><i class="fa fa-pencil-square-o" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="일반의견을 작성한 총 갯수"></i> &nbsp +${listValue_user_ranking.ranking_opinion_normal_total}</td>
							<td><i class="fa fa-thumbs-o-up" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="의견 추천을 받은 총 갯수"></i> &nbsp +${listValue_user_ranking.ranking_thumbup_total}</td>
						</tr>
					</c:forEach>
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
	<!-- DataTable CDN -->
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();

			//랭킹 정렬 sort button 바꾸기. 
			ranking_sort_change();

		});

		function ranking_sort_change() {

			var user_order = GetURLParameter("user_order");
			if (user_order == "ranking_user_like") {
				$(".user_order").text("인기지수");
			} else if (user_order == "ranking_opinion_show_total") {
				$(".user_order").text("쇼피니언지수");
			} else if (user_order == "ranking_opinion_normal_total") {
				$(".user_order").text("일반의견지수");
			} else if (user_order == "ranking_thumbup_total") {
				$(".user_order").text("추천지수");
			} else {
				$(".user_order").text("추천지수");
			}
		}
		function GetURLParameter(sParam) {
			var sPageURL = window.location.search.substring(1);
			var sURLVariables = sPageURL.split('&');
			for (var i = 0; i < sURLVariables.length; i++) {
				var sParameterName = sURLVariables[i].split('=');
				if (sParameterName[0] == sParam) {
					return sParameterName[1];
				}
			}
		}
		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/rankings") != -1) {
				$("#navmenu_rankings").css("color", "#39a1f4");
			}
		}
	</script>
</body>

</html>
