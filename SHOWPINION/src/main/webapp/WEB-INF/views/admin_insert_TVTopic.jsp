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
	<c:set var="user" value="${pageContext.request.userPrincipal.name}" />

	<!-- HEADER FILE INCLUDE  -->
	<jsp:include page="admin_header.jsp"></jsp:include>
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h4>새로운 TV토론 주제 입력하기</h4>
				</div>
				<div class="col-sm-6 hidden-xs text-right">
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li>Blank</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>
	<form role="form" id="tvtopic_insert_form" method="post" enctype="multipart/form-data" action="tvshowtopic_insert_process">
		<div class="container">

			<div class="center-heading" style="text-align: center">
				<h2>
					주제 제목 <input class="form-control" id="tvtopic_name_input" placeholder="TV토론 주제 제목" name="tvtopic_name_input" type="text" style="width: 80%; margin: 0 auto;">
				</h2>
				<span class="center-line"></span>
			</div>


			<div class="row">
				<div class="col-md-8">
					<div class="blog-post">
						<ul class="list-inline post-detail">
							<li><i class="fa fa-user"></i><a href="#" data-toggle="tooltip" data-placement="top" title="본 주제에 대하여 정리를 해주신 jjunest 님께 깊은 감사를 드립니다. "><span>작성자:</span>${user}</a> <input type="hidden"
								name="writer_name" value="${user}"></li>
						</ul>
						<div class="divide30"></div>
						<h3 class="heading">문제 상황</h3>
						<p>
							<textarea id="tvtopic_situation_desc" name="tvtopic_situation_desc" rows="10" cols="80" style="margin: 0 auto"></textarea>
						</p>
						<div class="divide50"></div>
						<h3 class="heading">찬성 반대 근거</h3>
						<div class="row">
							<div class="col-sm-6 margin30">
								<div class="grid-boxed" data-toggle="tooltip" data-placement="top" title="찬성측 주요 근거" style="border: 4px solid #59df57; border-radius: 5px;">
									<h4>30자 찬성 측 주요 근거</h4>
									<p>
										찬성1.<input class="form-control" id="tvtopic_pro1_input" name="tvtopic_pro1_input" placeholder="찬성측 근거" type="text" maxlength="32">
									</p>
									<p>
										찬성2.<input class="form-control" id="tvtopic_pro2_input" name="tvtopic_pro2_input" placeholder="찬성측 근거" type="text" maxlength="32">
									</p>
									<p>
										찬성3.<input class="form-control" id="tvtopic_pro3_input" name="tvtopic_pro3_input" placeholder="찬성측 근거" type="text" maxlength="32">
									</p>
								</div>
							</div>
							<div class="col-sm-6 margin30">
								<div class="grid-boxed" data-toggle="tooltip" data-placement="top" title="반대측 주요 근거" style="border: 4px solid #59df57; border-radius: 5px;">
									<h4>30자 반대 측 주요 근거</h4>
									<p>
										반대1.<input class="form-control" id="tvtopic_con1_input" name="tvtopic_con1_input" placeholder="반대측 근거" type="text" maxlength="32">
									</p>
									<p>
										반대2.<input class="form-control" id="tvtopic_con2_input" name="tvtopic_con2_input" placeholder="반대측 근거" type="text" maxlength="32">
									</p>
									<p>
										반대3.<input class="form-control" id="tvtopic_con3_input" name="tvtopic_con3_input" placeholder="반대측 근거" type="text" maxlength="32">
									</p>
								</div>
							</div>
						</div>
						<div style="text-align: center">
							<a href="#" id="tvtopic_submit" class="btn btn-theme-bg btn-ico btn-lg" style="width: 90%; margin: 5px">TV토론 주제 등록하기 <i class="fa fa-pencil-square-o"></i></a>
						</div>
					</div>
					<!--blog post-->

				</div>
				<!--col-->
				<div class="col-md-3 col-md-offset-1">
					<div class="row">
						<div class="col-md-12 margin20">
							<div class="team-wrap">
								<input type="file" id="tvtopic_tvshow_img" name="tvtopic_tvshow_img" />
								<div class="img_wrap">
									<img id="preview_img" style="margin: 0 auto;" class="img-responsive">
								</div>
								<h4>
									방송이름 <select class="selectpicker" data-width="100%" id="tvtopic_tvshow_name" name="tvtopic_tvshow_name" style="width: 80%">
										<option value = "tvshowname_ssul">썰전</option>
										<option value = "tvshowname_100min">100분 토론</option>
										<option value = "tvshowname_gangJuk">강적들</option>
									</select>
								</h4>
								<span>방영 날짜<input type="date" class="form-control" id="tvtopic_tvshow_date" name="tvtopic_tvshow_date" style="width: 80%; margin: 0 auto;"></span>
								<p>방송 설명</p>
								<textarea style="width: 90%" rows="7" id="tvtopic_tvshow_desc" name="tvtopic_tvshow_desc"></textarea>
							</div>
							<!--team-wrap-->
						</div>
					</div>
				</div>
				<!--row for blog post-->
			</div>
		</div>
		<!--blog full main container-->
		<div class="divide60"></div>
	</form>

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

	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	<!-- multipart 폼을 AJAX로 처리하기 위한 제이ㅝ리 -->
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<!-- 부트스트랩 SLIDER SELECTOR를 위한 자바스크립트 추가  -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/bootstrap-slider.min.js"></script>
	<!-- 부트스트랩 CUSTOM-SELECTOR 를 위한 자바스크립트 추가  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
			//chkeditor 를 위한 세팅, 이미지 업로드 나중에 필요하다. 
			ckeditorSetting();
			//tv쇼 프로그램 이미지 업로드 시 미리보기
			tvshow_image_previewSetting();
			//새로운 글 등록 버튼 클릭 시, AJAX로 글 데이터 입력
			submitButtonClick();

		});

		function submitButtonClick() {
			$("#tvtopic_submit").click(function(event) {
				console.log('this is submit BT');
				//1. 필수 입력부분 empty 인지 확인하기
				var checkingInputOk = inputTagsCheckingOk();

				if (checkingInputOk) {
					//에디터 내용 가져옴
					var tvtopic_desc_content = CKEDITOR.instances.tvtopic_situation_desc.getData();
					// If you want to add an extra field for the FormData
					console.log('this is submit BT3');

					$('#tvtopic_insert_form').ajaxForm({
						url : "${pageContext.request.contextPath}/tvshowtopic_insert_process",
						enctype : "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
						data : {
							"tvtopic_desc_content" : tvtopic_desc_content
						},

						processData : false,
						contentType : false,
						success : function(result) {
							if (result == "success") {
								alert('성공적으로 글이 등록 되었습니다.');
							} else {
								alert('토론주제 등록 실패하였습니다. 지속적으로 문제 발생 시 연락부탁드립니다. 010-7272-9771');
							}
						}

					}).submit();
					/* $("#tvtopic_insert_form").submit();

					$.ajax({
						type : "POST",
						enctype : "multipart/form-data",
						url : "${pageContext.request.contextPath}/tvshowtopic_insert_process",
						processData : false,
						contentType : false,
						cache : false,
						success : function(data) {
							if (data == "success") {
								alert('성공적으로 글이 등록 되었습니다.');
							} else {
								alert('토론주제 등록 실패하였습니다. 지속적으로 문제 발생 시 연락부탁드립니다. 010-7272-9771');
							}
						},
						error : function(e) {
							alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771');
						}
					}); */
				}

			});
		}
		function inputTagsCheckingOk() {

			//1. 필수입력 inputtag들이 전부 입력되 있나 확인
			if ($("#tvtopic_name_input").val().trim() == "") {
				alert("반드시 토론 주제 제목을 입력하셔야 합니다.");
				$("#tvtopic_name_input").focus();
				return false;
			} else if ($("#tvtopic_pro1_input").val().trim() == "") {
				alert("반드시 찬성 측 주요 근거가 한가지는 있어야 합니다");
				$("#tvtopic_pro1_input").focus();
				return false;
			} else if ($("#tvtopic_con1_input").val().trim() == "") {
				alert("반드시 반대 측 주요 근거가 한가지는  있어야 합니다");
				$("#tvtopic_con1_input").focus();
				return false;
			} else if ($("#tvtopic_tvshow_name").val().trim() == "") {
				alert("반드시 방송 이름은 있어야 합니다.");
				$("#tvtopic_tvshow_name").focus();
				return false;
			}

			return true;
		}
		function tvshow_image_previewSetting() {

			$("#tvtopic_tvshow_img").on("change", handleImgFileSelectPreview);
		}

		function handleImgFileSelectPreview(e) {

			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {

					alert("이미지 확장자만 업로드가 가능합니다");
				}
				sel_file = f;

				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preview_img").attr("src", e.target.result);

				}
				reader.readAsDataURL(f);
			});

		}

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/coinCalendar") != -1) {
				$("#navmenu_coinCalendar").css("color", "#39a1f4");
			}

		}

		function ckeditorSetting() {
			CKEDITOR.replace('tvtopic_situation_desc', {//해당 이름으로 된 textarea에 에디터를 적용
				width : '100%',
				height : '400px',
			//filebrowserImageUploadUrl : '${pageContext.request.contextPath}/coininfoboard/imageUpload' //여기 경로로 파일을 전달하여 업로드 시킨다.
			});
			CKEDITOR.on('dialogDefinition', function(ev) {
				var dialogName = ev.data.name;
				var dialogDefinition = ev.data.definition;

				switch (dialogName) {
				case 'image': //Image Properties dialog
					//dialogDefinition.removeContents('info');
					dialogDefinition.removeContents('Link');
					dialogDefinition.removeContents('advanced');
					break;
				}
				var tab, field, dialogName = ev.data.name, dialogDefinition = ev.data.definition;
				if (dialogName == 'image') {
					var infoTab = dialogDefinition.getContents('info');

					txtWidth = infoTab.get('txtWidth');
					txtWidth['default'] = 550;
				}
			});

		}
	</script>
</body>

</html>
