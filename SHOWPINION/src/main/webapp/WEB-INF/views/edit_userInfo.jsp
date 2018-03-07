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
					<h4>나의 프로필 수정</h4>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>
	<div class="container">
		<div class="row">
			<form role="form" id="editForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/edit_userInfo_process">
				<!-- 숨겨진 부분에 같이 보내야할 정보들: tv쇼 주제 rcdno, tv쇼 타이틀, 작가 아이디,  -->
				<input type="hidden" name="user_rcdno" value="${userInfomation.rcdno}"> <input type="hidden" name="picUrl" value="${userInfomation.sp_user_picUrl}"> <input type="hidden"
					name="picOriname" value="${userInfomation.sp_user_picOriname}"> <input type="hidden" name="picByte" value="${userInfomation.sp_user_picByte}">


				<div class="col-md-12">
					<div class="row">
						<div class="col-md-2" style="text-align: center; margin: 0 auto;">
							<img id="user_img_preview" name="user_img_preview" src="${pageContext.request.contextPath}/${userInfomation.sp_user_picUrl}" class="img-responsive" alt=""
								style="border-radius: 50%; width: 120px; height: 120px; display: inline;"> <input type="file" id="user_img" name="user_img" />
						</div>
						<div class="col-md-10">

							<div class="form-group">
								<label for="exampleInputEmail1">이름</label> : ${userInfomation.realname}
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">닉네임</label> <input type="text" class="form-control" maxlength="30" name="edit_nickname" id="edit_nickname" value=" ${userInfomation.nickname}"> <label>
								</label>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">한줄 소개</label> <input type="text" class="form-control" maxlength="50" name="edit_user_self_intro" id="edit_user_self_intro"
									value=" ${userInfomation.user_self_intro}"> <label> </label>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">이름과 닉네임 중 활동하실 아이디</label> <select class="form-control" name="edit_open_name" id="edit_open_name">
									<c:if test="${userInfomation.openname eq '이름'}">
										<option>이름</option>
										<option>닉네임</option>
									</c:if>
									<c:if test="${userInfomation.openname eq '닉네임'}">
										<option>닉네임</option>
										<option>이름</option>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">소속</label> <input type="text" class="form-control" maxlength="30" name="edit_group" id="edit_group" value="${userInfomation.groupname}"> <label>
									<c:if test="${empty userInfomation.groupname_open}">
										<input type="checkbox" id="edit_group_open" name="edit_group_open">
									</c:if> <c:if test="${userInfomation.groupname_open eq 'on'}">
										<input type="checkbox" id="edit_group_open" name="edit_group_open" checked>
									</c:if> 소속을 공개하시겠습니까?
								</label>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">개인 SNS 또는 블로그</label> <input type="text" class="form-control" name="edit_sns" id="edit_sns" value="${userInfomation.sns}"> <label> <c:if
										test="${empty userInfomation.sns_open}">
										<input type="checkbox" id="edit_sns_open" name="edit_sns_open">
									</c:if> <c:if test="${userInfomation.sns_open eq 'on'}">
										<input type="checkbox" id="edit_sns_open" name="edit_sns_open" checked>
									</c:if> 개인 SNS 및 블로그 주소를 공개하시겠습니까?
								</label>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">* 비밀번호</label> <input type="password" class="form-control" name="edit_password" id="edit_password" placeholder="비밀번호">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">* 비밀번호 확인</label> <input type="password" class="form-control" name="edit_password_check" id="edit_password_check" placeholder="비밀번호 재입력">
							</div>
							<div style="text-align: center; margin: 8px">
								<button type="submit" id="edit_submit" class="btn btn-theme-bg" style="width: 80%">회원정보 수정하기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="divide60"></div>



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

	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
			//edit 버튼을 클릭시 발생하는 일들..
			submitButtonClick();
			//유저 프로필 이미지 프리뷰
			image_previewSetting();
		});

		function image_previewSetting() {

			$("#user_img").on("change", handleImgFileSelectPreview);
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
					$("#user_img_preview").attr("src", e.target.result);

				}
				reader.readAsDataURL(f);
			});

		}

		function submitButtonClick() {
			$("#edit_submit").click(function(event) {
				event.preventDefault();
				//1. 필수 입력부분 확인하기 - 비밀번호 체크
				var checkingInputOk = inputTagsCheckingOk();
				if (checkingInputOk) {
					// multipart는 아작스 폼으로 넘기자
					$('#editForm').ajaxForm({
						url : "${pageContext.request.contextPath}/edit_userInfo_process",
						enctype : "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
						data : {},
						processData : false,
						contentType : false,
						success : function(result) {
							if (result == "success") {
								alert('성공적으로 정보가 수정 되었습니다.');
								var userRcdno = "${userInfomation.rcdno}";
								location.href = "${pageContext.request.contextPath}/userInfo?user_rcdno="+userRcdno;
							} else {
								alert('토론주제 등록 실패하였습니다. 지속적으로 문제 발생 시 연락부탁드립니다. 010-7272-9771');
							}
						}

					}).submit();

				}

			});

		}
		function inputTagsCheckingOk() {
			if ($("#edit_password").val().trim() == "") {
				alert("반드시 비밀번호를 입력하셔야 합니다.");
				$("#edit_password").focus();
				return false;
			}
			if ($("#edit_password_check").val().trim() == "") {
				alert("반드시 비밀번호를 입력하셔야 합니다.");
				$("#edit_password_check").focus();
				return false;
			}

			//4. 비밀번호 같은지 확인
			var pwd = $("#edit_password").val();
			var pwd1 = $("#edit_password_check").val();
			if (pwd != pwd1) { //	비밀번호 와 비밀번호 확인이 다르다면 ... 
				alert('비밀번호 두 개가 일치하지 않습니다. 정확히 비밀번호를 입력해주세요.');
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
