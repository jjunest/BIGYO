<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

<!-- SITE TITTLE -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>준비트 홈페이지</title>

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
  
  <style>
#footer {
margin-top:-1.9em;height:200px;
}
</style>

</head>
<%
	request.setCharacterEncoding("UTF-8");
%>

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
						<h2>회원 가입</h2>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section class="clearfix signUpSection">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-xs-12">
					<div class="signUpFormArea">
						<div class="priceTableTitle">
							<h2>회원 가입 하기</h2>
						</div>
						<c:if test="${param.ng != null}">
							<p style="color: red">
								* 회원가입에 실패했습니다. 아이디 또는 비밀번호를 확인해주세요.<br />
							</p>
						</c:if>
						<div class="signUpForm">
							<form id="signUpForm" name="signUpForm" action="signUpProcessing" method="post">
								<div class="formSection">
									<h3>기본 정보</h3>
									<div class="row">
										<div class="form-group col-sm-6 col-xs-12">
											<label for="firstName" class="control-label">이름*</label> <input type="text" class="form-control" id="fullNameInput" name="fullNameInput">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="phoneNum" class="control-label">휴대전화* 숫자만 입력해주세요</label> <input type="text" class="form-control" maxlength="13" id="phoneNumInput" name="phoneNumInput">
										</div>
										<div class="form-group col-xs-12">
											<label for="emailAdress" class="control-label">이메일 주소* 비밀번호 분실 시 사용됩니다. 정확한 이메일 주소인지 다시 한번 확인해 주십시오.</label> <input type="email" class="form-control" id="emailInput" name="emailInput">
										</div>
									</div>
								</div>
								<div class="formSection">
									<h3>계정 정보</h3>
									<div class="row">
										<div class="form-group col-sm-6 col-xs-12">
											<label for="usernames" class="control-label">아이디*</label> <input type="text" class="form-control" id="userIdInput" name="userIdInput">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="usernames" class="control-label">아이디 중복 확인</label>
											<button type="button" class="btn btn-primary" id="idMultipleCheck">확인</button>
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="passwordFirst" class="control-label">비밀번호*</label> <input type="password" class="form-control" id="userPwInput" name="userPwInput">
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="passwordAgain" class="control-label">비밀번호 재입력*</label> <input type="password" class="form-control" id="userPwInputAgain" name="userPwInputAgain">
										</div>
									</div>
								</div>
								<div class="formSection">
									<h3>개인정보 제공 동의</h3>
									<div class="row">

										<div class="form-group col-xs-12">
											<div class="checkbox">
												<label> <input type="checkbox" id="agreeCheckbox" name="agreeCheckbox"> I agree to the <a href="terms-of-services.html">Terms of Use</a> & <a href="#">Privacy Policy</a>.
													Your business listing is fully backed by our 100% money back guarantee.
												</label>
											</div>
										</div>
										<div class="form-group col-xs-12 mb0">
											<button type="submit" class="btn btn-primary" id="submitBT">계정 만들기</button>
										</div>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
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
	<script src="resources/js/single-map.js"></script>
	<script src="resources/js/map.js"></script>
	<script src="resources/js/custom.js"></script>
	<script>
		var isMemberDuplicatedChecked = 'N';
		// html dom 이 다 로딩된 후 실행된다.
		$(document).ready(function() {

			//1. 핸드폰 번호 숫자만 입력받게 하기. 길이제한 및 대시 만들기.
			phoneNumberSetting();

			//2. 회원가입 제출 시 inputTag들 확인하기
			submitBTCheckingForm();

			//3. 아이디 중복 체크 버튼 누를 시;
			idDuplicateCheckBTClick();
		});

		function idDuplicateCheckBTClick() {
			$("#idMultipleCheck")
					.click(
							function(event) {
								var userIdInputValue = $("#userIdInput").val()
										.trim();
								if (userIdInputValue == "") {
									alert("아이디 부분을 제대로 입력해 주세요.");
									$("#userIdInput").focus();
								} else {
									$
											.ajax({
												type : "POST",
												url : "${pageContext.request.contextPath}/duplicateIdCheck",
												data : {
													"userIdInputValue" : userIdInputValue
												},
												success : function(data) {

													if (data == "success") {
														alert('사용 가능한 아이디입니다. 회원가입을 진행해 주세요');
														isMemberDuplicatedChecked = 'Y';
														savedDuplicateId = userIdInputValue;
													} else {
														alert('사용 불가능한 아이디입니다. 다른 아이디로 회원가입을 진행해 주세요');
														isMemberDuplicatedChecked = 'N';
													}

												},
												error : function(e) {
													alert('오류가 발생했습니다. 아래 연락처로 문제 상황을 말씀해주시기 바랍니다: 010-7272-9771');
												}
											});

								}
							});

		}
		function submitBTCheckingForm() {

			var checkingResult = "fail";

			$("#submitBT")
					.click(
							function(event) {

								event.preventDefault();
								var emailInput = $("#emailInput").val();
								msg = "등록된 이메일 주소를 다시 한 번 확인해주세요.\n입력 하신 이메일 주소는 "
										+ emailInput+"입니다.\n정확하게 이메일을 확인하셨습니까?";
								if (confirm(msg) == 0) {
									// Yes click
								} else {

									var checkingInputOk = inputTagsCheckingOk();
									if (checkingInputOk) {
										if (isMemberDuplicatedChecked == 'Y') {
											$("#userIdInput").val(
													savedDuplicateId);
											$("#signUpForm").submit();
										} else {
											console
													.log("isMemberDuplicatedChecked의 값:"
															+ isMemberDuplicatedChecked);
											alert('아이디 중복체크를 해주세요 isMemberDuplicatedChecked'
													+ isMemberDuplicatedChecked);
										}

									} else {

									}
								}
							});

			checkingResult = "success";
			return checkingResult;

		}

		function inputTagsCheckingOk() {
			//1. inputTag 들이 전부 차있나 확인
			var checkingResult = false;
			if ($("#fullNameInput").val().trim() == "") {
				alert("이름을 제대로 입력해 주세요.");
				$("#fullNameInput").focus();
				return false;
			} else if ($("#phoneNumInput").val().trim() == "") {
				alert("휴대폰 번호를 제대로 입력해 주세요.");
				$("#phoneNumInput").focus();
				return false;
			} else if ($("#emailInput").val().trim() == "") {
				alert("이메일을 제대로 입력해 주세요.");
				$("#emailInput").focus();
				return false;
			} else if ($("#userIdInput").val().trim() == "") {
				alert("아이디 부분을 제대로 입력해 주세요.");
				$("#userIdInput").focus();
				return false;
			} else if ($("#userPwInput").val().trim() == "") {
				alert("비밀번호 부분을 제대로 입력해 주세요.");
				$("#userPwInput").focus();
				return false;
			} else if ($("#userPwInputAgain").val().trim() == "") {
				alert("비밀번호 부분을 제대로 입력해 주세요.");
				$("#userPwInputAgain").focus();
				return false;
			}

			//2. email 주소 형식 확인
			var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if (!$('#emailInput').val()) {
				alert('이메일주소를 입력 해 주세요');
				$('#emailInput').focus();
				return false;
			} else {
				if (!regExp.test($('#emailInput').val())) {
					alert('이메일 주소가 유효하지 않습니다. abc@def.com와 같은 형식이어야 합니다');
					$('#emailInput').focus();
					return false;
				}
			}
			//3. 아이디 중복 확인 체크 (Ajax)
			if (isMemberDuplicatedChecked == 'N') {
				alert('아이디 중복 체크를 해주세요');
				return false;
			}

			//4. 비밀번호 같은지 확인
			var pwd = $("#userPwInput").val();
			var pwd1 = $("#userPwInputAgain").val();
			if (pwd != pwd1) { //	비밀번호 와 비밀번호 확인이 다르다면 ... 
				alert('비밀번호 두 개가 일치하지 않습니다. 정확히 비밀번호를 입력해주세요.');
				return false;
			}

			if ($('input:checkbox[id="agreeCheckbox"]').is(":checked") == true) {

			} else {
				alert('개인정보 제공 동의를 해주세요');
				return false;
			}

			return true;

		}

		function phoneNumberSetting() {
			$("#phoneNumInput").keyup(function(event) {
				console.log("this is event");
				event = event || window.event;
				var _val = this.value.trim();
				this.value = autoHypenPhone(_val);
			});
		}
		function autoHypenPhone(str) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';
			if (str.length < 4) {
				return str;
			} else if (str.length < 7) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3);
				return tmp;
			} else if (str.length < 11) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 3);
				tmp += '-';
				tmp += str.substr(6);
				return tmp;
			} else {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 4);
				tmp += '-';
				tmp += str.substr(7);
				return tmp;
			}
			return str;
		}

		function phoneNumberCheck(p) {

			p = p.split('-').join('');

			var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;

			return regPhone.test(p);

		}
	</script>
</body>

</html>
