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
<title>미투코리아</title>


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
					<h4>미투코리아 언론 보도 리스트</h4>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>

	<div class="container">
		<div class="row">
			<div class="row">
				<div class="dropdown" style="text-align: right; margin-right: 20px; padding-right: 10px">
					<a href="${pageContext.request.contextPath}/me_report_write" class="btn btn-primary" type="button"> 미투코리아에 제보하러 가기 </a>

					<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
						<span id="orderText">최신순 </span><span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
						<li><a href="${pageContext.request.contextPath}/me_article_list?order=new">최신순</a></li>
						<li><a href="${pageContext.request.contextPath}/me_article_list?order=thumbup">추천순</a></li>
					</ul>
				</div>
			</div>
			<br>

			<div class="blog-masonary-wrapper">
				<div class="container mas-boxes">
					<c:forEach var="listValue" items="${articleList}">
						<c:if test="${listValue.m2_report_Aispublic eq 'on' }">
							<c:set var="color" value="#59df57"></c:set>
						</c:if>
						<c:if test="${empty listValue.m2_report_Aispublic}">
							<c:set var="color" value="#cdf5cc"></c:set>
						</c:if>
						<!-- GALLERY ITEM START -->
						<div class="mas-boxes-inner" style="border: 4px solid ${color}; border-radius: 5px;  max-height: 800px;">
							<a href = "${pageContext.request.contextPath}/report_detail?report_rcdno=${listValue.m2_report_rcdno}"><img src="${pageContext.request.contextPath}/${listValue.m2_report_link}" alt="" class="img-responsive"></a>
							<div class="mas-blog-inner">
								<h3 style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									<a href="${pageContext.request.contextPath}/report_detail?report_rcdno=${listValue.m2_report_rcdno}">${listValue.m2_report_title}</a>
								</h3>
								<c:if test="${listValue.m2_report_Aispublic eq 'on' }">
									<div style="font-weight: bold;\">*본 사건의 가해자는 공인입니다.</div>
								</c:if>
								<ul class="list-inline post-detail">
									<li>가해자: <span>${listValue.m2_report_Aname}</span></li>
									<c:if test="${empty listValue.m2_report_Ajob }">
										<li>소속/직업: <span>정보 없음</span></li>
									</c:if>
									<c:if test="${not empty listValue.m2_report_Ajob }">
										<li>소속/직업: <span>${listValue.m2_report_Ajob}</span></li>
									</c:if>
								</ul>
								<p class="txt_post" style="text-align: center">
									<a href="${pageContext.request.contextPath}/report_detail?report_rcdno=${listValue.m2_report_rcdno}">${listValue.m2_report_content}</a>
								</p>
								<!-- 제보자가 자기 정보 공개시 정보 공개 -->
								<ul class="list-inline post-detail">
									<c:if test="${empty listValue.m2_report_Rname }">
										<li>제보자: <span>정보 없음</span></li>
									</c:if>
									<c:if test="${not empty listValue.m2_report_Rname }">
										<li>제보자: <span>${listValue.m2_report_Rname}</span></li>
									</c:if>
								</ul>

								<div style="text-align: right">
									<i class="fas fa-exclamation-circle"></i><a onclick="report_warning(${listValue.m2_report_rcdno});">신고+${listValue.m2_report_warning}</a> <i class="fab fa-meetup"></i><a
										onclick="report_thumbup(${listValue.m2_report_rcdno});">올려+${listValue.m2_report_thumbup}</a> <i class="fas fa-comment-alt"></i><a
										href="${pageContext.request.contextPath}/report_detail?report_rcdno=${listValue.m2_report_rcdno}">댓글보기</a>
								</div>

							</div>
							<!--blog inner-->
						</div>
						<!-- GALLERY ITEM END -->
					</c:forEach>

				</div>
			</div>

		</div>
	</div>



	<div class="divide60"></div>
	<jsp:include page="footer.jsp"></jsp:include>
	<!--scripts and plugins -->
	<!--scripts and plugins -->
	<!--must need plugin jquery-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate.min.js"></script>
	<!--bootstrap js plugin-->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!--easing plugin for smooth scroll-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.min.js" type="text/javascript"></script>
	<!--sticky header-->
	<script type="${pageContext.request.contextPath}/resources/text/javascript" src="js/jquery.sticky.js"></script>
	<!--flex slider plugin-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
	<!--parallax background plugin-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js" type="text/javascript"></script>


	<!--digit countdown plugin-->
	<script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
	<!--digit countdown plugin-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js" type="text/javascript"></script>
	<!--on scroll animation-->
	<script src="${pageContext.request.contextPath}/resources/js/wow.min.js" type="text/javascript"></script>
	<!--owl carousel slider-->
	<script src="${pageContext.request.contextPath}/resources/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
	<!--popup js-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
	<!--masonary js-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.masonry.min.js" type="text/javascript"></script>


	<!--customizable plugin edit according to your needs-->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/masonary-custom.js" type="text/javascript"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();

			orderTextSetting();
			
			$(".txt_post").html();
		});

		function report_warning(report_rcdno) {
			var user = "${pageContext.request.userPrincipal.name}";
			if (user == null || user == "") {
				alert("신고를 하시려면 로그인이 필요합니다");
			} else {
				var objParams = {
					report_rcdno : report_rcdno,
					bywhom : user
				};

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/report_warning",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(data) {
						if (data == "success") {
							alert("정상적으로 신고되었습니다");
							location.reload();
						} else {
							alert("중복 신고입니다.");
						}
					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
						alert("this is");
					}
				});

			}

		}

		function report_thumbup(report_rcdno) {
			var user = "${pageContext.request.userPrincipal.name}";

			if (user == null || user == "") {
				alert("추천을 하시려면 로그인이 필요합니다");

			} else {
				var user = "${pageContext.request.userPrincipal.name}";
				var objParams = {
					report_rcdno : report_rcdno,
					bywhom : user
				};

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/report_thumbup",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(data) {
						if (data == "success") {
							alert("정상적으로 추천되었습니다");
							location.reload();

						} else {
							alert("중복 추천입니다.");
						}
					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
						alert("this is");
					}
				});

			}

		}

		function orderTextSetting() {
			var order = getUrlParameter('order');
			if ( order == 'new') {
				$("#orderText").text("최신순");

			} else if (order == null ||order == 'thumbup') {
				$("#orderText").text("추천순");
			}
		}

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/me_article_list") != -1) {
			
				$("#navmenu_me_article_list").css("color", "#39a1f4");

			}

		}
		function getUrlParameter(sParam) {
			var sPageURL = decodeURIComponent(window.location.search.substring(1)), sURLVariables = sPageURL.split('&'), sParameterName, i;

			for (i = 0; i < sURLVariables.length; i++) {
				sParameterName = sURLVariables[i].split('=');

				if (sParameterName[0] === sParam) {
					return sParameterName[1] === undefined ? true : sParameterName[1];
				}
			}
		};
	</script>
</body>

</html>
