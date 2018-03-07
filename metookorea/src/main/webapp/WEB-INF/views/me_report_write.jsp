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

<style>
.mouseOverHighlight {
	border-bottom: 1px solid blue;
	cursor: pointer !important;
	color: blue;
	pointer-events: auto;
}

.reason_self_input {
	display: none;
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
					<h4>미투코리아에 제보하기</h4>
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
					<h3 style="text-align: center; font-weight: bold">
						# 미투코리아 제보하기<span></span>
					</h3>
					<label for="exampleInputEmail1">* 부분은 필수 입력란입니다. </label>
					<form role="form" id="reportForm"  method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/report_insert_process">
						<div class="row">
							<div class="col-md-8">
								<div class="form-group">
									<label for="exampleInputEmail1">* 가해자 이름</label> <input type="text" class="form-control" maxlength="40" name="A_name" id="A_name" placeholder="가해자  이름을 적어주세요. 이니셜이나 초성도 괜찮습니다 ">
								</div>
								<div class="checkbox">
									<label> <input type="checkbox" id="A_ispublic" name="A_ispublic"> 가해자가 공인입니까?
									</label>
								</div>

							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"> 가해자 직업 또는 소속</label> <input type="text" class="form-control" maxlength="50" name="A_job" id="A_job" placeholder="가해자의 직업이나 소속을 적어주세요"> <label> </label>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">* 신고자 닉네임</label> <input type="text" class="form-control" maxlength="50" name="R_name" id="R_name" placeholder="신고자 닉네임을 적어주세요. 본명을 밝히고 싶으시면, 본명도 괜챃습니다.">
							<label> </label>

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"> 피해 당시 연령</label> <input type="text" class="form-control" maxlength="50" name="R_age" id="R_age" placeholder="피해 당시의 연령을 적어주세요"> <label> </label>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">* 제보 제목</label> <input type="text" class="form-control" maxlength="100" name="report_title" id="report_title" placeholder="제보 제목"> <label> </label>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">* 제보내용</label>
							<div style="text-align: center;">
								<textarea rows="10" style="width: 100%" name="report_content" id="report_content"></textarea>
							</div>

						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">* 제보글 비밀번호</label> <input type="password" class="form-control" name="report_password" id="report_password" placeholder="비밀번호">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">* 제보글 비밀번호 확인</label> <input type="password" class="form-control" name="report_password_check" id="report_password_check" placeholder="비밀번호 재입력">
						</div>


						<div class="checkbox">
							<label> <input type="checkbox" id="agreeCheckbox_isTrue" name="agreeCheckbox_isTrue"> *주의 - 허위 제보일 경우 법적 처벌을 받을 수 있습니다. 제보글이 사실입니까?
							</label>
						</div>

						<div style="text-align: center; margin: 8px">
							<a type="submit" id="report_submit" class="btn btn-theme-bg" style="width: 80%">미투코리아에 제보하기</a>
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
	<!-- 부트스트랩 SLIDER SELECTOR를 위한 자바스크립트 추가  -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/bootstrap-slider.min.js"></script>
	<!-- 부트스트랩 CUSTOM-SELECTOR 를 위한 자바스크립트 추가  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	<!-- multipart 폼을 AJAX로 처리하기 위한 제이ㅝ리 -->
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
			//쇼피니언 차트 및 일반 차트 지수 보기
			google_chart_Setting();

			//상대편 의견 동의 지수 퍼센트 구하는 슬라이더
			slider_for_agree_precentage();

			//내가 찬성, 반대 변경했을 시에, selector 의 option들의 내용 변환
			//기본적으로 찬성 쪽에 선택을 하자. 
			$("#options_myside1").trigger("click");
			myside_change_Setting();

			//
			submitBTClick();

			ckeditorSetting();
		});

		function submitBTClick() {
			$("#report_submit").click(function(event) {
				console.log('this is normalSubmit BT');
				//1. 필수 입력부분 empty 인지 확인하기
				var checkingInputOk = inputTagsCheckingOk();

				if (checkingInputOk) {
					//에디터 내용 가져옴
					var report_content_ckeditor = CKEDITOR.instances.report_content.getData();
					// If you want to add an extra field for the FormData
					$('#reportForm').ajaxForm({
						url : "${pageContext.request.contextPath}/report_insert_process",
						enctype : "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
						data : {
							"onNews":"no",
							"report_content_ckeditor" : report_content_ckeditor,
						},

						processData : false,
						contentType : false,
						success : function(data) {
							var aJaxResult = data["aJaxResult"];
							if (aJaxResult == "success") {
								alert('제보 내용을 성공적으로 등록했습니다');
								var m2_report_rcdno = data["m2_report_rcdno"];
								location.href = "${pageContext.request.contextPath}/report_detail?report_rcdno=" + m2_report_rcdno;
							} else {
								alert('실패');
							}
						}

					}).submit();
				}

			});

		}

		function inputTagsCheckingOk() {
			//1. 필수입력 inputtag들이 전부 입력되 있나 확인
			if ($("#report_title").val().trim() == "") {
				alert("제보 제목을 입력해 주세요.");
				$("#report_title").focus();
				return false;
			} else if ($("#A_name").val().trim() == "") {
				alert("가해자 이름이나 이니셜을 제대로 입력해 주세요.");
				$("#A_name").focus();
				return false;
			} else if ($("#R_name").val().trim() == "") {
				alert("신고자 이름이나 이니셜을 제대로 입력해 주세요.");
				$("#R_name").focus();
				return false;
			} else if ($("#report_password").val().trim() == "") {
				alert("비밀번호 부분을 제대로 입력해 주세요.");
				$("#report_password").focus();
				return false;
			} else if ($("#report_password_check").val().trim() == "") {
				alert("비밀번호 확인 부분을 제대로 입력해 주세요.");
				$("#report_password_check").focus();
				return false;
			}

			//4. 비밀번호 같은지 확인
			var pwd = $("#report_password").val();
			var pwd1 = $("#report_password_check").val();
			if (pwd != pwd1) { //	비밀번호 와 비밀번호 확인이 다르다면 ... 
				alert('비밀번호 두 개가 일치하지 않습니다. 정확히 비밀번호를 입력해주세요.');
				return false;
			}

			if ($('input:checkbox[id="agreeCheckbox_isTrue"]').is(":checked") == true) {

			} else {
				alert('제보글이 사실인지 확인이 반드시 필요합니다');
				return false;
			}

			return true;

		}

		function myside_change_Setting() {
			var pro_options = '<option value="0">찬성 주장 근거 선택안함</option><option value="${detail_tvTopic.sp_tvtopics_pro1 }">${detail_tvTopic.sp_tvtopics_pro1 }</option><option value="${detail_tvTopic.sp_tvtopics_pro2 }">${detail_tvTopic.sp_tvtopics_pro2 }</option><option value="${detail_tvTopic.sp_tvtopics_pro3 }">${detail_tvTopic.sp_tvtopics_pro3 }</option><option value="1">직접입력</option>';
			var con_options = '<option value="0">반대 주장 근거 선택안함</option><option value="${detail_tvTopic.sp_tvtopics_con1 }">${detail_tvTopic.sp_tvtopics_con1 }</option><option value="${detail_tvTopic.sp_tvtopics_con2 }">${detail_tvTopic.sp_tvtopics_con2 }</option><option value="${detail_tvTopic.sp_tvtopics_con3 }">${detail_tvTopic.sp_tvtopics_con3 }</option><option value="1">직접입력</option>';
			$('input[type=radio][name=options_myside]').change(function() {
				if (this.value == 'pro') {
					//찬성으로 선택했을 시에, 내가 선택한 근거의 option을 pro_options 로바꾸어준다.
					for (var i = 1; i < 4; i++) {
						$("select[name='myside_reason" + i + "'] option").remove();
						$("select[name='opside_reason" + i + "'] option").remove();
						$("#myside_reason" + i + "").html(pro_options);
						$("#opside_reason" + i + "").html(con_options);
					}
				} else if (this.value == 'con') {
					//찬성으로 선택했을 시에, 내가 선택한 근거의 option을 con_options 로바꾸어준다.
					for (var i = 1; i < 4; i++) {
						$("select[name='myside_reason" + i + "'] option").remove();
						$("select[name='opside_reason" + i + "'] option").remove();
						$("#myside_reason" + i + "").html(con_options);
						$("#opside_reason" + i + "").html(pro_options);
					}
				}
				//모든 selectpicker 의 값 초기화하고
				$('.selectpicker').selectpicker('refresh');
				//인풋 테크 클리어 및 hide
				$(".reason_self_input").val('');
				$(".reason_self_input").hide();

			});

		}
		function slider_for_agree_precentage() {
			// With JQuery
			$("#opside_reason1_agree").slider();
			$("#opside_reason1_agree").on("slide", function(slideEvt) {
				$("#ex6SliderVal1").text(slideEvt.value);
			});

			// With JQuery
			$("#opside_reason2_agree").slider();
			$("#opside_reason2_agree").on("slide", function(slideEvt) {
				$("#ex6SliderVal2").text(slideEvt.value);
			});

			// With JQuery
			$("#opside_reason3_agree").slider();
			$("#opside_reason3_agree").on("slide", function(slideEvt) {
				$("#ex6SliderVal3").text(slideEvt.value);
			});

		}
		function google_chart_Setting() {
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawChart);
		}
		function drawChart() {
			var data = google.visualization.arrayToDataTable([ [ 'Task', 'Hours per Day' ], [ '찬성', 110 ], [ '중립', 630 ], [ '반대', 22 ] ]);
			var options = {
				legend : 'bottom',
				colors : [ '#e0440e', '#e6693e', '#ec8f6e' ],
				is3D : true
			};
			var chart1 = new google.visualization.PieChart(document.getElementById('piechart1'));
			var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
			chart1.draw(data, options);
			chart2.draw(data, options);
		}

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/me_report_write") != -1) {

				$("#navmenu_me_report_write").css("color", "#39a1f4");

			}

		}

		function ckeditorSetting() {
			CKEDITOR.replace('report_content', {
				//해당 이름으로 된 textarea에 에디터를 적용
				width : '100%',
				height : '300px',
                // user들이 올리는 제보에는 사진 파일 첨부 못하도록 한다. 
				// filebrowserImageUploadUrl: '${pageContext.request.contextPath}/boardImageUpload'                 
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
			});

		}
	</script>
</body>

</html>
