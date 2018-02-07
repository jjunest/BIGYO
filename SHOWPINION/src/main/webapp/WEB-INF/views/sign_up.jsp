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
					<h4>로그인 및 회원가입</h4>
				</div>
				<div class="col-sm-6 hidden-xs text-right">
					<ol class="breadcrumb">
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
				<div class="login-form">
					<h3>
						회원가입 <span> <a href="${pageContext.request.contextPath}/login_custom">& 로그인</a></span>
						<c:if test="${param.ng != null}">
							<p style="color: red">
								* 회원가입에 실패했습니다. 다시 한번 시도해주세요. 지속적 문제 발생시 010 7272 9771로 연락주시면 해결해 드리겠습니다.<br />
							</p>
						</c:if>
					</h3>
					<form role="form" id="signUpForm" action="${pageContext.request.contextPath}/signup_process">
						<div class="row">

							<div class="col-md-8">
								<div class="form-group">
									<label for="exampleInputEmail1">* 이메일 주소</label> <input type="email" class="form-control" maxlength="30" name="signup_email" id="signup_email" placeholder="본인의 이메일을 적어주세요. 이메일은 로그인 시 사용됩니다.">
								</div>
							</div>
							<div class="col-md-4" style="">
								<button type="button" class="btn btn-theme-bg" id="idMultipleCheck">이메일 중복 확인</button>
								<p id="email_dupcheck_result"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">* 이름</label> <input type="text" class="form-control" maxlength="10" name="signup_realname" id="signup_realname" placeholder="이름"> <label> </label>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">* 닉네임</label> <input type="text" class="form-control" maxlength="10" name="signup_nickname" id="signup_nickname" placeholder="닉네임"> <label> </label>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">* 이름과 닉네임 중 활동하실 아이디</label> <select class="form-control" name="open_name" id="open_name">
								<option>이름</option>
								<option>닉네임</option>
							</select> <label> </label>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">소속</label> <input type="text" class="form-control" name="signup_group" id="signup_group" placeholder="소속 (예시- OO대학교)"> <label> <input
								type="checkbox" id="signup_group_open" name="signup_group_open" checked> 소속을 공개하시겠습니까?
							</label>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">개인 SNS 또는 블로그</label> <input type="email" class="form-control" name="signup_sns" id="signup_sns" placeholder="Enter email"> <label> <input
								type="checkbox" id="signup_sns_open" name="signup_sns_open" checked> 개인 SNS 및 블로그 주소를 공개하시겠습니까?
							</label>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">* 비밀번호</label> <input type="password" class="form-control" name="signup_password" id="signup_password" placeholder="비밀번호">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">* 비밀번호 확인</label> <input type="password" class="form-control" name="signup_password_check" id="signup_password_check" placeholder="비밀번호 재입력">
						</div>

						<div class="form-group col-xs-12">
							<div class="checkbox">
								<label> <input type="checkbox" id="agreeCheckbox_personalInfo" name="agreeCheckbox_personalInfo"> <a href="#" style="color: blue">개인정보 취급 방침</a>에 동의합니다.
								</label>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox" id="agreeCheckbox_serviceUse" name="agreeCheckbox_serviceUse"> <a href="#" style="color: blue">쇼피니언(서비스) 이용 약관</a>에 동의합니다.
								</label>
							</div>
						</div>


						<div style="text-align: center; margin: 8px">
							<button type="submit" id="signup_submit" class="btn btn-theme-bg" style="width: 80%">쇼피니언 회원가입하기</button>
						</div>

					</form>
				</div>
			</div>
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
	<script type="${pageContext.request.contextPath}/resources/text/javascript" src="js/jquery.sticky.js"></script>
	<!--flex slider plugin-->
	<script src="${pageContext.request.contextPath}/resources//js/jquery.flexslider-min.js" type="text/javascript"></script>
	<!--parallax background plugin-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js" type="text/javascript"></script>


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




	<!--customizable plugin edit according to your needs-->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js" type="text/javascript"></script>


	<script type="text/javascript">
		$(document).ready(function() {

			//2. 이메일 중복 확인
			//2-1. 이메일 형식 확인
			//2-2. 이메일 중복 확인
			idDuplicateCheckBTClick();

			//4. 쇼피니언 회원가입 버튼 (input tag 확인) -> 로그인 페이지로 이동
			submitButtonClick();

		});
		//전역변수
		var email_dup_check_ok = false;
		var email_dup_check_id = "";

		function submitButtonClick() {
			$("#signup_submit").click(function(event) {
				event.preventDefault();
				//1. 필수 입력부분 empty 인지 확인하기
				var checkingInputOk = inputTagsCheckingOk();
				if (checkingInputOk) {
					//빈칸 없이 잘 되었다.
					var formData = $("#signUpForm").serialize();
					//회원 가입 아작스 시작 

					var emailInput = $("#signup_email").val();
					msg = "등록된 이메일 주소를 다시 한 번 확인해주세요.\n입력 하신 이메일 주소는 " + emailInput + "입니다.\n정확하게 이메일을 확인하셨습니까?";
					if (confirm(msg) == 0) {
						// Yes click
					} else {
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/signup_process",
							data : formData + "&email_dup_check_id=" + email_dup_check_id,
							success : function(data) {

								if (data == "success") {
									alert('성공적으로 회원가입이 되었습니다.');
									location.href="${pageContext.request.contextPath}/login_custom";

								} else {
									alert('회원 가입이 실패하였습니다! 다시 한번 시도해주십시오. 지속적으로 문제 발생 시 연락부탁드립니다. 010-7272-9771');
								}

							},
							error : function(e) {
								alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771');
							}
						});
					}
				}

			});

		}

		function inputTagsCheckingOk() {
			//1. 필수입력 inputtag들이 전부 입력되 있나 확인
			if (!email_dup_check_ok) {
				alert("이메일 중복 확인이 필요합니다.");
				return false;
			} else if ($("#signup_realname").val().trim() == "") {
				alert("이름을 제대로 입력해 주세요.");
				$("#signup_realname").focus();
				return false;
			} else if ($("#signup_nickname").val().trim() == "") {
				alert("닉네임을 제대로 입력해 주세요.");
				$("#signup_nickname").focus();
				return false;
			} else if ($("#signup_password").val().trim() == "") {
				alert("비밀번호 부분을 제대로 입력해 주세요.");
				$("#signup_password").focus();
				return false;
			} else if ($("#signup_password_check").val().trim() == "") {
				alert("비밀번호 확이 부분을 제대로 입력해 주세요.");
				$("#signup_password_check").focus();
				return false;
			}

			//3. 아이디 중복 확인 체크 (Ajax)
			if (email_dup_check_ok == false) {
				alert('이메일 중복 체크를 해주세요');
				return false;
			}

			//4. 비밀번호 같은지 확인
			var pwd = $("#signup_password").val();
			var pwd1 = $("#signup_password_check").val();
			if (pwd != pwd1) { //	비밀번호 와 비밀번호 확인이 다르다면 ... 
				alert('비밀번호 두 개가 일치하지 않습니다. 정확히 비밀번호를 입력해주세요.');
				return false;
			}

			if ($('input:checkbox[id="agreeCheckbox_personalInfo"]').is(":checked") == true) {

			} else {
				alert('개인정보 취급 방침에 동의를 해주세요');
				return false;
			}

			if ($('input:checkbox[id="agreeCheckbox_serviceUse"]').is(":checked") == true) {

			} else {
				alert('쇼피니언(서비스) 이용 약관에 동의를 해주세요');
				return false;
			}

			return true;

		}

		function idDuplicateCheckBTClick() {
			//이메일 형식 체크 regex;
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			$("#idMultipleCheck").click(function(event) {
				var userIdInputValue = $("#signup_email").val().trim();
				if (userIdInputValue == "") {
					alert("이메일 입력이 안되있습니다. 아이디로 사용하실 이메일을 입력해주세요.");
					$("#signup_email").focus();
				} else if (regex.test(userIdInputValue) === false) {
					alert("잘못된 이메일 형식입니다.");
					$("#signup_email").focus();
				} else {
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/duplicateIdCheck",
						data : {
							"userIdInputValue" : userIdInputValue
						},
						success : function(data) {
							if (data == "success") {
								$("#email_dupcheck_result").css("color", "green");
								$("#email_dupcheck_result").text("사용 가능한 이메일입니다.");
								email_dup_check_id = userIdInputValue;
								email_dup_check_ok = true;

							} else {
								$("#signup_email").focus();
								$("#email_dupcheck_result").css("color", "red");
								$("#email_dupcheck_result").html("이미 등록된 이메일입니다." + "<br>" + "다른 이메일을 사용해 주세요");
								email_dup_check_ok = false;
							}

						},
						error : function(e) {
							alert('오류가 발생했습니다. 아래 연락처로 문제 상황을 말씀해주시기 바랍니다: 010-7272-9771');
							email_dup_check_ok = false;
							$("#email_dupcheck_result").text("확인");
						}
					});

				}
			});

		}
	</script>
</body>

</html>
