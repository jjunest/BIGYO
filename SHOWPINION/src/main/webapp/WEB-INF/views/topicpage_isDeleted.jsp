<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 나누기의 몫을 정수값으로 구하기 위한 jstl 태그 라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Listsize를 위한 jstl태그라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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

.vertical-alignment-helper {
	display: table;
	height: 100%;
	width: 100%;
}

.vertical-align-center {
	/* To center vertically */
	display: table-cell;
	vertical-align: middle;
}

.modal-content {
	/* Bootstrap sets the size of the modal in the modal-dialog class, we need to inherit it */
	width: inherit;
	height: inherit;
	/* To center horizontally */
	margin: 0 auto;
}

#topicReply_Save {
	display: none;
}

#topicReplyEditor {
	display: none;
}
</style>
</head>
<body class="body-wrapper">
	<!-- 현재 접속해 있는 user ID 저장 -->
	<c:set var="user" value="${pageContext.request.userPrincipal.name}" />

	<!-- HEADER FILE INCLUDE  -->
	<jsp:include page="navbar_header.jsp"></jsp:include>
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h4>쇼피니언 주제</h4>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>

	<div class="container">
		<div class="center-heading">

			<h2>해당 토론 주제는 삭제되었습니다.</h2>

			<span class="center-line"></span>
			<br>
			<br>
			<button type="button" class = "btn btn-primary btn-lg" onclick="goBack()">뒤로 돌아가기</button>
		</div>

	</div>
	<!--blog full main container-->
	<div class="divide60"></div>

	<div class="divide60"></div>
	<div class="divide60"></div>

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- 모달 및 숨겨져 있는 부분 -->

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
	<!-- 내 자바스크립트 -->
	<script src="${pageContext.request.contextPath}/resources/js/jjunest.js" type="text/javascript"></script>
	<!-- 구글 차트를 위한 스크립트 추가 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<!-- 부트스트랩 SLIDER SELECTOR를 위한 자바스크립트 추가  -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/bootstrap-slider.min.js"></script>
	<!-- 부트스트랩 CUSTOM-SELECTOR 를 위한 자바스크립트 추가  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	<!-- fa class 추가  -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			/* 		navMenuColorSetting();
					google_chart_Setting();
					//topic 주제 댓글 달기 버튼
					topic_Reply_RegButton_Setting();
					//댓글쓰기 및 댓글등록 버튼 토글하기
					topic_replyBT_toggle_Setting();
					//페이지 로딩 시에 toggle해줘야할 것들 setting
					pageLoading_toggle_Setting();
					//대댓글의 개수를 보여주는 함수
					reply_number_Setting();
					//최신순 추천순 dropdown버튼 정렬하기.
					list_order_dropdown_Setting(); */

		});
		function goBack() {
		    window.history.back();
		}
		// 주제 댓글 삭제 버튼 onclick
		function topicReply_deleteBT_click(topicReply_rcdno) {
			var result = confirm('정말 해당 의견을 삭제하시겠습니까?');
			if (result) {
				// 값 셋팅
				var objParams = {
					topicReply_rcdno : topicReply_rcdno,
				};
				// ajax 호출
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/topicReply_delete_process",
					data : objParams,
					success : function(data) {
						if (data == "success") {
							alert("성공적으로 삭제했습니다");
							location.reload();
						} else {
							alert("요청하신 서비스에 실패했습니다. 문제 상황 지속시 연락 부탁드립니다. 010 7272 9771");
						}

					},
					error : function(e) {
						alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771:' + e);
					}
				});

			}

		}

		//주제 삭제 버튼 클릭시
		function topic_deleteBT_click(topic_rcdno) {
			var result = confirm('정말 해당 주제를 삭제하시겠습니까?');
			if (result) {
				//값 셋팅
				var objParams = {
					topic_rcdno : topic_rcdno,
				};
				//ajax 호출
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/tvtopic_delete_process",
					data : objParams,
					success : function(data) {
						if (data == "success") {
							alert("성공적으로 삭제했습니다");
							location.href = "${pageContext.request.contextPath}/all_TVshow_Topics";
						} else {
							alert("요청하신 서비스에 실패했습니다. 문제 상황 지속시 연락 부탁드립니다. 010 7272 9771");
						}

					},
					error : function(e) {
						alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771:' + e);
					}
				});

			} else {

			}

		}

		function list_order_dropdown_Setting() {
			var opinion_order;
			<c:if test="${param.opinion_order}">
			opinion_order = "recent";
			</c:if>
			opinion_order = '${param.opinion_order}';

			//opinionOrder 순서가없으면 최신순이다.
			if (opinion_order == null || opinion_order == "" || opinion_order == "recent") {
				$("#show_opinion_order").html("최신순  <span class='caret'></span>");
				$("#normal_opinion_order").html("최신순   <span class='caret'></span>");
			} else if (opinion_order == "thumbup") {
				$("#show_opinion_order").html("추천순  <span class='caret'></span>");
				$("#normal_opinion_order").html("추천순  <span class='caret'></span>");
			}

		}

		// 의견의 리플 삭제 버튼 시
		function opinionReply_deleteBT_click(opinionReply_rcdno) {
			var result = confirm('정말 해당 의견을 삭제하시겠습니까?');
			if (result) {
				// 값 셋팅
				var objParams = {
					opinionReply_rcdno : opinionReply_rcdno,
				};
				// ajax 호출
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/opinionReply_delete_process",
					data : objParams,
					success : function(data) {
						if (data == "success") {
							alert("성공적으로 삭제했습니다");
							location.reload();
						} else {
							alert("요청하신 서비스에 실패했습니다. 문제 상황 지속시 연락 부탁드립니다. 010 7272 9771");
						}

					},
					error : function(e) {
						alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771:' + e);
					}
				});

			}
		}

		//의견 삭제 버튼 클릭 시
		function opinion_deleteBT_click(opinion_rcdno) {
			var result = confirm('정말 해당 의견을 삭제하시겠습니까?');
			if (result) {
				//값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
				};
				//ajax 호출
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/opinion_delete_process",
					data : objParams,
					success : function(data) {
						if (data == "success") {
							alert("성공적으로 삭제했습니다");
							location.reload();
						} else {
							alert("요청하신 서비스에 실패했습니다. 문제 상황 지속시 연락 부탁드립니다. 010 7272 9771");
						}

					},
					error : function(e) {
						alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771:' + e);
					}
				});

			}

		}

		//의견_의 좋아요 버튼 눌렀을 시 - onclick()
		function opinion_thumbup(opinion_rcdno) {
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				//값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					recom_type : "thumbup",
					bywhom : "${loginUserInfo.rcdno}"
				};

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_recommend_process",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			}

		}

		//의견의 대댓글 버튼 클릭시
		function opinion_re_reply_showBT_Click(sp_opinion_reply_rcdno, parentRcdno) {
			$("#opinion_ReReplyEditor_" + sp_opinion_reply_rcdno).toggle();
			$(".opinion_re_reply_" + sp_opinion_reply_rcdno).toggle();
			$("#opinion_re_reply_saveBT_" + sp_opinion_reply_rcdno).toggle();
		}

		//쇼피니언, 일반의견의 댓글 보기 누르기. onclick()함수 -댓글쓰기/댓글에디터/댓글들 토글하기.
		function opinion_reply_showBT(opinionRcdno) {
			$("#opinion_replysave_BT_" + opinionRcdno).toggle();
			$("#opinion_ReplyEditor_" + opinionRcdno).toggle();
			$(".opinion_reply_" + opinionRcdno).toggle();

		}
		//의견_대댓글 버튼 등록 클릭 시 발생하는 함수. 답글등록 onClick() 함수
		function opinion_re_reply_save(opinion_rcdno, parent_rcdno) {
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				//널 검사
				if ($("#opinion_ReReplyEditor_" + parent_rcdno).val().trim() == "") {
					alert("답글 내용이 없습니다. 내용을 입력하고 답글등록을 해주세요.");
					$("#opinion_ReReplyEditor_" + parent_rcdno).focus();
					return false;
				}
				//에디터 내용 가져옴
				var content = $("#opinion_ReReplyEditor_" + parent_rcdno).val().trim();
				//값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					parent_rcdno : parent_rcdno,
					depth : "1",
					content : content,
					writer : "${loginUserInfo.rcdno}"
				};
				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_reply_save",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			}

		}

		//의견_댓글 달기
		function opinion_reply_save(opinion_rcdno) {
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				//널 검사
				if ($("#opinion_ReplyEditor_" + opinion_rcdno).val().trim() == "") {
					alert("댓글 내용을 입력하세요.");
					$("#opinion_ReplyEditor_" + opinion_rcdno).focus();
					return false;
				}
				//에디터 내용 가져옴
				var content = $("#opinion_ReplyEditor_" + opinion_rcdno).val().trim();

				//값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					parent_rcdno : "0",
					depth : "0",
					content : content,
					writer : "${loginUserInfo.rcdno}"
				};
				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_reply_save",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			}

		}

		//의견_댓글의 신고 버튼 눌렀을 시 - onclick()
		function opinion_reply_warning(opinion_reply_rcdno) {
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.");
			} else {

				//값 셋팅
				var objParams = {
					opinion_reply_rcdno : opinion_reply_rcdno,
					recom_type : "warning",
					bywhom : "${loginUserInfo.rcdno}"
				};

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_reply_recommend_process",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});
			}

		}

		//의견_댓글의 좋아요 버튼 눌렀을 시 - onclick()
		function opinion_reply_thumbup(opinion_reply_rcdno) {
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				//값 셋팅
				var objParams = {
					opinion_reply_rcdno : opinion_reply_rcdno,
					recom_type : "thumbup",
					bywhom : "${loginUserInfo.rcdno}"
				};

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_reply_recommend_process",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			}

		}
		//주제_댓글의 신고 버튼 눌렀을 시 - onclick()
		function topic_reply_warning(sp_topic_reply_rcdno) {
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				//값 셋팅
				var objParams = {
					sp_topic_reply_rcdno : sp_topic_reply_rcdno,
					recom_type : "warning",
					bywhom : "${loginUserInfo.rcdno}"
				};

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/topic_reply_recommend_process",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			}

		}

		//주제_댓글의 좋아요 버튼 눌렀을 시 - onclick()
		function topic_reply_thumbup(sp_topic_reply_rcdno) {
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				//값 셋팅
				var objParams = {
					sp_topic_reply_rcdno : sp_topic_reply_rcdno,
					recom_type : "thumbup",
					bywhom : "${loginUserInfo.rcdno}"
				};

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/topic_reply_recommend_process",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});
			}

		}

		//주제_대댓글이 몇개인지 표시하는 함수. 시작했을시, 클래스를 바탕으로 파악한다. 
		function reply_number_Setting() {
			//주제_댓글 개수 카운팅하기
			$(".topic_re_reply_number").each(function() {
				var reply_rcdno = $(this).attr('reply_rcdno');
				var counting = $(".re_reply_" + reply_rcdno).length
				$(this).text(counting);
			});

			//의견_댓글 개수 카운팅하기

			$(".opinion_reply_number").each(function() {
				var opinion_rcdno = $(this).attr('opinion_rcdno');
				var counting = $(".opinion_reply_" + opinion_rcdno).length
				$(this).text(counting);
			});

			//의견_대댓글 개수 카운팅하기
			$(".opinion_re_reply_number").each(function() {
				var reply_rcdno = $(this).attr('reply_rcdno');
				var counting = $(".opinion_re_reply_" + reply_rcdno).length
				$(this).text(counting);
			});

		}
		function topic_replyBT_toggle_Setting() {
			//
			$("#reply_writing_start").click(function() {
				//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
				if ('${loginUserInfo}' == "") {
					alert("댓글 등록을 위해서는 로그인이 필요합니다.")
				} else {
					$("#topicReply_Save").toggle();
					$("#reply_writing_start").toggle();
					$("#topicReplyEditor").toggle();
				}
			});
			$("#topicReply_Save").click(function() {
				//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
				if ('${loginUserInfo}' == "") {
					alert("댓글 등록을 위해서는 로그인이 필요합니다.")
				} else {
					$("#topicReply_Save").toggle();
					$("#reply_writing_start").toggle();
					$("#topicReplyEditor").toggle();
				}
			});
		}
		//페이지 로딩 시에 대댓글 Editor와 글 등록 버튼을 없애주는 토글 버튼.
		function pageLoading_toggle_Setting() {
			$(".re_reply_Editor").toggle();
			$(".re_reply_writeBT").toggle();
			$(".opinion_reply_Editor").toggle();
			$(".opinionReplySection").toggle();
			$(".opinion_replysave_BT").toggle();
			$(".opinion_ReReplyEditor").toggle();
			$(".opinion_re_reply_saveBT").toggle();
		}

		//대댓글 토글 , 답글 보기시 발생하는 함수
		function re_reply_visibilitytoggle(reply_rcdno) {
			//대댓글 editor를 보여주게하고, 답글 등록 버튼을 보여준ㄷ
			$("#topic_ReReplyEditor_" + reply_rcdno).toggle();
			$("#re_reply_writeBT_" + reply_rcdno).toggle();
			//대댓글들을 전부 보여준다. 
			$('.re_reply_' + reply_rcdno).toggle();
			//답글 등록
		}

		//주제_대댓글 버튼 등록 클릭 시 발생하는 함수. 답글등록 onClick() 함수
		function tvtopic_re_reply_save(sp_tvtopics_rcdno, sp_topic_reply_rcdno) {
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				//널 검사
				if ($("#topic_ReReplyEditor_" + sp_topic_reply_rcdno).val().trim() == "") {
					alert("답글 내용이 없습니다. 내용을 입력하고 답글등록을 해주세요.");
					$("#topic_ReReplyEditor_" + sp_topic_reply_rcdno).focus();
					return false;
				}
				//에디터 내용 가져옴
				var content = $("#topic_ReReplyEditor_" + sp_topic_reply_rcdno).val().trim();
				//값 셋팅
				var objParams = {
					tvtopic_rcdno : sp_tvtopics_rcdno,
					parent_rcdno : sp_topic_reply_rcdno,
					depth : "1",
					content : content,
					writer : "${loginUserInfo.rcdno}"
				};
				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/topic_reply_save",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});
			}

		}
		//주제 댓글 등록 눌렀을 시 발생하는 동작
		function topic_Reply_RegButton_Setting() {

			$("#topicReply_Save").click(function() {
				//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
				if ('${loginUserInfo}' == "") {
					alert("로그인이 필요합니다.")
				} else {
					//널 검사
					if ($("#topicReplyEditor").val().trim() == "") {
						alert("댓글 내용을 입력하세요.");
						$("#topicReplyEditor").focus();
						return false;
					}
					//에디터 내용 가져옴
					var content = $("#topicReplyEditor").val().trim();

					//값 셋팅
					var objParams = {
						tvtopic_rcdno : '${detail_tvTopic.sp_tvtopics_rcdno }',
						parent_rcdno : "0",
						depth : "0",
						content : content,
						writer : "${loginUserInfo.rcdno}"
					};
					//ajax 호출
					$.ajax({
						url : "${pageContext.request.contextPath}/topic_reply_save",
						dataType : "json",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						type : "post",
						data : objParams,
						success : function(retVal) {

							if (retVal.code == "OK") {
								alert(retVal.message);
								location.reload();
							} else {
								alert(retVal.message);
							}

						},
						error : function(request, status, error) {
							console.log("AJAX_ERROR");
						}
					});

				}

			});

		}

		/* 구글 차트 지수들을 센팅하는 함수. */
		function chart_index_Setting() {

		}
		var showpinion_graph_pro_total;
		var showpinion_graph_con_total;
		var normal_graph_pro_total;
		var normal_graph_con_total;
		function google_chart_Setting() {
			showpinion_graph_pro_total = $
			{
				showpinion_graph_pro_total
			}
			;
			showpinion_graph_con_total = $
			{
				showpinion_graph_con_total
			}
			;
			normal_graph_pro_total = $
			{
				normal_graph_pro_total
			}
			;
			normal_graph_con_total = $
			{
				normal_graph_con_total
			}
			;

			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawChart);
		}
		function drawChart() {
			var showpinion_data = google.visualization.arrayToDataTable([ [ 'Task', 'Hours per Day' ], [ '찬성', showpinion_graph_pro_total ], [ '반대', showpinion_graph_con_total ] ]);
			var normal_data = google.visualization.arrayToDataTable([ [ 'Task', 'Hours per Day' ], [ '찬성', normal_graph_pro_total ], [ '반대', normal_graph_con_total ] ]);

			var options = {
				legend : 'bottom',
				colors : [ '#59df57', '#df5759' ],
				is3D : true
			};
			var showpinion_chart = new google.visualization.PieChart(document.getElementById('showpinion_chart'));
			var normal_chart = new google.visualization.PieChart(document.getElementById('normal_chart'));
			showpinion_chart.draw(showpinion_data, options);
			normal_chart.draw(normal_data, options);

			//쇼피니언 차트 색깔 정하기
			if (parseInt(showpinion_graph_pro_total) > parseInt(showpinion_graph_con_total)) {
				$("#showpinion_chart_div").css("border", " 4px solid #59df57");
			} else if (parseInt(showpinion_graph_pro_total) < parseInt(showpinion_graph_con_total)) {
				$("#showpinion_chart_div").css("border", " 4px solid #df5759");
			} else {
				$("#showpinion_chart_div").css("border", " 1px solid ");
			}
			//일반의견 차트 색깔 정하기
			if (parseInt(normal_graph_pro_total) > parseInt(normal_graph_con_total)) {
				$("#normal_chart_div").css("border", " 4px solid #59df57");
			} else if (parseInt(normal_graph_pro_total) < parseInt(normal_graph_con_total)) {
				$("#normal_chart_div").css("border", " 4px solid #df5759");
			} else {
				$("#normal_chart_div").css("border", " 1px solid ");
			}

		}

		function navMenuColorSetting() {
			// navigation menu 주소에 따라서 active 설정 시작 
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/coinCalendar") != -1) {

				$("#navmenu_coinCalendar").css("color", "#39a1f4");

			}

		}
	</script>
</body>

</html>
