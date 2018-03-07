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
<!-- bootstrap SLIDER 라이브러리 CSS 추가 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/css/bootstrap-slider.min.css" rel="stylesheet" type="text/css">
<!-- bootsstrap SELECT 라이브러리 CSS 추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
<!-- 내가 만든 custom css 파일 첨부 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jjunest.css">
<!-- 랭킹을 위한 데이터 테이블 -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

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
	<!-- HEADER FILE INCLUDE  -->
	<jsp:include page="navbar_header.jsp"></jsp:include>
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h4>자유게시판</h4>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>

	<div class="container">
		<div class="row">
			<form class="form-inline" id="frmSearch" action="${pageContext.request.contextPath}/boardList">
				<input type="hidden" id="startPage" name="startPage" value="">
				<!-- 페이징을 위한 hidden타입 추가 -->
				<input type="hidden" id="visiblePages" name="visiblePages" value="">
				<!-- 페이징을 위한 hidden타입 추가 -->
				<div align="center">
				<button id="write" name="write" type="button" style="font-size: 15px; height: 100%; width: 80%" class="btn btn-primary  btn-md">게시글 작성하기</button>
				<br>
					<c:forEach var="boardList" items="${boardList}" varStatus="status">
						<div class="row" style="text-align: center; background: #F5F5F5; margin: 4px; font-size: 18px; ">
							<div class="col-sm-6 whitespace">
							   <a name="subject" class="mouseOverHighlight" content_id="${boardList.id}">${boardList.subject}</a>
							</div>
							<div class="col-sm-6" style="text-align: right; padding:5px; font-size:14px"> <i class="fas fa-user"></i>  &nbsp ${boardList.writer} &nbsp </div>
						</div>
					</c:forEach>
					<br>
					<div id="pagination"></div>


				</div>
			</form>


		</div>
	</div>

	<div class="divide80"></div>
	<div class="divide80"></div>
	<div class="divide80"></div>
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
	<!-- 구글 차트를 위한 스크립트 추가 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<!-- multipart 폼을 AJAX로 처리하기 위한 제이ㅝ리 -->
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<!-- 부트스트랩 SLIDER SELECTOR를 위한 자바스크립트 추가  -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/bootstrap-slider.min.js"></script>
	<!-- 부트스트랩 CUSTOM-SELECTOR 를 위한 자바스크립트 추가  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	<!-- multipart 폼을 AJAX로 처리하기 위한 제이ㅝ리 -->
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<!-- fa class 추가  -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<!-- DataTable 테이블 랭킹을 위한 자바스크립트 CDN -->
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
		});

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/boardList") != -1) {
			
				$("#navmenu_boardList").css("color", "#39a1f4");

			}

		}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {

			//--페이지 셋팅
			var totalPage = ${totalPage}; //전체 페이지
			var startPage = ${startPage}
			; //현재 페이지

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

			//전체 페이지 수를 받아 돌린다.
			for (var i = forStart; i <= forEnd; i++) {
				if (startPage == i) {
					pagination += ' <button name="page_move" start_page="'+i+'" disabled>' + i + '</button>';
				} else {
					pagination += ' <button name="page_move" start_page="'+i+'" style="cursor:pointer;" >' + i + '</button>';
				}
			}

			//하단 페이지 부분에 붙인다.
			$("#pagination").append(pagination);
			//--페이지 셋팅

			$("a[name='subject']").click(function() {

				location.href = "${pageContext.request.contextPath}/boardView?id=" + $(this).attr("content_id");

			});

			$("#write").click(function() {
				location.href = "${pageContext.request.contextPath}/boardEdit";
			});

			$(document).on("click", "button[name='page_move']", function() {

				var visiblePages = 10;//리스트 보여줄 페이지

				$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
				$('#visiblePages').val(visiblePages);

				$("#frmSearch").submit();

			});

		});
	</script>


</body>
</html>