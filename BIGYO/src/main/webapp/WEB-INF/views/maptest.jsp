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



		<section>
		<div id="map" style="position: relative; margin: 0; padding: 0; height: 538px; max-width: none;"></div>
		</section>

		<section></section>

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
	<!-- 	<script src="resources/js/single-map.js"></script> -->
	<!-- 	<script src="resources/js/map.js"></script> -->
	<!-- 	<script src="resources/js/searchmap.js"></script> -->
	<script src="resources/js/custom.js"></script>
	<!-- GOOGLE MAP CLUSTERING LIBRARY -->
	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script>
		// html dom 이 다 로딩된 후 실행된다.
		$(document).ready(function() {
			initMap();
		});

		function initMap() {

			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 3,
				center : {
					lat : -28.024,
					lng : 140.887
				}
			});

			// Create an array of alphabetical characters used to label the markers.
			var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

			// Add some markers to the map.
			// Note: The code uses the JavaScript Array.prototype.map() method to
			// create an array of markers based on a given "locations" array.
			// The map() method here has nothing to do with the Google Maps API.

			var markers = locations
					.map(function(location, i) {
						var marker = new google.maps.Marker({
							position : location,
							label : labels[i % labels.length]
						});

						var contentString = '<div id="content">'
								+ '<div id="siteNotice">'
								+ '</div>'
								+ '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'
								+ '<div id="bodyContent">'
								+ '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large '
								+ 'sandstone rock formation in the southern part of the '
								+ 'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '
								+ 'south west of the nearest large town, Alice Springs; 450&#160;km '
								+ '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '
								+ 'features of the Uluru - Kata Tjuta National Park. Uluru is '
								+ 'sacred to the Pitjantjatjara and Yankunytjatjara, the '
								+ 'Aboriginal people of the area. It has many springs, waterholes, '
								+ 'rock caves and ancient paintings. Uluru is listed as a World '
								+ 'Heritage Site.</p>'
								+ '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194" target="_blank">'
								+ 'https://en.wikipedia.org/w/index.php?title=Uluru</a> '
								+ '(last visited June 22, 2009).</p>'
								+ '</div>' + '</div>';

						google.maps.event
								.addListener(
										marker,
										'click',
										function() {
											console.log('this is marker click');
											var infowindow = new google.maps.InfoWindow(
													{
														content : contentString
													});
											infowindow.open(map, marker);
										});

						return marker;
					});

			// Add a marker clusterer to manage the markers.
			var markerCluster = new MarkerClusterer(
					map,
					markers,
					{
						imagePath : 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
					});
		}
		var locations = [ {
			lat : -31.563910,
			lng : 147.154312
		}, {
			lat : -33.718234,
			lng : 150.363181
		}, {
			lat : -33.727111,
			lng : 150.371124
		}, {
			lat : -33.848588,
			lng : 151.209834
		}, {
			lat : -33.851702,
			lng : 151.216968
		}, {
			lat : -34.671264,
			lng : 150.863657
		}, {
			lat : -35.304724,
			lng : 148.662905
		}, {
			lat : -36.817685,
			lng : 175.699196
		}, {
			lat : -36.828611,
			lng : 175.790222
		}, {
			lat : -37.750000,
			lng : 145.116667
		}, {
			lat : -37.759859,
			lng : 145.128708
		}, {
			lat : -37.765015,
			lng : 145.133858
		}, {
			lat : -37.770104,
			lng : 145.143299
		}, {
			lat : -37.773700,
			lng : 145.145187
		}, {
			lat : -37.774785,
			lng : 145.137978
		}, {
			lat : -37.819616,
			lng : 144.968119
		}, {
			lat : -38.330766,
			lng : 144.695692
		}, {
			lat : -39.927193,
			lng : 175.053218
		}, {
			lat : -41.330162,
			lng : 174.865694
		}, {
			lat : -42.734358,
			lng : 147.439506
		}, {
			lat : -42.734358,
			lng : 147.501315
		}, {
			lat : -42.735258,
			lng : 147.438000
		}, {
			lat : -43.999792,
			lng : 170.463352
		} ]
	</script>
</body>

</html>
