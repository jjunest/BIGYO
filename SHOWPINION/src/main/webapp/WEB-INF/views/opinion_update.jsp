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
					<h4></h4>
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
	<form role="form" id="opinion_form" method="post" enctype="multipart/form-data" action="opinion_update_process">
		<div class="container">
			<div class="center-heading">
				<h2>${opinion_DTO.sp_opinion_topictitle }</h2>
				<span class="center-line"></span>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="blog-post">
						<div class="divide30"></div>
						<h3 class="heading">의견 수정 *상세의견을 제외한 나머지는 다시 의견을 입력해주세요*</h3>
						<div style="text-align: center;">
							<div class="btn-group" data-toggle="buttons" style="width: 100%; margin-bottom: 5px">
								<label class="btn btn-primary" style="width: 50%; border: solid 0.5 gray;"> <input type="radio" name="options_myside" id="options_myside1" autocomplete="off" value="pro"> 찬성
								</label> <label class="btn btn-primary" style="width: 50%; border: solid 0.5 gray;"> <input type="radio" name="options_myside" id="options_myside2" autocomplete="off" value='con'> 반대
								</label>
							</div>
						</div>
						<div class="row" style="border-bottom: 1px solid gray; margin-top: 20px">
							<div class="col-md-3" style="display: flex; align-items: center;">내가 선택한 근거</div>
							<div class="col-md-9" style="text-align: left;">
								<div class="row" style="margin: 10px">
									<p style="margin: 2px">
										<span class="label label-danger" style="margin-right: 10px">결정적</span>
									</p>
									<select class="selectpicker reason_selector myside_reason" data-width="100%" id="myside_reason1" name="myside_reason1">
										<option value="0">찬성 주장 근거 선택안함</option>
										<option value="${detail_tvTopic.sp_tvtopics_pro1 }">${detail_tvTopic.sp_tvtopics_pro1 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_pro2 }">${detail_tvTopic.sp_tvtopics_pro2 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_pro3 }">${detail_tvTopic.sp_tvtopics_pro3 }</option>
										<option value="1">직접입력</option>


									</select> <input class="form-control reason_self_input" id="myside_reason1_self" name="myside_reason1_self" placeholder="자신이 생각한 근거를 30자로 축약해 직접 입력 하세요" type="text" maxlength="32">

								</div>
								<div class="row" style="margin: 10px">
									<p style="margin: 2px">
										<span class="label label-danger" style="margin-right: 10px">2순위</span>
									</p>
									<select class="selectpicker reason_selector myside_reason" data-width="100%" id="myside_reason2" name="myside_reason2">
										<option value="0">찬성 주장 근거 선택안함</option>
										<option value="${detail_tvTopic.sp_tvtopics_pro1 }">${detail_tvTopic.sp_tvtopics_pro1 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_pro2 }">${detail_tvTopic.sp_tvtopics_pro2 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_pro3 }">${detail_tvTopic.sp_tvtopics_pro3 }</option>
										<option value="1">직접입력</option>

									</select> <input class="form-control reason_self_input" id="myside_reason2_self" name="myside_reason2_self" placeholder="자신이 생각한 근거를 30자로 축약해 직접 입력 하세요" type="text" maxlength="32">

								</div>
								<div class="row" style="margin: 10px">
									<p style="margin: 2px">
										<span class="label label-danger" style="margin-right: 10px">3순위</span>
									</p>
									<select class="selectpicker reason_selector myside_reason" data-width="100%" id="myside_reason3" name="myside_reason3">

										<option value="0">찬성 주장 근거 선택안함</option>
										<option value="${detail_tvTopic.sp_tvtopics_pro1 }">${detail_tvTopic.sp_tvtopics_pro1 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_pro2 }">${detail_tvTopic.sp_tvtopics_pro2 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_pro3 }">${detail_tvTopic.sp_tvtopics_pro3 }</option>
										<option value="1">직접입력</option>

									</select><input class="form-control reason_self_input" id="myside_reason3_self" name="myside_reason3_self" placeholder="자신이 생각한 근거를 30자로 축약해 직접 입력 하세요" type="text" maxlength="32">

								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 20px">
							<div class="col-md-3" style="display: flex; align-items: center;">공감하는 상대측 근거</div>
							<div class="col-md-9" style="text-align: left;">
								<div class="row" style="margin: 10px">
									<p style="margin: 2px">
										<span class="label label-success" style="margin-right: 10px">1순위</span>
									</p>
									<select class="selectpicker reason_selector opside_reason" data-width="100%" id="opside_reason1" name="opside_reason1">
										<option value="0">반대 주장 근거 선택안함</option>
										<option value="${detail_tvTopic.sp_tvtopics_con1 }">${detail_tvTopic.sp_tvtopics_con1 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_con2 }">${detail_tvTopic.sp_tvtopics_con2 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_con3 }">${detail_tvTopic.sp_tvtopics_con3 }</option>
										<option value="1">직접입력</option>

									</select><input class="form-control reason_self_input" id="opside_reason1_self" name="opside_reason1_self" placeholder="자신이 생각한 근거를 30자로 축약해 직접 입력 하세요" type="text" maxlength="32">

									<p>
										<input id="opside_reason1_agree" name="opside_reason1_agree" type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="50" /> <span
											id="ex6CurrentSliderValLabel"> &nbsp &nbsp 의견 공감 지수: <span id="ex6SliderVal1">50</span>%
										</span>
									</p>
								</div>
								<div class="row" style="margin: 10px">
									<p style="margin: 2px">
										<span class="label label-success" style="margin-right: 10px">2순위</span>
									</p>
									<select class="selectpicker reason_selector opside_reason" data-width="100%" id="opside_reason2" name="opside_reason2">
										<option value="0">반대 주장 근거 선택안함</option>
										<option value="${detail_tvTopic.sp_tvtopics_con1 }">${detail_tvTopic.sp_tvtopics_con1 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_con2 }">${detail_tvTopic.sp_tvtopics_con2 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_con3 }">${detail_tvTopic.sp_tvtopics_con3 }</option>
										<option value="1">직접입력</option>

									</select><input class="form-control reason_self_input" id="opside_reason2_self" name="opside_reason2_self" placeholder="자신이 생각한 근거를 30자로 축약해 직접 입력 하세요" type="text" maxlength="32">

									<p>
										<input id="opside_reason2_agree" name="opside_reason2_agree" type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="50" /> <span
											id="ex6CurrentSliderValLabel"> &nbsp &nbsp 의견 공감 지수: <span id="ex6SliderVal2">50</span>%
										</span>
									</p>
								</div>
								<div class="row" style="margin: 10px">
									<p style="margin: 2px">
										<span class="label label-success" style="margin-right: 10px">3순위</span>
									</p>
									<select class="selectpicker reason_selector opside_reason" data-width="100%" id="opside_reason3" name="opside_reason3">
										<option value="0">반대 주장 근거 선택안함</option>
										<option value="${detail_tvTopic.sp_tvtopics_con1 }">${detail_tvTopic.sp_tvtopics_con1 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_con2 }">${detail_tvTopic.sp_tvtopics_con2 }</option>
										<option value="${detail_tvTopic.sp_tvtopics_con3 }">${detail_tvTopic.sp_tvtopics_con3 }</option>
										<option value="1">직접입력</option>
									</select><input class="form-control reason_self_input" id="opside_reason3_self" name="myside_reason3_self" placeholder="자신이 생각한 근거를 30자로 축약해 직접 입력 하세요" type="text" maxlength="32">
									<p>
										<input id="opside_reason3_agree" name="opside_reason3_agree" type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="50" /> <span
											id="ex6CurrentSliderValLabel"> &nbsp &nbsp 의견 공감 지수: <span id="ex6SliderVal3">50</span>%
										</span>
									</p>
								</div>
							</div>
						</div>

						<h3 class="heading" style="margin-top: 5px">상세 의견</h3>
						<div style="text-align: center;">
							<textarea rows="4" cols="100%" id="opinion_detail" name="opinion_detail">${opinion_DTO.sp_opinion_detail}</textarea>
						</div>
						<h3 class="heading" style="margin-top: 5px"></h3>
						<div>
							<div style="margin: 20px">
								<button type="button" class="btn btn-primary" style="width: 80%; text-align: center;" id="opinion_update_submitBT">의견 수정하기</button>

							</div>
						</div>
					</div>
					<!--blog post-->

				</div>
				<!--col-->
				<div class="col-md-3 col-md-offset-1">
					<div class="row">
						<div class="col-md-12 margin20">
							<div class="team-wrap">
								<img src="${pageContext.request.contextPath}/resources/img/tvshow_poster_SSULJON.jpg" class="img-responsive" alt="">
								<h4>썰전</h4>
								<span>방영 날짜: 2017-12-10</span>
								<p>방송 설명: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam, adipiscing condimentum tristique vel, eleifend sed turpis</p>
							</div>
							<!--team-wrap-->
						</div>
						<!--team col-->
						<div class="col-md-12 margin20">
							<div class="team-wrap" style="border: 4px solid #59df57; border-radius: 5px;">
								<h4>쇼피니언 지수</h4>
								<div id="piechart1"></div>
							</div>
							<!--team-wrap-->
						</div>
						<!--team col-->
						<div class="col-md-12 margin20">
							<div class="team-wrap" style="border: 4px solid #59df57; border-radius: 5px;">
								<h4>일반 의견 지수</h4>
								<div id="piechart2"></div>
							</div>
							<!--team-wrap-->
						</div>
						<!--team col-->
					</div>
				</div>
				<!--row for blog post-->
			</div>
		</div>
	</form>
	<!--blog full main container-->
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


	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
			//쇼피니언 차트 및 일반 차트 지수 보기
			google_chart_Setting();

			//상대편 의견 동의 지수 퍼센트 구하는 슬라이더
			slider_for_agree_precentage();

			//내가 찬성, 반대 변경했을 시에, selector 의 option들의 내용 변환
			myside_change_Setting();
			$("#options_myside1")
			var myside = "${opinion_DTO.sp_opinion_side}";
			if (myside == "pro") {
				$("#options_myside1").trigger("click");
			} else if (myside == "con") {
				$("#options_myside2").trigger("click");
			}
			//일반 의견으로 등록하기 버튼 클릭시
			opinion_update_submitBT();
			//찬성이유 및 반대이유 직접 입력부분
			reason_self_Setting();
			//update 버튼 submit
			opinion_update_submitBT();
		});

		function reason_self_Setting() {
			for (var i = 1; i < 4; i++) {
				$("#myside_reason" + i).change(function() {
					$(this).each(function() {
						if ($(this).val() == 1) {
							var thisid = $(this).attr('id');
							$("#" + thisid + "_self").show();
						} else {
							var thisid = $(this).attr('id');
							$("#" + thisid + "_self").hide();
						}
					});
				});

				$("#opside_reason" + i).change(function() {
					$(this).each(function() {
						if ($(this).val() == 1) {
							var thisid = $(this).attr('id');
							$("#" + thisid + "_self").show();
						} else {
							var thisid = $(this).attr('id');
							$("#" + thisid + "_self").hide();
						}
					});
				});

			}

		}

		function opinion_update_submitBT() {
			$("#opinion_update_submitBT").click(function(event) {
				//1. 필수 입력부분 empty 인지 확인하기
				var checkingInputOk = inputTagsCheckingOk();
				if (checkingInputOk) {
					var opinion_rcdno = "${opinion_DTO.sp_opinion_rcdno}";
					// multipart는 아작스 폼으로 넘기자
					$('#opinion_form').ajaxForm({
						url : "${pageContext.request.contextPath}/opinion_update_process",
						processData : false,
						data : {
							"opinion_rcdno" : opinion_rcdno
						},
						contentType : false,
						success : function(result) {
							if (result == "success") {
								alert('성공적으로 정보가 수정 되었습니다.');
								location.href = "${pageContext.request.contextPath}/detail_opinion?opinion_rcdno=" + opinion_rcdno;
							} else {
								alert('토론 주제 수정이 실패하였습니다. 지속적으로 문제 발생 시 연락부탁드립니다. 010-7272-9771');
							}
						}
					}).submit();
				}
			});

		}

		function inputTagsCheckingOk() {
			//1. 필수입력 inputtag들이 전부 입력되 있나 확인
			if ($("#myside_reason1").val().trim() == "" || $("#myside_reason1").val().trim() == 0) {
				alert("내가 선택한 근거 중 첫 번째인 결정적 이유는 반드시 선택 해야 합니다.");
				$("#myside_reason1").focus();
				return false;
			}
			if ($("#opside_reason1").val().trim() == "" || $("#opside_reason1").val().trim() == 0) {
				alert("내가 반대편 근거 중 첫 번째인 1순위 이유는 반드시 선택 해야 합니다.");
				$("#opside_reason1").focus();
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
			if (urlpath.indexOf("/coinCalendar") != -1) {

				$("#navmenu_coinCalendar").css("color", "#39a1f4");

			}

		}
	</script>
</body>

</html>
