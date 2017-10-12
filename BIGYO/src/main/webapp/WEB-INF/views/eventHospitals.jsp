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
<style>
</style>
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
					<div class="col-sm-6 col-xs-12">
						<div class="form-group">
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
					</div>

					<div class="col-sm-6 col-xs-12">
						<button type="submit" class="btn btn-primary">검색하기</button>
					</div>


				</div>

			</div>
		</form>
		</section>




		<!-- CATEGORY LIST SECTION -->
		<section class="clerfix">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-xs-12">
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
										<a href="hospitalDetails?chk_rcdno=${listValue.chk_rcdno}"><img src="resources/img/things/things-1.jpg" alt="Image category" class="img-responsive img-rounded"> <span
											class="label label-primary"
										>Verified</span> </a>
									</div>
								</div>
								<div class="col-sm-7 col-xs-12">
									<div class="categoryDetails">
										<ul class="list-inline rating">
											<li><span class="label label-default">추천 연령</span></li>
											<li><span class="label label-success">전체</span></li>
											<li><span class="label label-info">20대</span></li>
											<li><span class="label label-info">30대</span></li>
										</ul>
										<h2>
											<a href="hospitalDetails?chk_rcdno=${listValue.chk_rcdno}" style="color: #222222">${listValue.chk_hos_name}</a>
										</h2>

										<p style="margin: 1px">
											<i class="fa fa-won" style="vertical-align: baseline;"></i> <span style="font-weight: bold">200,000&nbsp;</span> <span class="label label-info" style="vertical-align: 15%;">20대</span>&nbsp;&nbsp;|&nbsp;
											<i class="fa fa-won" style="vertical-align: baseline;"></i> <span style="font-weight: bold">200,000&nbsp;</span> <span class="label label-info" style="vertical-align: 15%;">20대</span>&nbsp;&nbsp;

										</p>

										<p style="margin: 1px">
											<span class="glyphicon glyphicon-copyright-mark"></span>&nbsp;&nbsp;주관 업체: ${listValue.chk_mid_company}
										</p>
										<p style="margin: 1px">
											<span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;예약 전화: <a href="tel:${listValue.chk_mid_company_pnum}">${listValue.chk_mid_company_pnum}</a>
										</p>


										<p style="margin: 1px">
											<span class="glyphicon glyphicon-phone-alt"></span>&nbsp;&nbsp;병원 전화: ${listValue.chk_hos_pnum}
										</p>
										<p style="margin: 3px">
											<span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;<a href="hospitalDetails?chk_rcdno=${listValue.chk_rcdno}" index=${status.index}>${listValue.chk_loc_full}</a>

										</p>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>

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
				</div>
				<!-- 오른쪽의 따라다니는 메뉴들 시작 -->
				<div class="col-sm-4 col-xs-12">
					<div id="quickMapMenu" class="clearfix map-sidebar map-right map-margin-btm">

						<div class="clearfix map-sidebar map-right">
							<div id="map-canvas_eventList" style="position: relative; margin: 0; padding: 0; height: 538px; max-width: none;"></div>
						</div>
						<div id="quickMenu_Textbox" class="listSidebar">
							<h4>${result_list[0].chk_hos_name}</h4>
							<div class="contactInfo">
								<ul class="list-unstyled list-address">
									<li><i class="fa fa-map-marker" aria-hidden="true"></i> 16/14 Babor Road, Mohammad pur <br> Dhaka, Bangladesh</li>
									<li><i class="fa fa-phone" aria-hidden="true"></i> +55 654 545 122 <br> +55 654 545 123</li>
									<li><i class="fa fa-envelope" aria-hidden="true"></i> <a href="#">info @example.com</a> <a href="#">info@startravelbangladesh.com</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- 오른쪽의 따라다니는 메뉴들 끝 -->
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
	<!-- 	<script src="resources/js/single-map.js"></script>
	<script src="resources/js/map.js"></script> -->
	<script src="resources/js/custom.js"></script>
	<!-- GOOGLE MAP CLUSTERING LIBRARY -->
	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>

	<script>
		// html dom 이 다 로딩된 후 실행된다.
		$(document).ready(function() {
			/* PAGENAVIGATION 색칠 */
			var activePageNum = '${pNo % 5}';
			$("#pageNavi" + activePageNum).addClass("active");

			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			if (urlpath.includes("/bigyo/eventHospitals_map")) {

				$("#navmenu_eventHospitals_map").css("color", "#39a1f4");

			} else if (urlpath.includes("/bigyo/eventHospitals")) {

				$("#navmenu_eventHospitals").css("color", "#39a1f4");
			}
			/* navigation menu 주소에 따라서 active 설정 끝 */
			/* googlemapSingleMarker() start : sidebarMAP 에 구글 초기값 설정해주는 함수 */
			googlemapSingleMarker();

			/* quickmap menu start : 따라다니는 메뉴 만드는 함수*/
			quickMapMenu();

			/* hover 시에 googleMapMarker change : 리스트에 마우스 올렸을 시에 MAP 전환 시켜주는 함수 */
			hoverMapFocusChange();

		});
		//hoverMapFocusChange() started
		function hoverMapFocusChange() {

			$(".listContent").hover(
					function() {
						/* List의 INDEX를 받아오고, INDEX를 통해서 MAP 의 LOCATION을 인자값으로 전달 */
						var index = $(".listContent").index(this);
						hoverRefreshMap(markerLists[index].chk_loc_lat,
								markerLists[index].chk_loc_lng);
						/* quck menu textbox 이름 변경*/
						console.log('this is index :' + index);
						/* 단순 접근은 되지만 index 변수를 활용한 접근은 불가능하다. */
						/* 		var index_string = "${result_list[3].hmcNm}"; */
						$("#quickMenu_Textbox h4").text(
								markerLists[index].chk_hos_name);
					}, function() {

					});

		}
		//hoverMapFocusChange() end		
		//hoverRefreshMap() started
		function hoverRefreshMap(paramLat, paramLng) {
			console.log('this is eventHospitals.js hoverRefreshMap()');
			var myLatLng = {
				lat : paramLat,
				lng : paramLng
			/* 	lat : parseFloat('${hospital_BasicInfo.cxVl}'),
				lng : parseFloat('${hospital_BasicInfo.cyVl}') */

			};
			var map = new google.maps.Map(document
					.getElementById('map-canvas_eventList'), {
				zoom : 16,
				center : myLatLng,
				styles : mapStyles
			});
			console.log('lat:' + myLatLng.lat + ', lng:' + myLatLng.lng);
			var image = 'resources/img/map/marker.png';
			var contentString = '<div id="content">'
					+ '<div id="siteNotice">'
					+ '</div>'
					+ '<h5 id="firstHeading" class="firstHeading">${hospital_BasicInfo.hmcNm}</h1>'
					+ '<div id="bodyContent">'
					+ '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194" target="_blank">'
					+ 'https://en.wikipedia.org/w/index.php?title=Uluru</a> '
					+ '(last visited June 22, 2009).</p>' + '</div>' + '</div>';
			var marker = new google.maps.Marker({
				position : myLatLng,
				map : map,
				icon : image,
				animation : google.maps.Animation.BOUNCE
			});
			google.maps.event.addListener(marker, 'click', function() {
				var infowindow = new google.maps.InfoWindow({
					content : contentString
				});
				infowindow.open(map, marker);
			});

		}
		//hoverRefreshMap() end
		// quickMapMenu() started
		function quickMapMenu() {
			var $win = $(window);
			/* footerTop은 quickMenu가 맨 밑까지 따라오지 못하게 설정 */
			var footerTop = $(".copyRight").offset().top;
			console.log('this is footerInfo height :' + footerTop.top);
			var top = $win.scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.

			/*사용자 설정 값 시작*/
			var speed = 1000; // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
			var easing = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
			var $layer = $('#quickMapMenu'); // 레이어 셀렉팅
			var layerTopOffset = 0; // 레이어 높이 상한선, 단위:px
			$layer.css('position', 'absolute');
			/*사용자 설정 값 끝*/

			// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
			if (top > 0)
				$win.scrollTop(layerTopOffset + top);
			else
				$win.scrollTop(0);

			//스크롤이벤트가 발생하면
			$(window).scroll(function() {
				// 430 이 움직이지 않은 값이다. 430 밑으로 가면 floating menu 가 동작함.
				yPosition = $win.scrollTop() - 430;
				console.log('this is yPosition:' + yPosition);
				console.log('this is footerInfo height :' + footerTop);
				if (yPosition < 0) {
					yPosition = 0;
				} else if (yPosition > footerTop - 1600) {
					yPosition = footerTop - 1600;

				}
				$layer.animate({
					"top" : yPosition
				}, {
					duration : speed,
					easing : easing,
					queue : false
				});
			});

		}
		// quickMapMenu() end

		// googlemapSingleMarker() started
		function googlemapSingleMarker() {
			var id = document.getElementById('map-canvas_eventList');
			if (id) {
				console.log('this is hospitalDetails.js id()');
				initMap();
			}

		}

		function initMap() {
			console.log('this is hospitalDetails.js initMap()');
			var myLatLng = {
				lat : markerLists[0].chk_loc_lat,
				lng : markerLists[0].chk_loc_lng
			/* 	lat : parseFloat('${hospital_BasicInfo.cxVl}'),
				lng : parseFloat('${hospital_BasicInfo.cyVl}') */

			};
			var lat2 = 151.23300;
			typeof lat2;
			var map = new google.maps.Map(document
					.getElementById('map-canvas_eventList'), {
				zoom : 16,
				center : myLatLng,
				styles : mapStyles
			});
			console.log('lat:' + myLatLng.lat + ', lng:' + myLatLng.lng);
			var image = 'resources/img/map/marker.png';
			var contentString = '<div id="content">'
					+ '<div id="siteNotice">'
					+ '</div>'
					+ '<h5 id="firstHeading" class="firstHeading">${hospital_BasicInfo.hmcNm}</h1>'
					+ '<div id="bodyContent">'
					+ '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194" target="_blank">'
					+ 'https://en.wikipedia.org/w/index.php?title=Uluru</a> '
					+ '(last visited June 22, 2009).</p>' + '</div>' + '</div>';
			var marker = new google.maps.Marker({
				position : myLatLng,
				map : map,
				icon : image,
				animation : google.maps.Animation.BOUNCE
			});
			google.maps.event.addListener(marker, 'click', function() {
				var infowindow = new google.maps.InfoWindow({
					content : contentString
				});
				infowindow.open(map, marker);
			});

		}

		var mapStyles = [ {
			'elementType' : 'geometry',
			'stylers' : [ {
				'color' : '#f5f5f5'
			} ]
		}, {
			'elementType' : 'labels.icon',
			'stylers' : [ {
				'visibility' : 'off'
			} ]
		}, {
			'elementType' : 'labels.text.fill',
			'stylers' : [ {
				'color' : '#616161'
			} ]
		}, {
			'elementType' : 'labels.text.stroke',
			'stylers' : [ {
				'color' : '#f5f5f5'
			} ]
		}, {
			'featureType' : 'administrative.land_parcel',
			'elementType' : 'labels.text.fill',
			'stylers' : [ {
				'color' : '#bdbdbd'
			} ]
		}, {
			'featureType' : 'poi',
			'elementType' : 'geometry',
			'stylers' : [ {
				'color' : '#eeeeee'
			} ]
		}, {
			'featureType' : 'poi',
			'elementType' : 'labels.text.fill',
			'stylers' : [ {
				'color' : '#757575'
			} ]
		}, {
			'featureType' : 'poi.park',
			'elementType' : 'geometry',
			'stylers' : [ {
				'color' : '#e5e5e5'
			} ]
		}, {
			'featureType' : 'poi.park',
			'elementType' : 'labels.text.fill',
			'stylers' : [ {
				'color' : '#9e9e9e'
			} ]
		}, {
			'featureType' : 'road',
			'elementType' : 'geometry',
			'stylers' : [ {
				'color' : '#ffffff'
			} ]
		}, {
			'featureType' : 'road.arterial',
			'elementType' : 'labels.text.fill',
			'stylers' : [ {
				'color' : '#757575'
			} ]
		}, {
			'featureType' : 'road.highway',
			'elementType' : 'geometry',
			'stylers' : [ {
				'color' : '#dadada'
			} ]
		}, {
			'featureType' : 'road.highway',
			'elementType' : 'labels.text.fill',
			'stylers' : [ {
				'color' : '#616161'
			} ]
		}, {
			'featureType' : 'road.local',
			'elementType' : 'labels.text.fill',
			'stylers' : [ {
				'color' : '#9e9e9e'
			} ]
		}, {
			'featureType' : 'transit.line',
			'elementType' : 'geometry',
			'stylers' : [ {
				'color' : '#e5e5e5'
			} ]
		}, {
			'featureType' : 'transit.station',
			'elementType' : 'geometry',
			'stylers' : [ {
				'color' : '#eeeeee'
			} ]
		}, {
			'featureType' : 'water',
			'elementType' : 'geometry',
			'stylers' : [ {
				'color' : '#0000e6'
			} ]
		}, {
			'featureType' : 'water',
			'elementType' : 'labels.text.fill',
			'stylers' : [ {
				'color' : '#9e9e9e'
			} ]
		} ];

		// googlemapSingleMarker() ended */

		/* 10개의 객체에서 경도와 위도 뽑아오기, el을 활용해서 javascript 변수 받아오고 marker 표시*/
		var markerLists = new Array();
		<c:forEach items = "${result_list}" var = "list">
		var json = new Object();
		json.chk_loc_lat = parseFloat("${list.chk_loc_lat}");
		json.chk_loc_lng = parseFloat("${list.chk_loc_lng}");
		json.chk_hos_name = "${list.chk_hos_name}";
		markerLists.push(json);
		</c:forEach>
	</script>
</body>

</html>
