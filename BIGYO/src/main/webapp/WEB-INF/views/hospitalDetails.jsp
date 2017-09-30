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
<link href="resources/css/ninja-slider8.css" rel="stylesheet">
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
	<div class="page-loader"
		style="background: url(resources/ img/ prelo.thumbnail { 
	 margin-bottom : 6px; } .carousel-control .left , .cariousel-control .right { background-image: none; margin-top: 10%; width: 5%;"
	></div>

	<div class="main-wrapper">
		<!-- HEADER FILE INCLUDE  -->
		<jsp:include page="header.jsp"></jsp:include>

		<!-- PAGE TITLE SECTION -->
		<section class="clearfix pageTitleSection bg-image" style="background-image: url(resources/img/background/bg-page-title.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="pageTitle">
						<h2>병원 상세 정보 & 검진 서비스 비교</h2>
					</div>
				</div>
			</div>
		</div>
		</section>

		<!-- LISTINGS DETAILS TITLE SECTION -->
		<section class="clearfix paddingAdjustBottom">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="listingTitleArea">
						<h2>Glory Hole Doughnuts</h2>
						<p>
							1150 Queen Street West Toronto <br>Ontario M6J 1J3, Canada
						</p>
						<div class="listingReview">
							<ul class="list-inline rating">
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
							</ul>
							<span>( 5 Reviews )</span>
							<ul class="list-inline captionItem">
								<li><i class="fa fa-heart-o" aria-hidden="true"></i> 10 k</li>
							</ul>
							<a href="#" class="btn btn-primary">Write a review</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>




		<!-- MODAL IMAGE GALLERY FRONT SECTION -->
		<section class="brandSection clearfix">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="owl-carousel partnersLogoSlider">
						<div class="slide">
							<div class="partnersLogo clearfix">
								<!-- Trigger the modal with a button -->
								<a title="lightbox0" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/listing/listing-details-1.jpg" onclick="lightbox(0)" />
								</a>

							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<!-- Trigger the modal with a button -->
								<a title="lightbox1" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/listing/listing-details-2.jpg" onclick="lightbox(1)" />
								</a>
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<!-- Trigger the modal with a button -->
								<a title="lightbox2" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/listing/listing-details-3.jpg" onclick="lightbox(2)" />
								</a>
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<!-- Trigger the modal with a button -->
								<a title="lightbox3" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/listing/listing-details-4.jpg" onclick="lightbox(3)" />
								</a>
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<!-- Trigger the modal with a button -->
								<a title="lightbox4" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/listing/listing-details-1.jpg" onclick="lightbox(4)" />
								</a>

							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<!-- Trigger the modal with a button -->
								<a title="lightbox5" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/listing/listing-details-2.jpg" onclick="lightbox(5)" />
								</a>
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<!-- Trigger the modal with a button -->
								<a title="Image 1" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/listing/listing-details-3.jpg" onclick="lightbox(2)" />
								</a>
							</div>
						</div>
						<div class="slide">
							<div class="partnersLogo clearfix">
								<!-- Trigger the modal with a button -->
								<a title="Image 1" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/listing/listing-details-4.jpg" onclick="lightbox(3)" />
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>


		<!-- LISTINGS DETAILS INFO SECTION -->
		<section class="clearfix paddingAdjustTop">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-xs-12">
					<div class="listDetailsInfo">
						<div class="detailsInfoBox">
							<h3>About This Hotel</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed eiusmod tempor incididunt labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
								nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.
								sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
							<p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia
								consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.</p>
							<p>Qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.eaque ipsa quae
								ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni
								dolores eos qui</p>
						</div>

						<div class="detailsInfoBox">
							<h3>About This Hotel</h3>
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
								<li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
								<li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
								<li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
							</ul>

							<div class="tab-content">
								<div id="home" class="tab-pane fade in active">
									<table class="table">
										<thead>
											<tr>
												<th>Firstname</th>
												<th>Lastname</th>
												<th>Email</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Default</td>
												<td>Defaultson</td>
												<td>def@somemail.com</td>
											</tr>
											<tr class="success">
												<td>Success</td>
												<td>Doe</td>
												<td>john@example.com</td>
											</tr>
											<tr class="danger">
												<td>Danger</td>
												<td>Moe</td>
												<td>mary@example.com</td>
											</tr>
											<tr class="info">
												<td>Info</td>
												<td>Dooley</td>
												<td>july@example.com</td>
											</tr>
											<tr class="warning">
												<td>Warning</td>
												<td>Refs</td>
												<td>bo@example.com</td>
											</tr>
											<tr class="active">
												<td>Active</td>
												<td>Activeson</td>
												<td>act@example.com</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="menu1" class="tab-pane fade">
									<h3>Menu 1</h3>
									<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
								</div>
								<div id="menu2" class="tab-pane fade">
									<h3>Menu 2</h3>
									<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
								</div>
								<div id="menu3" class="tab-pane fade">
									<h3>Menu 3</h3>
									<p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
								</div>
							</div>
						</div>

						<div class="detailsInfoBox">
							<h3>Features</h3>
							<ul class="list-inline featuresItems">
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Wi-Fi</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Street Parking</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Alcohol</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Vegetarian</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Reservations</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Pets Friendly</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Accept Credit Card</li>
							</ul>
						</div>
						<div class="detailsInfoBox">
							<h3>Reviews (3)</h3>
							<div class="media media-comment">
								<div class="media-left">
									<img src="resources/img/listing/list-user-1.jpg" class="media-object img-circle" alt="Image User">
								</div>
								<div class="media-body">
									<h4 class="media-heading">Jessica Brown</h4>
									<ul class="list-inline rating">
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
									</ul>
									<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudan totam rem ape riam,</p>
								</div>
							</div>
							<div class="media media-comment">
								<div class="media-left">
									<img src="resources/img/listing/list-user-2.jpg" class="media-object img-circle" alt="Image User">
								</div>
								<div class="media-body">
									<h4 class="media-heading">Jessica Brown</h4>
									<ul class="list-inline rating">
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
									</ul>
									<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudan totam rem ape riam,</p>
								</div>
							</div>
							<div class="media media-comment">
								<div class="media-left">
									<img src="resources/img/listing/list-user-3.jpg" class="media-object img-circle" alt="Image User">
								</div>
								<div class="media-body">
									<h4 class="media-heading">Jessica Brown</h4>
									<ul class="list-inline rating">
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
									</ul>
									<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudan totam rem ape riam,</p>
								</div>
							</div>
						</div>
						<div class="detailsInfoBox">
							<h3>Write A Review</h3>
							<div class="listingReview">
								<span>( 5 Reviews )</span>
								<ul class="list-inline rating rating-review">
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</ul>
							</div>
							<form action="#">
								<div class="formSection formSpace">
									<div class="form-group">
										<textarea class="form-control" rows="3" placeholder="Comment"></textarea>
									</div>
									<div class="form-group mb0">
										<button type="submit" class="btn btn-primary">Send Review</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="clearfix map-sidebar map-right">
						<div id="map-canvas" style="position: relative; margin: 0; padding: 0; height: 538px; max-width: none;"></div>
					</div>
					<div class="listSidebar">
						<h3>Location</h3>
						<div class="contactInfo">
							<ul class="list-unstyled list-address">
								<li><i class="fa fa-map-marker" aria-hidden="true"></i> 16/14 Babor Road, Mohammad pur <br> Dhaka, Bangladesh</li>
								<li><i class="fa fa-phone" aria-hidden="true"></i> +55 654 545 122 <br> +55 654 545 123</li>
								<li><i class="fa fa-envelope" aria-hidden="true"></i> <a href="#">info @example.com</a> <a href="#">info@startravelbangladesh.com</a></li>
							</ul>
						</div>
					</div>
					<div class="listSidebar">
						<h3>Opening Hours</h3>
						<ul class="list-unstyled sidebarList">
							<li><span class="pull-left">Monday</span> <span class="pull-right">08.00am - 05.00pm</span></li>
							<li><span class="pull-left">Tuesday</span> <span class="pull-right">08.00am - 05.00pm</span></li>
							<li><span class="pull-left">Wednesday</span> <span class="pull-right">08.00am - 05.00pm</span></li>
							<li><span class="pull-left">Thrusday</span> <span class="pull-right">08.00am - 05.00pm</span></li>
							<li><span class="pull-left">Friday</span> <span class="pull-right">08.00am - 05.00pm</span></li>
							<li><span class="pull-left">Saturday</span> <span class="pull-right"><a href="#">Closed</a></span></li>
							<li><span class="pull-left">Sunday</span> <span class="pull-right"><a href="#">Clo>ed</a></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		</section>







		<!-- FOOTER FILE INCLUDE  -->
		<jsp:include page="footer.jsp"></jsp:include>



	</div>


	<!--start-->
	<!-- hidden slider image part -->

	<div style="display: none;">
		<div id="ninja-slider">
			<div class="slider-inner">
				<ul>
					<li><a class="ns-img" href="resources/img/listing/listing-details-1.jpg"></a>
						<div class="caption">
							<h3>Dummy Caption 11</h3>
							<p>picture11 ipsum dolor sit amet, consectetur adipiscing elit. Phasellus accumsan purus.</p>
						</div></li>
					<li><a class="ns-img" href="resources/img/listing/listing-details-2.jpg"></a>
						<div class="caption">
							<h3>Dummy Caption 22</h3>
							<p>picture22 porro quisquam est, qui dolorem ipsum quia dolor sit amet</p>
						</div></li>
					<li><span class="ns-img" style="background-image: url(resources/img/listing/listing-details-3.jpg);"></span>
						<div class="caption">
							<h3>Dummy Caption 33</h3>
							<p>picture33 fringilla arcu convallis urna commodo, et tempus velit posuere.</p>
						</div></li>
					<li><a class="ns-img" href="resources/img/listing/listing-details-4.jpg"></a>
						<div class="caption">
							<h3>Dummy Caption 44</h3>
							<p>picture44 semper dolor sed neque consequat scelerisque at sed ex. Nam gravida massa.</p>
						</div></li>
					<li><a class="ns-img" href="resources/img/listing/listing-details-1.jpg"></a>
						<div class="caption">
							<h3>Dummy Caption 55</h3>
							<p>picture55 non dui at metus suscipit bibendum.</p>
						</div></li>
					<li><a class="ns-img" href="resources/img/listing/listing-details-1.jpg"></a>
						<div class="caption">
							<h3>Dummy Caption 66</h3>
							<p>picture66 non dui at metus suscipit bibendum.</p>
						</div></li>
				</ul>
				<div id="fsBtn" class="fs-icon" title="Expand/Close"></div>
			</div>
		</div>
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
	<script src="resources/js/jjunestjs.js"></script>
	<script src="resources/js/ninja-slider8.js"></script>
	<script>
		// html dom 이 다 로딩된 후 실행된다.
		$(document).ready(function() {
			/* PAGENAVIGATION 색칠 */
			var activePageNum = '${pNo % 5}';
			$("#pageNavi" + activePageNum).addClass("active");

		});
		//닌자 슬라이드 시작
		function lightbox(idx) {
			//show the slider's wrapper: this is required when the transitionType has been set to "slide" in the ninja-slider.js
			var ninjaSldr = document.getElementById("ninja-slider");
			ninjaSldr.parentNode.style.display = "block";

			nslider.init(idx);

			var fsBtn = document.getElementById("fsBtn");
			fsBtn.click();
		}

		function fsIconClick(isFullscreen) { //fsIconClick is the default event handler of the fullscreen button
			if (isFullscreen) {
				var ninjaSldr = document.getElementById("ninja-slider");
				ninjaSldr.parentNode.style.display = "none";
			}
		}
		//닌자 슬라이드 끝
	</script>

</body>

</html>



