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
<html>



<body class="body-wrapper">
	<div class="page-loader" style="background: url(../resources/img/preloader.gif) center no-repeat #fff;"></div>

	<div class="main-wrapper">
		<!-- HEADER FILE INCLUDE  -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- PAGE TITLE SECTION -->
		<section class="clearfix pageTitleSection bg-image" style="background-image: url(${pageContext.request.contextPath}/resources/img/background/bg-page-title.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="pageTitle">
						<h2>자유게시판</h2>
					</div>
				</div>
			</div>
		</div>
		</section>


		<section>
		<form class="form-inline" id="frmSearch" action="${pageContext.request.contextPath}/freetalkboard/list">
			<input type="hidden" id="startPage" name="startPage" value="">
			<!-- 페이징을 위한 hidden타입 추가 -->
			<input type="hidden" id="visiblePages" name="visiblePages" value="">
			<!-- 페이징을 위한 hidden타입 추가 -->
			<div align="center">
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-10">
						<table width="1200px">

						</table>
						<table class="table table-hover table-striped table-bordered" border="1" width="1200px">
							<tr>
								<th width="3%" style="text-align: center;">No</th>
								<th width="70%" style="text-align: center;">제목</th>
								<th width="10%" style="text-align: center;">작성자</th>
								<th width="10%" style="text-align: center;">작성일</th>
									<th width="7%" style="text-align: center;">추천수</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(boardList) == 0}">
									<tr>
										<td colspan="4" align="center">조회결과가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="boardList" items="${boardList}" varStatus="status">
										<tr id="">
											<td align="center">${boardList.id}</td>
											<td><a name="subject" class="mouseOverHighlight" content_id="${boardList.id}">${boardList.subject}</a></td>
											<td align="center">${boardList.writer}</td>
											<td align="center">${boardList.register_datetime}</td>
											<td align="center" style="text-align: center; vertical-align: middle;">	 ${boardList.good_point}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>


						</table>

						<button type="button" class="btn btn-primary btn-lg" id="write" name="write" style="width: 20%; height: 50px; font-size: 25px;">게시글 작성 하기</button>
						<br>
						<br>
						<br>
						<ul class="pagination" id = "pagination"></ul>
					</div>
					<div class="col-xs-1"></div>
				</div>
				<br>

			</div>
		</form>

		</section>



		<section></section>



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
	<!-- 

	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script> -->
	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
			//--페이지 셋팅
			var totalPage = ${totalPage}; //전체 페이지
			var startPage = ${startPage}; //현재 페이지

			var pagination = "";

			//--페이지네이션에 항상 10개가 보이도록 조절
			var forStart = 0;
			var forEnd = 0;

			if ((startPage - 5) < 1) {
				forStart = 1;
			} else {
				forStart = startPage - 5;
			}

			if (forStart == 1) {

				if (totalPage > 9) {
					forEnd = 10;
				} else {
					forEnd = totalPage;
				}

			} else {

				if ((startPage + 4) > totalPage) {

					forEnd = totalPage;

					if (forEnd > 9) {
						forStart = forEnd - 9
					}

				} else {
					forEnd = startPage + 4;
				}
			}
			//--페이지네이션에 항상 10개가 보이도록 조절
			console.log('this is pageNa andforStart:' + forStart + 'and forEnd:' + forEnd);
			//전체 페이지 수를 받아 돌린다.
			for (var i = forStart; i <= forEnd; i++) {
				console.log('this is pageNa andforStart:' + forStart + 'and forEnd:' + forEnd);
				if (startPage == i) {
				/* 	 pagination += ' <button name="page_move" start_page="'+i+'" disabled>' + i + '</button>';  */
				
					 pagination += ' <li name="page_move" start_page="'+i+'" disabled><a >' + i + '</a></li>';  
				} else {
			/* 		pagination += ' <button name="page_move" start_page="'+i+'" style="cursor:pointer;" >' + i + '</button>';  */
					  pagination += ' <li name="page_move" start_page="'+i+'" disabled style="cursor:pointer;"><a >' + i + '</a></li>';  
				}
			}

			//하단 페이지 부분에 붙인다.
			$("#pagination").append(pagination);
			//--페이지 셋팅

			$("a[name='subject']").click(function() {

				location.href = "${pageContext.request.contextPath}/freetalkboard/view?id=" + $(this).attr("content_id");

			});

			$("#write").click(function() {
				location.href = "${pageContext.request.contextPath}/freetalkboard/edit";
			});

			$(document).on("click", "li[name='page_move']", function() {

				var visiblePages = 10;//리스트 보여줄 페이지

				$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
				$('#visiblePages').val(visiblePages);

				$("#frmSearch").submit();

			});

		});

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/freetalkboard") != -1) {

				$("#navmenu_freetalkboard").css("color", "#39a1f4");

			}

		}
	</script>


</body>
</html>