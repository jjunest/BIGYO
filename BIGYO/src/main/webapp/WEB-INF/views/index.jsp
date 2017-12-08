<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 나누기의 몫을 정수값으로 구하기 위한 jstl 태그 라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Listsize를 위한 jstl태그라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collections"%>
<%@ page import="com.innovest.dtos.Chk_Hos_Serv_DTO"%>
<%@ page import="com.innovest.dtos.Serv_DTO"%>
<%@ page import="com.innovest.dtos.ServAge_DTO"%>
<%@ page import="com.innovest.dtos.ServPrice_DTO"%>
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
<style>
@font-face {
	font-family: 'MyFont';
	src: url(resources/font/BM_HANNA_11yrs.ttf);
	font-weight: bold;
}

.articleContent {
	text-align: center;
}

.worksArea .fa {
	font-size: 100px;
	margin: 0px 0px 30px 0px;
	color: #2980bc;
}

body {
	font-family: MyFont;
}

h1 {
	color: #373c48;
}

.howWorksSection .fa {
	font-size: 100px;
	color: #2980bc;
}

.processText {
		position: absolute;
	top: 70%;
	right: 30%;
	font-size:30px
}

.processImg {
	position: absolute;
	top: 20%;
	right: 33%;

}

@media ( max-width :768px) {
	#quickMapMenu {
		display: none;
	}
	.processText {
		margin-top: 140px;
	}
	.processImg {
		
	}
}
</style>

</head>

