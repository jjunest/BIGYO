<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 나누기의 몫을 정수값으로 구하기 위한 jstl 태그 라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Listsize를 위한 jstl태그라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

<!-- SITE TITTLE -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비트코인 주식 제테크 - 준트</title>


<!-- <link href='../fullcalendar.min.css' rel='stylesheet' />
<link href='../fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='../lib/moment.min.js'></script>
<script src='../lib/jquery.min.js'></script>
<script src='../fullcalendar.min.js'></script>
 -->

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

<!-- 풀캘린더 라이브러리 full calendar -->
<link href='resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />


<!-- CUSTOM CSS -->
<link href="resources/css/style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- INTERNAL CSS STYLE -->
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
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
						<h2>코인 호재 달력</h2>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section>
		<div id="calendar" style="max-width: 70%; font-size: 15px"></div>


<!-- 나만 버튼이 보이도록 하는 코드 시작 -->
<br><br>
<div style = "text-align: center;">	<c:set var="login_username" value="${pageContext.request.userPrincipal.name}" />
						<c:set var="jjunest" value="jjunest" />
						<c:if test="${login_username eq jjunest}">
								<button type="button" class="btn btn-primary btn-lg" id="write" name="write" style="width: 20%; height: 50px; font-size: 25px;">달력 정보 입력 하기</button>
						<br>
						</c:if></div>
					
<!-- 나만 버튼이 보이도록 하는 코드 끝 -->
		</section>

		<section></section>

		<section></section>




<div id="eventContent" title="Event Details" style="display:none;">
   
    <p id="eventInfo"></p>
    <p><strong><a id="eventLink" href="" target="_blank">출처 바로가기 </a></strong></p>
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
	<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	<script src='${pageContext.request.contextPath}/resources/js/moment.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/js/fullcalendar.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/js/locale-all.js'></script>
	<script src='${pageContext.request.contextPath}/resources/js/ko.js'></script>

	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
			calendarEvent();
			
			$("#write").click(function() {
				location.href = "${pageContext.request.contextPath}/coinCalendarWrite";
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

		function calendarEvent(eventData) {

			var result_list = '${result_list}';
			console.log('this is data:' + '${result_list}');

			var eventArray = new Array();
			<c:forEach var="listValue" items="${result_list}">
			var eventObj = new Object();
			eventObj.id = "${listValue.calendar_rcdno}"
			eventObj.title = "${listValue.calendar_title}";
			eventObj.url = "${listValue.calendar_url}";
			eventObj.start = "${listValue.calendar_start}";
			eventObj.end = "${listValue.calendar_end}";
			eventObj.etc1 = "${listValue.calendar_etc1}";
			eventObj.etc2 = "${listValue.calendar_etc2}";
			eventObj.etc3 = "${listValue.calendar_etc3}";
			eventArray.push(eventObj);
			</c:forEach>
			//오늘 날짜 구하기 시작
			var today = new Date();

			var year = today.getFullYear();
			var month = today.getMonth() + 1; // 0부터 시작하므로 1더함 더함
			var day = today.getDate();

			if (("" + month).length == 1) {
				month = "0" + month;
			}
			if (("" + day).length == 1) {
				day = "0" + day;
			}

			var todayDate = year + '-' + month + '-' + day;
			//오늘 날짜 구하기 끝

			$('#calendar').fullCalendar({
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'month,basicWeek,basicDay'
				},
				defaultDate : todayDate,
				lang : "ko",
				navLinks : true, // can click day/week names to navigate views
				editable : true,
				eventLimit : true, // allow "more" link when too many events
				events : eventArray,
				  eventClick:  function(event, jsEvent, view) {
				        //set the values and open the modal
					  $("#startTime").html(moment(event.start).format('MMM Do h:mm A'));
			            $("#eventInfo").html(event.title);
			            if(event.url == ""||event.url==null){
			            	 $("#eventLink").text('');
			            	 console.log('this is url is null');
;			            }else{
			            	 $("#eventLink").attr('href', event.url);
			            	 console.log('this is url is not null');
			            }
			      
			            $("#eventContent").dialog({ modal: true, title: event.title, width:350});
				    }
				
			});
		}
	</script>

</body>

</html>
