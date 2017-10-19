<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 나누기의 몫을 정수값으로 구하기 위한 jstl 태그 라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Listsize를 위한 jstl태그라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String cp = request.getContextPath();
%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

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

<style>
.listSidebar {
	width: 90%;
}

.map-sidebar {
	width: 90%;
}

.modal-lg {
	width: 80%;
}

.modal-dialog {
	margin: 10px auto;
}

#servicePic_modalPart {
	cursor: zoom-in;
}

.close {
	font-size: 30px;
}

.table {
	margin-top: 20px;
	text-align: center;
	table-layout: fixed;
}

.listingReview span {
	margin: 5px;
}

.brandSection .partnersLogoSlider .slide .partnersLogo img {
	width: 100%;
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
						<h2>${chk_hos_serv_dto.chk_hos_name}</h2>

						<div class="listingReview">
							<div class="row">
								<div class="col-md-10 col-xs-12">
									<p style="font-weight: 800">
										<span class="glyphicon glyphicon-map-marker" style="margin-right: 3px"></span>${chk_hos_serv_dto.chk_loc_full}</p>
									<p style="margin: 1px">
										* 검진모아는 본 건강 검진 상품 및 서비스에 직접 관여하지 않으며, 예약, 결제, 검진, 환불의 의무는 각 주관업체에 있습니다. <br> * 검진모아가 수집한 정보와 해당 검진 상품을 주관하는 업체에서 제공하는 정보가 일치하지 않을 수 있습니다. <br> * 해당 주관업체에서 정확한 정보를 반드시 확인하여 주시기
										바랍니다.
									</p>
								</div>
								<div class="col-md-2 col-xs-12">
									<a href="#" class="btn btn-primary" style="width: 100%; margin: 5px;"> 바로 가기</a>
								</div>


							</div>



						</div>
						<div class="listingReview table-responsive">

							<table class="table table-hover table-bordered">
								<tbody>
									<tr>
										<td class="active " colspan="6">주관 업체</td>
										<td class="active " colspan="6">예약 번호</td>

									</tr>
									<tr>
										<td class="" colspan="6">${chk_hos_serv_dto.chk_mid_company}</td>
										<td class="" colspan="6">
											<a href="tel: ${chk_hos_serv_dto.chk_mid_company_pnum}">${chk_hos_serv_dto.chk_mid_company_pnum}</a>
										</td>
									</tr>
									<tr>
										<td class="active" colspan="2">번호</td>
										<td class="active" colspan="5">검진 상품 가격</td>
										<td class="active" colspan="5">추천 연령</td>

									</tr>
									<tr>
										<c:forEach var="servListValue" items="${chk_hos_serv_dto.servList}" varStatus="indexNum">
											<tr>

												<td class="" colspan="2">${indexNum.index}</td>
												<td class="" colspan="5">
													<i class="fa fa-won"></i>&nbsp
													<fmt:formatNumber>${servListValue.serv_price}  </fmt:formatNumber>
												</td>


												<td class="" colspan="5">
													<c:forEach var="servAgeListValue" items="${servListValue.servageList}">
														<span class="label label-info">${servAgeListValue.servage_age}대</span>

													</c:forEach>
												</td>







											</tr>
										</c:forEach>
								</tbody>
							</table>

						</div>




					</div>
				</div>
			</div>
		</div>
		</section>




		<!-- MODAL IMAGE GALLERY FRONT SECTION -->
		<!--  병원 사진 IMAGE GALLERY SECTION -->
		<section class="brandSection clearfix">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="owl-carousel partnersLogoSlider">
						<c:forEach var="hosListValue" items="${chk_hos_serv_dto.hosList}" varStatus="indexNum">
							<div class="slide">
								<div class="partnersLogo clearfix">
									<!-- Trigger the modal with a button -->
									<a title="${chk_hos_serv_dto.chk_hos_name} 사진" class="btn btn-info btn-lg" href="#"> <!-- 병원 이미지 pixel : 480 X 350 --> <img class="thumbnail img-responsive"
										src="${hosListValue.hos_pic_link}" onclick="lightbox(${indexNum.index})"
									/>
									</a>
								</div>
							</div>
							<!--슬라이더 사진 사이즈를 위한 주석 처리. 나중에 사진 사이즈 변경시 확인 필요함. 지우지 말아야 한다. 							
						<div class="slide">
							<div class="partnersLogo clearfix">
								Trigger the modal with a button
								<a title="lightbox0" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/listing/listing-details-1.jpg" onclick="lightbox(0)" />
								</a>
							</div>
						</div> -->
						</c:forEach>
						<!-- 이미지가 4개 이하일 시에는 루프를 돌려서 이미지를 추가해 준다.  -->
						<c:set var="hospic_len" value="${fn:length(chk_hos_serv_dto.hosList)}" />
						<c:if test="${hospic_len le 3}">
							<c:forEach var="item" begin="${hospic_len}" end="3" step="1">
								<div class="slide">
									<div class="partnersLogo clearfix">
										<!-- Trigger the modal with a button -->
										<a title="병원 사진" class="btn btn-info btn-lg" href="#"> <img class="thumbnail img-responsive" src="resources/img/noimagefound-iloveimg-resized.jpg" onclick="lightbox(${indexNum.index})" />
										</a>
									</div>
								</div>
							</c:forEach>

						</c:if>
					</div>
				</div>
			</div>
		</div>
		</section>


		<!-- HOSPITAL DETAILS INFO SECTION -->
		<!-- 병원 상세정보 SECTION  -->
		<section class="clearfix paddingAdjustTop">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-xs-12">
					<div class="listDetailsInfo">
						<!-- 건강검진 서비스 설명 DETAIL PICTURE IMAGE 사진 부분 시작 -->
						<div class="detailsInfoBox">
							<!-- serv_pic_link가 같은 사진일 수도 있음. 따라서 같은 사진일 경우에는 jsp에서 중복을 없애준 후, 다시 jstl로 보내준다. 첫 번째 루프는 중복 없앤 후에 list에 넣어주는 역할 -->
							<%
								List<String> serv_pic_links_injsp = new ArrayList<String>();
							%>
							<c:forEach var="servListValue" items="${chk_hos_serv_dto.servList}">
								<c:set var="serv_pic_link" value="${servListValue.serv_pic_link}" />
								<%
									String serv_pic_link_before_check = (String) pageContext.getAttribute("serv_pic_link");
										if (serv_pic_links_injsp.contains(serv_pic_link_before_check)) {
										} else {
											serv_pic_links_injsp.add(serv_pic_link_before_check);
										}
								%>

							</c:forEach>
							<!-- 두 번째 루프는 jstl 에 변수를 다시 던져주어서, 출력하는 역할 -->
							<%
								pageContext.setAttribute("serv_pic_links_injsp", serv_pic_links_injsp);
							%>
							<c:forEach var="servListValue" items="${serv_pic_links_injsp}">
								<a data-toggle="modal" data-target="#myModal" id="servicePic_modalPart" tagforjquery="${servListValue}" title=""><img style="width: 100%;" src="${servListValue}"> </a>
							</c:forEach>


						</div>
						<!-- 건강검진 서비스 설명 DETAIL PICTURE IMAGE 사진 부분 끝 -->
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
								<li><i class="fa fa-medkit" aria-hidden="true"></i> Alcohol</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Vegetarian</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Reservations</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Pets Friendly</li>
								<li><i class="fa fa-check-circle-o" aria-hidden="true"></i> Accept Credit Card</li>
							</ul>
						</div>

					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="clearfix map-sidebar map-right">
						<div id="map-canvas" style="position: relative; margin: 0; padding: 0; height: 538px; max-width: none;"></div>
					</div>
					<div class="listSidebar">
						<h3>${chk_hos_serv_dto.chk_hos_name}</h3>
						<div class="contactInfo">
							<ul class="list-unstyled list-address">
								<li><span class="glyphicon glyphicon-copyright-mark" aria-hidden="true"></span> 주관 업체: ${chk_hos_serv_dto.chk_mid_company}</li>
								<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 예약 전화: ${chk_hos_serv_dto.chk_mid_company_pnum}</li>

								<li><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 병원 상세 주소 <br> ${chk_hos_serv_dto.chk_loc_full}</li>
								<li><span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span> 병원 전화: ${chk_hos_serv_dto.chk_hos_pnum}</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
		</section>







		<!-- FOOTER FILE INCLUDE  -->
		<jsp:include page="footer.jsp"></jsp:include>



	</div>
	<!-- Hidden PART Start-->
	<!-- hidden slider image part : WHEN HOSPITAL PICTURES SLIDER CLICK, IT IS TRIGGERED-->
	<!-- 병원 사진 눌렀을 때 불러지는 부분 HIDDEN PICTURE SLIDER 부분 -->
	<div style="display: none;">
		<div id="ninja-slider">
			<div class="slider-inner">
				<ul>
					<c:forEach var="hosListValue" items="${chk_hos_serv_dto.hosList}" varStatus="indexNum">
						<li><a class="ns-img" href="${hosListValue.hos_pic_link}"></a>
							<div class="caption">
								<h3></h3>
								<p>${chk_hos_serv_dto.chk_hos_name }사진${indexNum.index+1}</p>
							</div></li>

					</c:forEach>

				</ul>
				<div id="fsBtn" class="fs-icon" title="Expand/Close"></div>
			</div>
		</div>
	</div>

	<!-- HIDDEN PART : Modal : WHEN SERVICE PICTURE CLICKED -->
	<!-- 건강검진 서비스 사진 눌럿을 시 보여지는 MODAL IMAGE 부분, HIDDEN 부분 -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
					<!-- 건강검진 서비스 설명 DETAIL PICTURE IMAGE 사진 부분  -->
					<%-- 	<c:forEach var="servListValue" items="${chk_hos_serv_dto.servList}"> --%>
					<img style="width: 100%;" id="hidden_servicePic_imgTag" src="">
					<%-- 			</c:forEach> --%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
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
	<!-- 	<script src="resources/js/single-map.js"></script> -->
	<!-- 	<script src="resources/js/map.js"></script> -->
	<script src="resources/js/custom.js"></script>
	<script src="resources/js/ninja-slider8.js"></script>
	<script>
		// html dom 이 다 로딩된 후 실행된다.
		$(document).ready(function() {
			console.log("javascript in hospitalDetails.jsp");
			/* side bar에 있는 GOOGLE MAP 초기 실행 함수 */
			googlemapSingleMarker();
			
			/* SERVICE PICTURE 클릭 시 (건강검진 항목 사진) DYNAMICALLY하게 변하는 MODAL 실행 */
			serviceImageModalChange();
		});
		/* 건강검진 서비스 이미지 동적으로 처리, SERVICE PICTURE MODAL 클릭 시에 동적으로 처리 */
		function serviceImageModalChange(){
	
			/* 클릭하는 MODAL PART A 태그 부분에 이미지 경로를 TITLE 속성으로 담고, 해당 TITLE 속성을 HIDDEN MODAL PART IMG SRC에 삽입해준다. */
			$('#servicePic_modalPart').click(function(event){
			    event.preventDefault();
			    var modal_aTag = $(this);
			    var service_img_src = modal_aTag.attr('tagforjquery');
			    $('#hidden_servicePic_imgTag').attr('src',service_img_src);
			});
			
		}
		
		
		//닌자 슬라이드 시작 - 클릭시 MODAL GALLERY SHOW
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
		//닌자 슬라이드 끝 - 클릭시 MODAL GALLERY SHOW

		// googlemapSingleMarker() started
		function googlemapSingleMarker() {
			var id = document.getElementById('map-canvas');
			if (id) {
				console.log('this is hospitalDetails.js id()');
				initMap();
			}

		}

		function initMap() {
			console.log('this is hospitalDetails.js initMap()');
			var myLatLng = {
				lat : parseFloat('${chk_hos_serv_dto.chk_loc_lat}'),
				lng : parseFloat('${chk_hos_serv_dto.chk_loc_lng}')

			};
			var lat2 = 151.23300;
			typeof lat2;
			var map = new google.maps.Map(
					document.getElementById('map-canvas'), {
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
		

		
		
	</script>

</body>

</html>