<body class="body-wrapper">
	<div class="page-loader" style="background: url(resources/img/preloader.gif) center no-repeat #fff;"></div>
	<div class="main-wrapper">
		<!-- HEADER FILE INCLUDE  -->
		<jsp:include page="header.jsp"></jsp:include>


		<!-- SLIDER SECTION -->
		<section class="main-slider" data-loop="true" data-autoplay="true" data-interval="7000">
		<div class="inner">

			<!-- Slide One -->
			<div class="slide slide1" style="background-image: url(resources/img/index_imgs/jumbotron3black.png);">
				<div class="container">
					<div class="slide-inner1 common-inner">
						<span class="h2 from-bottom" style="font-family: MyFont; color: #ffffff; font-size: 40px">국내 최초 프리미엄 건강검진 비교 검색 서비스</span><br> <span class="h1 from-bottom"
							style="font-family: MyFont; color: #ffffff; text-align: center"
						> - 검진모아 - </span><br>
					</div>
				</div>
			</div>

			<!-- Slide Two -->
			<div class="slide slide2" style="background-image: url(resources/img/index_imgs/jumbotron8.jpg);">
				<div class="container">
					<div class="slide-inner2 common-inner">
						<span class="h2 from-bottom" style="font-family: MyFont; color: #ffffff; font-size: 40px">모든 건강검진 상품을 한 곳에 모았습니다</span><br> <span class="h1 from-bottom"
							style="font-family: MyFont; color: #ffffff; text-align: center"
						> 프리미엄 건강검진 비교 검색 서비스 - 검진모아</span><br>
					</div>
				</div>
			</div>

			<!-- Slide Three -->
			<div class="slide slide3" style="background-image: url(resources/img/index_imgs/jumbotron7black.png);">
				<div class="container">
					<div class="slide-inner3 common-inner">
						<span class="h2 from-bottom" style="font-family: MyFont; color: #ffffff; font-size: 40px;">이제 검진모아를 사용하고</span> <span class="h2 from-bottom"
							style="font-family: MyFont; color: #ffffff; font-size: 40px;"
						>합리적인 비용으로</span><br> <span class="h1 from-bottom" style="font-family: MyFont; color: #ffffff;"> 건강검진을 받으세요</span><br>
					</div>
				</div>
			</div>




		</div>
		</section>

		<!-- SEARCH BROWSE SECTION -->
		<section class="clearfix bg-light pr">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 ">
					<div class="bg-search">
						<form class="form-inline" action="eventHospitals">

							<div class="form-group col-sm-6 col-xs-12">
								<div class="searchSelectbox">
									<select name="siDoSelect" id="siDoSelect" class="select-drop">
										<option value="전체">전체 시/도</option>
										<option value="서울특별시">서울특별시</option>
										<option value="경기도">경기도</option>
										<option value="충청북도">충청북도</option>
										<option value="충청남도">충청남도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="강원도">강원도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="제주도">제주도</option>
									</select>
								</div>
							</div>


							<div class="form-group col-sm-6 col-xs-12">
								<button type="submit" class="btn btn-primary">
									건강검진 상품 검색 <i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		</section>

		<!-- YOUTUBE VIDEO SECTION -->
		<!-- 		<section>
		<div class="container">
			<div class="thumbnail blogInner">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/jdMXyXuualc"></iframe>
				</div>
			</div>
		</div>
		</section> -->


		<!-- worksArea SECTION-->
		<section class="clearfix worksArea">
		<div class="container">
			<div class="page-header text-center">
				<h1>
					이제 합리적인 비교 후에 <br> 건강검진 상품을 선택하세요
				</h1>
			</div>
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail articleContent">
						<i class="fa fa-search-plus" aria-hidden="true"></i>
						<div class="caption">

							<h3 style="font-family: MyFont; font-size: 27px">전국/지역별 건강검진 상품 검색</h3>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail articleContent">
						<i class="fa fa-balance-scale" aria-hidden="true"></i>
						<div class="caption">

							<h3 style="font-family: MyFont; font-size: 27px">
								비슷한 건강검진 상품과 비교하기
								<p>가격 비교, 항목 비교</p>
							</h3>
						</div>

					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail articleContent">
						<i class="fa fa-user-md" aria-hidden="true"></i>
						<div class="caption">

							<h3 style="font-family: MyFont; font-size: 27px">
								나에게 적합한 건강검진 추천
								<p>*추후 서비스 예정</p>
							</h3>


						</div>

					</div>
				</div>
			</div>
		</div>
		</section>

		<section> </section>

		<!-- CARS SECTION -->
		<section class="clearfix filterProtfolio" style="background-color: #dddddd;">
		<div class="container">
			<div class="page-header text-center">
				<h1>전국 건강 검진 상품</h1>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="filter-container isotopeFilters">
						<ul class="list-inline filter">
							<li class="active" id="activeClickTopHosList_liTag" class=""><a href="#" data-filter=".clickTopItem" id="activeClickTopHosList_aTag">인기 건강 검진</a></li>
							<!-- 		<li class = ""><a href="#" data-filter=".recentItem">최근 등록 검진</a></li> -->

						</ul>
					</div>
				</div>
			</div>
			<div class="row isotopeContainer" id="container">
				<c:forEach var="listValue" items="${topSix_click_result_list}">
					<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector clickTopItem">
						<article class=""> <figure> <img src="${listValue.hosList[0].hos_pic_link}" alt="Image Protfolio" class="img-responsive">
						<div class="overlay-background">
							<div class="inner"></div>
						</div>
						<a href="hospitalDetails?chk_rcdno=${listValue.chk_rcdno}">
							<div class="overlay">
								<!-- <div class="overlayInfo">
									<span class="label label-primary"><i class="fa fa-heart-o" aria-hidden="true"></i> 10 k</span> <span class="label label-primary"><i class="fa fa-camera" aria-hidden="true"></i> 8</span>
								</div> -->
							</div>
						</a> </figure>
						<div class="figureBody">
							<h2>
								<a href="hospitalDetails?chk_rcdno=${listValue.chk_rcdno}">${listValue.chk_hos_name}<i class="fa fa-check-circle" aria-hidden="true"></i></a>
							</h2>

							<%
								//ageSetting 
									List<String> AgesSettingList = new ArrayList<String>();
									Chk_Hos_Serv_DTO chk_hos_serv_dto = (Chk_Hos_Serv_DTO) pageContext.getAttribute("listValue");
									for (ServPrice_DTO servprice_dto : chk_hos_serv_dto.getServpriceList()) {
										for (ServAge_DTO servage_dto : servprice_dto.getServageList()) {
											String afterSettingAge;
											afterSettingAge = servage_dto.getServage_age() + "대";
											if (AgesSettingList.contains(afterSettingAge)) {
											} else {
												AgesSettingList.add(afterSettingAge);
											}
										}
									}
									Collections.sort(AgesSettingList);
									if (AgesSettingList.contains("0대")) {
										Collections.replaceAll(AgesSettingList, "0대", "전체");
									}
							%>

							<c:forEach var="servPriceListValue" items="${listValue.servpriceList}">
								<div>
									<h3 style="color: #848484; display: inline;">
										<i class="fa fa-krw" aria-hidden="true"></i>
										<fmt:formatNumber>${servPriceListValue.servprice_price}  </fmt:formatNumber>

									</h3>
									<c:forEach var="servAgeListValue" items="${servPriceListValue.servageList}">
										<!-- 전체 연령을 표시 시작 -->
										<%
											ServAge_DTO servage_dto = (ServAge_DTO) pageContext.getAttribute("servAgeListValue");
														String filteredAge;
														if (servage_dto.getServage_age().equals("0")) {
															filteredAge = "전체";

														} else {
															filteredAge = servage_dto.getServage_age() + "대";
														}
										%>


										<span class="label label-info ageLabel" style="vertical-align: 25%;"><%=filteredAge%></span>
										<!-- 전체 연령을 표시 끝 -->
									</c:forEach>
								</div>
							</c:forEach>
						</div>
						<div class="figureFooter">
							<p style="font-size: 15px">
								<span class="glyphicon glyphicon-copyright-mark"></span>&nbsp;&nbsp;주관 업체: ${listValue.chk_mid_company}
							</p>
						</div>
						</article>
					</div>
				</c:forEach>



				<%-- <c:forEach var="listValue" items="${topSix_creDate_result_list}">
					<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector recentItem">
						<article class=""> <figure> <img src="${listValue.hosList[0].hos_pic_link}" alt="Image Protfolio" class="img-responsive">
						<div class="overlay-background">
							<div class="inner"></div>
						</div>
						<a href="category-list-left.html">
							<div class="overlay">
								<div class="overlayInfo">
									<span class="label label-primary"><i class="fa fa-heart-o" aria-hidden="true"></i> 10 k</span> <span class="label label-primary"><i class="fa fa-camera" aria-hidden="true"></i> 8</span>
								</div>
							</div>
						</a> </figure>
						<div class="figureBody">
							<h2>
								<a href="category-list-left.html">BMW M3 E92 2016 <i class="fa fa-check-circle" aria-hidden="true"></i></a>
							</h2>
							<p>
								19 Dec, 2016, <a href="category-list-left.html">BMW</a>
							</p>
							<h3>$80,000</h3>
						</div>
						<div class="figureFooter">
							<p>Brand New, Automatic, 80 km/h</p>
						</div>
						</article>
					</div>
				</c:forEach> --%>

			</div>
		</div>
		</section>

		<!-- WORKS SECTION -->
		<section class="clearfix howWorksSection" style="margin-top:100px">
		<div class="container process">
			<div class="page-header text-center" style="margin: 30px 0 30px 0;">
				<h1>검진모아의 프로세스</h1>
			</div>
			<div class="row" style="">
				<div class="col-md-4 col-sm-12 pro_box"
					style="display: inline-block; position: relative; width: 300px; height: 340px; background: url(resources/img/index_imgs/process_bg.png) no-repeat; margin: 30px"
				>
					<i class="fa fa-binoculars processImg" aria-hidden="true" style="color: #776b62"></i> <span class="processText" style="">1.정보수집</span>
				</div>
				<div class="col-md-4 col-sm-12 pro_box" style=" display: inline-block; position: relative; width: 300px; height: 340px; background: url(resources/img/index_imgs/process_bg_on.png) no-repeat; margin: 30px">
					<i class="fa fa-balance-scale processImg" aria-hidden="true" style="color: #ffffff"></i> <span class="processText" style="color: #ffffff">2.검색비교</span>
				</div>
				<div class="col-md-4 col-sm-12 pro_box" style=" display: inline-block; position: relative; width: 300px; height: 340px; background: url(resources/img/index_imgs/process_bg.png) no-repeat; margin: 30px">
					<i class="fa fa-hospital-o processImg" aria-hidden="true" style="color: #776b62"></i> <span class="processText" style="">3.예약접수</span>
				</div>
			</div>



		</div>

		</section>
	</div>


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
			activeClickTopHosList();
		});
		function activeClickTopHosList() {

			$("#activeClickTopHosList_liTag").click(function(event) {
				console.log("this is liTag Clicked");
			});
			$("#activeClickTopHosList_aTag").click(function(event) {
				console.log("this is aTag Clicked");
			});
			$("#activeClickTopHosList_aTag").trigger("click");
			$(".recentItem").css({

			});

		}
	</script>
</body>

</html>
