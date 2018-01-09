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
						<h2>코인호재 달력 입력</h2>
					</div>
				</div>
			</div>
		</div>
		</section>


		<!-- DASHBOARD ORDERS SECTION -->
		<section class="clearfix bg-dark listingSection">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<form id="insertHospitalForm" action="#" method="post" class="listing__form" enctype="multipart/form-data">
						<div class="dashboardPageTitle text-center">
							<h2>코인호재 달력 입력</h2>
						</div>
						<div class="dashboardBoxBg mb30">
							<div class="profileIntro paraMargin">
								<h3>코인 호재 달력 정보 삽입</h3>
								<div class="row">


									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">코인 호재 내용 (필수)</label> <input type="text" class="form-control" id="coinCalendar_title"  name="coinCalendar_title" placeholder="코인 호재 내용">
									</div>
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">코인 호재 출처</label> <input type="text" class="form-control" id="coinCalendar_url" name="coinCalendar_url" placeholder="코인 호재 출처">
									</div>

									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">코인 호재 시작 날짜 (필수)</label> <input type="date" class="form-control" id="coinCalendar_start_date" name="coinCalendar_start_date" placeholder="코인 호재 시작 날짜">
									</div>

									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">코인 호재 끝 날짜</label> <input type="date" class="form-control" id="coinCalendar_end_date" name="coinCalendar_end_date" placeholder="코인 호재 끝 날짜">
									</div>

								</div>
							</div>
						</div>




						<div class="form-footer text-center">
							<button id="submitbutton" type="submit" class="btn-submit">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		</section>









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
			subitButtonSetting();
			inputEmptyCheck();
		});
		
		function subitButtonSetting(){
			$("#submitbutton").click(function(e){
				e.preventDefault();
				console.log('this is submitbutton clicked');
				var coinCalendar_title = $('#coinCalendar_title').val();
				var coinCalendar_url = $('#coinCalendar_url').val();
				var coinCalendar_start_date = $('#coinCalendar_start_date').val();
				var coinCalendar_end_date = $('#coinCalendar_end_date').val();
				
				var inputCheckIsOkay = inputEmptyCheckOk();
				if(inputCheckIsOkay){
					  //JSON 데이터로 만들기
			          var coinCalendarArray = new Array();
			              
			          var coinCalendarInfo = new Object();
			            
			          coinCalendarInfo.title = coinCalendar_title;
			          coinCalendarInfo.url = coinCalendar_url;
			          coinCalendarInfo.start_date = coinCalendar_start_date;
			          coinCalendarInfo.end_date = coinCalendar_end_date;
			          coinCalendarArray.push(coinCalendarInfo);
			          var totalInfo = new Object();
			          totalInfo.coinCalendar = coinCalendarArray;
			          var jsonInfo = JSON.stringify(totalInfo);
			          console.log(jsonInfo); //브라우저 f12개발자 모드에서 confole로 확인 가능
			   
			          
			          
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/coinCalendarInsertProcessing",
						data : {
							"jsonInfo" : jsonInfo
						},
						success : function(data) {
							if(data=="success"){
								alert('코인 호재 달력에 정보 저장을 성공하였습니다.');
								//입력값 초기화 
								 $('#coinCalendar_title').val('');
								 $('#coinCalendar_url').val('');
								 $('#coinCalendar_start_date').val('');
								 $('#coinCalendar_end_date').val('');
							}
						
							
						},
						error : function(e) {
							console.log("coinCalendarInsertProcessing ajax 실패! ");
							alert('오류가 발생했습니다. 아래 연락처로 문제 상황을 말씀해주시기 바랍니다: 010-7272-9771');
						}
					});
					
				}else{
					
				}
			
				
		      
			  });
			
		}

		function inputEmptyCheckOk(){
			
			var coinCalendar_title = $('#coinCalendar_title').val();
			var coinCalendar_url = $('#coinCalendar_url').val();
			var coinCalendar_start_date = $('#coinCalendar_start_date').val();
			var coinCalendar_end_date = $('#coinCalendar_end_date').val();
			
			 if($("#coinCalendar_title").val().trim() == ""){
             	alert("호재 내용을 입력하세요.");
             	$("#coinCalendar_title").focus();
             	return false;
             }
     		
             
             if($("#coinCalendar_start_date").val().trim() == ""){
             	alert("시작 날짜를 입력하세요.");
             	$("#coinCalendar_start_date").focus();
             	return false;
             }
             
             return true;
			
		}
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
