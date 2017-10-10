
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


		<!-- SLIDER SECTION -->
		<section class="main-slider" data-loop="true" data-autoplay="true" data-interval="7000">
		<div class="inner">

			<!-- Slide One -->
			<div class="slide slide1" style="background-image: url(resources/img/banner/slider-1.jpg);">
				<div class="container">
					<div class="slide-inner1 common-inner">
						<span class="h1 from-bottom">건강검진 후보 병원 No1</span> <span class="h4 from-bottom"> 30% 할인 된 가격으로 건강검진 시작!</span><br>
					</div>
				</div>
			</div>

			<!-- Slide Two -->
			<div class="slide slide2" style="background-image: url(resources/img/banner/slider-1.jpg);">
				<div class="container">
					<div class="slide-inner2 common-inner">
						<span class="h1 from-bottom">건강검진 후보 병원 No2</span> <span class="h4 from-bottom"> 30% 할인 된 가격으로 건강검진 시작!</span><br>
					</div>
				</div>
			</div>

			<!-- Slide Three -->
			<div class="slide slideResize slide4" style="background-image: url(resources/img/banner/slider-1.jpg);">
				<div class="container">
					<div class="common-inner slide-inner4">
						<span class="h1 from-bottom">건강검진 후보 병원 No3</span> <span class="h4 from-bottom"> 30% 할인 된 가격으로 건강검진 시작!</span><br>
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
						<form class="form-inline" action="category-grid.html">

							<div class="form-group col-sm-6 col-xs-12">
								<div class="searchSelectbox">
									<select name="guiest_id2" id="guiest_id2" class="select-drop">
										<option value="0">시/도 선택</option>
										<option value="1">전체 선택</option>
										<option value="2">서울특별시</option>
										<option value="3">경기도</option>
										<option value="4">충청북도</option>
										<option value="5">충청남도</option>
										<option value="6">경상북도</option>
										<option value="7">경상남도</option>
										<option value="8">강원도</option>
										<option value="9">전라북도</option>
										<option value="10">전라남도</option>
										<option value="11">제주도</option>
									</select>
								</div>
							</div>


							<div class="form-group col-sm-6 col-xs-12">
								<button type="submit" class="btn btn-primary">
									Search <i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		</section>

		<!-- YOUTUBE VIDEO SECTION -->
		<section>
		<div class="container">
			<div class="thumbnail blogInner">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/jdMXyXuualc"></iframe>
				</div>
			</div>
		</div>
		</section>


		<!-- CARS SECTION -->
		<section class="clearfix filterProtfolio">
		<div class="container">
			<div class="page-header text-center">
				<h2>
					New/Used Cars <small>This are some of most popular listing</small>
				</h2>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="filter-container isotopeFilters">
						<ul class="list-inline filter">
							<li class="active"><a href="#" data-filter="*">Popular Item</a></li>
							<li><a href="#" data-filter=".recentItem">Recent Item</a></li>
							<li><a href="#" data-filter=".featuredItem">Featured Item</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row isotopeContainer" id="container">
				<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector featuredItem">
					<article class=""> <figure> <img src="resources/img/cars/car-1.jpg" alt="Image Protfolio" class="img-responsive">
					<div class="overlay-background">
						<div class="inner"></div>
					</div>
					<a href="category-grid.html">
						<div class="overlay">
							<div class="overlayInfo">
								<span class="label label-primary"><i class="fa fa-heart-o" aria-hidden="true"></i> 10 k</span> <span class="label label-primary"><i class="fa fa-camera" aria-hidden="true"></i> 8</span>
							</div>
						</div>
					</a> </figure>
					<div class="figureBody">
						<h2>
							<a href="category-grid.html">BMW M3 E92 2016 <i class="fa fa-check-circle" aria-hidden="true"></i></a>
						</h2>
						<p>
							19 Dec, 2016, <a href="category-grid.html">BMW</a>
						</p>
						<h3>$80,000</h3>
					</div>
					<div class="figureFooter">
						<p>Brand New, Automatic, 80 km/h</p>
					</div>
					</article>
				</div>

				<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector recentItem">
					<article class=""> <figure> <img src="resources/img/cars/car-2.jpg" alt="Image Protfolio" class="img-responsive">
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

				<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector recentItem">
					<article class=""> <figure> <img src="resources/img/cars/car-3.jpg" alt="Image Protfolio" class="img-responsive">
					<div class="overlay-background">
						<div class="inner"></div>
					</div>
					<a href="category-grid-right.html">
						<div class="overlay">
							<div class="overlayInfo">
								<span class="label label-primary"><i class="fa fa-heart-o" aria-hidden="true"></i> 10 k</span> <span class="label label-primary"><i class="fa fa-camera" aria-hidden="true"></i> 8</span>
							</div>
						</div>
					</a> </figure>
					<div class="figureBody">
						<h2>
							<a href="category-grid-right.html">BMW M3 E92 2016 <i class="fa fa-check-circle" aria-hidden="true"></i></a>
						</h2>
						<p>
							19 Dec, 2016, <a href="category-grid-right.html">BMW</a>
						</p>
						<h3>$80,000</h3>
					</div>
					<div class="figureFooter">
						<p>Brand New, Automatic, 80 km/h</p>
					</div>
					</article>
				</div>

				<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector recentItem">
					<article class=""> <figure> <img src="resources/img/cars/car-4.jpg" alt="Image Protfolio" class="img-responsive">
					<div class="overlay-background">
						<div class="inner"></div>
					</div>
					<a href="category-grid.html">
						<div class="overlay">
							<div class="overlayInfo">
								<span class="label label-primary"><i class="fa fa-heart-o" aria-hidden="true"></i> 10 k</span> <span class="label label-primary"><i class="fa fa-camera" aria-hidden="true"></i> 8</span>
							</div>
						</div>
					</a> </figure>
					<div class="figureBody">
						<h2>
							<a href="category-grid.html">BMW M3 E92 2016 <i class="fa fa-check-circle" aria-hidden="true"></i></a>
						</h2>
						<p>
							19 Dec, 2016, <a href="category-grid.html">BMW</a>
						</p>
						<h3>$80,000</h3>
					</div>
					<div class="figureFooter">
						<p>Brand New, Automatic, 80 km/h</p>
					</div>
					</article>
				</div>

				<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector recentItem">
					<article class=""> <figure> <img src="resources/img/cars/car-4.jpg" alt="Image Protfolio" class="img-responsive">
					<div class="overlay-background">
						<div class="inner"></div>
					</div>
					<a href="category-grid.html">
						<div class="overlay">
							<div class="overlayInfo">
								<span class="label label-primary"><i class="fa fa-heart-o" aria-hidden="true"></i> 10 k</span> <span class="label label-primary"><i class="fa fa-camera" aria-hidden="true"></i> 8</span>
							</div>
						</div>
					</a> </figure>
					<div class="figureBody">
						<h2>
							<a href="category-grid.html">BMW M3 E92 2016 <i class="fa fa-check-circle" aria-hidden="true"></i></a>
						</h2>
						<p>
							19 Dec, 2016, <a href="category-grid.html">BMW</a>
						</p>
						<h3>$80,000</h3>
					</div>
					<div class="figureFooter">
						<p>Brand New, Automatic, 80 km/h</p>
					</div>
					</article>
				</div>



				<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector featuredItem">
					<article class=""> <figure> <img src="resources/img/cars/car-5.jpg" alt="Image Protfolio" class="img-responsive">
					<div class="overlay-background">
						<div class="inner"></div>
					</div>
					<a href="category-list-full.html">
						<div class="overlay">
							<div class="overlayInfo">
								<span class="label label-primary"><i class="fa fa-heart-o" aria-hidden="true"></i> 10 k</span> <span class="label label-primary"><i class="fa fa-camera" aria-hidden="true"></i> 8</span>
							</div>
						</div>
					</a> </figure>
					<div class="figureBody">
						<h2>
							<a href="category-list-full.html">BMW M3 E92 2016 <i class="fa fa-check-circle" aria-hidden="true"></i></a>
						</h2>
						<p>
							19 Dec, 2016, <a href="category-list-full.html">BMW</a>
						</p>
						<h3>$80,000</h3>
					</div>
					<div class="figureFooter">
						<p>Brand New, Automatic, 80 km/h</p>
					</div>
					</article>
				</div>

				<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector featuredItem">
					<article class=""> <figure> <img src="resources/img/cars/car-6.jpg" alt="Image Protfolio" class="img-responsive">
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

				<div class="col-md-4 col-sm-6 col-xs-12 isotopeSelector featuredItem">
					<article class=""> <figure> <img src="resources/img/cars/car-6.jpg" alt="Image Protfolio" class="img-responsive">
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


			</div>
		</div>
		</section>

		<!-- COUNT UP SECTION -->
		<section class="clearfix countUpSection countUpVerTwo">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-xs-12">
					<div class="countItem">
						<div class="iconArea">
							<i class="icon-listy icon-car-1"></i>
						</div>
						<div class="totalCount">
							<span class="counter">15000</span>+
							<p>병원 데이터 확보 수</p>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-xs-12">
					<div class="countItem">
						<div class="iconArea">
							<i class="icon-listy icon-user-11"></i>
						</div>
						<div class="totalCount">
							<span class="counter">2500</span>+
							<p>일주일 방문자 수</p>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-xs-12">
					<div class="countItem">
						<div class="iconArea">
							<i class="icon-listy icon-chat-3"></i>
						</div>
						<div class="totalCount">
							<span class="counter">3000</span>+
							<p>일주일 예약자 수</p>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-xs-12">
					<div class="countItem">
						<div class="iconArea">
							<i class="icon-listy icon-shield"></i>
						</div>
						<div class="totalCount">
							<span class="counter">190</span>+
							<p>일주일 검진완료</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>

		<!-- ARTICLES SECTION-->
		<section class="clearfix articlesSection">
		<div class="container">
			<div class="page-header text-center">
				<h2>
					News & Reviews <small>This are some of most popular News </small>
				</h2>
			</div>
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail articleContent">
						<img src="resources/img/news/news-1.jpg" alt="Image news" class="img-responsive">
						<div class="caption">
							<h4>
								Nov 22, 2016 by <a href="#">Admin</a>
							</h4>
							<h3>
								<a href="blog-details.html">Donec id dolor in erat imperdiet.</a>
							</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed eiusmod tempor incididunt labore et dolore magna aliqua.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail articleContent">
						<img src="resources/img/news/news-2.jpg" alt="Image news" class="img-responsive">
						<div class="caption">
							<h4>
								Nov 22, 2016 by <a href="#">Admin</a>
							</h4>
							<h3>
								<a href="blog-details.html">Donec id dolor in erat imperdiet.</a>
							</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed eiusmod tempor incididunt labore et dolore magna aliqua.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail articleContent">
						<img src="resources/img/news/news-3.jpg" alt="Image news" class="img-responsive">
						<div class="caption">
							<h4>
								Nov 22, 2016 by <a href="#">Admin</a>
							</h4>
							<h3>
								<a href="blog-details.html">Donec id dolor in erat imperdiet.</a>
							</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed eiusmod tempor incididunt labore et dolore magna aliqua.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>


		<!-- 		 WORKS SECTION -->
		<section class="clearfix worksArea">
		<div class="container">
			<div class="page-header text-center">
				<h2>
					How it Works? <small>This are some of most popular listing</small>
				</h2>
			</div>
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail text-center worksContent">
						<img src="img/works/works-1.png" alt="Image works">
						<div class="caption">
							<a href="how-it-works.html"><h3>Find what you want</h3></a>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed eiusmod tempor incididunt labore et dolore magna aliqua.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail text-center worksContent">
						<img src="img/works/works-2.png" alt="Image works">
						<div class="caption">
							<a href="how-it-works.html"><h3>Review & Plan your day</h3></a>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed eiusmod tempor incididunt labore et dolore magna aliqua.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="thumbnail text-center worksContent">
						<img src="img/works/works-3.png" alt="Image works">
						<div class="caption">
							<a href="how-it-works.html"><h3>Explore Location</h3></a>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed eiusmod tempor incididunt labore et dolore magna aliqua.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="btnArea text-center">
						<a href="#" class="btn btn-primary">Watch it now <i class="fa fa-play-circle" aria-hidden="true"></i></a>
					</div>
				</div>
			</div>
		</div>
		</section>





		<!-- BRAND SECTION -->
		<section class="brandSection clearfix">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="owl-carousel partnersLogoSlider">
						<div class="slide">
							<div class="partnersLogo clearfix">
								<img src="resources/img/brands/brand-1.png" alt="Image Brand">
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<img src="resources/img/brands/brand-2.png" alt="Image Brand">
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<img src="resources/img/brands/brand-3.png" alt="Image Brand">
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<img src="resources/img/brands/brand-4.png" alt="Image Brand">
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<img src="resources/img/brands/brand-5.png" alt="Image Brand">
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<img src="resources/img/brands/brand-1.png" alt="Image Brand">
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<img src="resources/img/brands/brand-2.png" alt="Image Brand">
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<img src="resources/img/brands/brand-3.png" alt="partner-img">
							</div>
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
