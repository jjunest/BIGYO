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
					<h4>제보 상세 보기</h4>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a type="button" class="btn btn-primary" onclick="report_passwordCheck_admin()" style="color: black">관리자 삭제(삭제만 가능!! 수정은 비밀번호때문에 불가합니다.)</a>
	</sec:authorize>

				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>


	<div class="container">
		<c:forEach var="listValue" items="${reportDetail}">
			<c:set var="report_rcdno" value="${listValue.m2_report_rcdno}"></c:set>
			<!-- GALLERY ITEM START -->
			<div class="mas-boxes-inner" style="border: 4px solid #59df57; border-radius: 5px;">
				<div class="mas-blog-inner">
					<h3>
						<a href="${pageContext.request.contextPath}/report_detail?report_rcdno=${listValue.m2_report_rcdno}">${listValue.m2_report_title}</a>
					</h3>

					<c:if test="${listValue.m2_report_Aispublic eq 'on' }">
						<div>*본 사건의 가해자는 공인입니다.</div>
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
					<br>
					<p>${listValue.m2_report_content}</p>
					<br>
					<!-- 제보자가 자기 정보 공개시 정보 공개 -->
					<ul class="list-inline post-detail">
						<c:if test="${empty listValue.m2_report_Rname }">
							<li>제보자: <span>정보 없음</span></li>
						</c:if>
						<c:if test="${not empty listValue.m2_report_Rname }">
							<li>제보자: <span>${listValue.m2_report_Rname}</span></li>
						</c:if>
					</ul>

					<!--  <a onclick="report_passwordCheck(${listValue.m2_report_rcdno});">  -->

					<div style="text-align: right; margin-right: 10px">
						<i class="far fa-edit"></i> <a data-toggle="modal" data-target="#reportEditModal" data-report_rcdno="${listValue.m2_report_rcdno}"> 수정</a> <i class="fas fa-exclamation-circle"></i><a
							onclick="report_warning(${listValue.m2_report_rcdno});">신고+${listValue.m2_report_warning}</a> <i class="fab fa-meetup"></i><a onclick="report_thumbup(${listValue.m2_report_rcdno});">올려+${listValue.m2_report_thumbup}</a>
						<i class="fas fa-comment-alt"></i><a onclick="">댓글+${fn:length(replyList)} </a>
					</div>
					<br>
					<div class="row" style="margin: 0px; padding: 0px">
						<table border="0" width="100%">
							<tr>
								<td width="40%">&nbsp&nbsp <input type="text" id="reply_writer" name="reply_writer" style="width: 80%; text-align: center" maxlength="20" placeholder="작성자" /></td>
								<td width="40%">&nbsp&nbsp <input type="password" id="reply_password" name="reply_password" style="width: 80%; text-align: center" maxlength="20" placeholder="비밀번호" /></td>
								<td width="10%">
									<button id="reply_save" name="reply_save" type="button" class="btn btn-primary btn-xs">댓글 등록</button>
								</td>
							</tr>
						</table>
						<table width="100%" style="border: 0">
							<tr>
								<td class="col-xs-12"><textarea id="reply_content" name="reply_content" rows="1" style="width: 100%" placeholder="댓글을 입력하세요."></textarea></td>
							</tr>
						</table>
					</div>
					<br>
					<c:forEach var="replyList" items="${replyList}" varStatus="status">
						<div class="row" style="border-bottom: solid 0.5px #D9D9D9; background: #F5F5F5; padding: 5px">
							<c:if test="${replyList.depth == '1'}"> &nbsp→ </c:if>${replyList.reply_content}
							<div style="font-size: small; color: #737373; font-weight: bold; text-align: right">
								작성자:${replyList.reply_writer} &nbsp |
								<c:if test="${replyList.depth != '1'}">
									<button name="reply_reply" reply_id="${replyList.reply_id}" type="button" class="btn btn-default  btn-xs">답글</button>
									<!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
								</c:if>
								<button reply_id="${replyList.reply_id}" data-reply_id="${replyList.reply_id}" data-toggle="modal" data-target="#replyDeleteModal" type="button" class="btn btn-default  btn-xs">삭제</button>
							</div>
						</div>
					</c:forEach>







				</div>
				<!--blog inner-->
			</div>


			<!-- GALLERY ITEM END -->
		</c:forEach>
	</div>
	<div class="divide60"></div>



	<jsp:include page="footer.jsp"></jsp:include>

	<!-- reportEditModal Modal -->
	<div class="modal fade" id="reportEditModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">글 수정 및 삭제</h4>
				</div>
				<div class="modal-body">
					<input type="password" style="text-align: center" id="report_password" width="100%" maxlength="20" placeholder="글 비밀번호 입력" /> <input type="hidden" style="text-align: center"
						name="report_password_inmodal" id="report_password_inmodal" width="100%" maxlength="20" />

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="report_passwordCheck()">수정 및 삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<!-- reportEditModal Modal -->
	<div class="modal fade" id="replyDeleteModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글 삭제</h4>
				</div>
				<div class="modal-body">
					<input type="password" style="text-align: center" id="reply_password_inmodal" width="100%" maxlength="20" placeholder="댓글 비밀번호 입력" /> <input type="hidden" style="text-align: center"
						name="reply_password_inmodal" id="reply_id_inmodal" width="100%" maxlength="20" />

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="reply_delete()">댓글 삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>




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
			
			
			//모달로 데이터 전송하기..
			modal_data_Setting();	
		
	
			
		});
		//모달로 데이터 전송하기
		function modal_data_Setting(){
			//triggered when modal is about to be shown
			$('#reportEditModal').on('show.bs.modal', function(e) {
				$("#report_password").val('');
				$("#report_password_inmodal").val('');
			    //get data-id attribute of the clicked element
			    var report_rcdno = $(e.relatedTarget).data('report_rcdno');

			    //populate the textbox
			    $(e.currentTarget).find('input[name="report_password_inmodal"]').val(report_rcdno);
			    
				
			});
			
			//triggered when modal is about to be shown
			$('#replyDeleteModal').on('show.bs.modal', function(e) {
				$("#reply_password_inmodal").val('');
				$("#reply_id_inmodal").val('');
			    //get data-id attribute of the clicked element
			    var reply_id = $(e.relatedTarget).data('reply_id');
			    //populate the textbox
			    $(e.currentTarget).find('input[name="reply_password_inmodal"]').val(reply_id);
			    
				
			});
			
			
		}
		
		function reply_delete(){
			
		//reply_id와 password를 가져와야 한다.
			var check = false;
			var reply_id = $("#reply_id_inmodal").val();
			var reply_password =   $("#reply_password_inmodal").val();

			if ($("#reply_password_inmodal").val().trim() == "") {
				alert("비밀번호를 입력하세요.");
				$("#reply_password_inmodal").focus();
				return false;
			}

			//패스워드와 아이디를 넘겨 삭제를 한다.
			//값 셋팅
			var objParams = {
				reply_password : reply_password,
				reply_id : reply_id
			};

			//ajax 호출
			$.ajax({
				url : "${pageContext.request.contextPath}/boardReply_del_report",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post",
				async : false, //동기: false, 비동기: ture
				data : objParams,
				success : function(retVal) {

					if (retVal.code != "OK") {
						alert(retVal.message);
					} else {

						check = true;

					}

				},
				error : function(request, status, error) {
					console.log("AJAX_ERROR");
				}
			});

			location.reload();
			
			
		}
		
	function report_warning(report_rcdno){
		var user = "${pageContext.request.userPrincipal.name}";
		
		if(user==null || user ==""){
			alert("신고를 하시려면 로그인이 필요합니다");
			
		}else{
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
	
		function report_thumbup(report_rcdno){
			var user = "${pageContext.request.userPrincipal.name}";
			
			if(user==null || user ==""){
				alert("추천을 하시려면 로그인이 필요합니다");
				
			}else{
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
	
		function report_passwordCheck_admin(){
			var report_rcdno = '${report_rcdno}';
			location.href = "${pageContext.request.contextPath}/report_edit?report_rcdno="+report_rcdno;
		}
				
				
	function report_passwordCheck(){
			var report_password = $("#report_password").val();
			var report_rcdno = $("#report_password_inmodal").val();
			var objParams = {
					report_rcdno : report_rcdno,
					report_password : report_password
				};
		//ajax 호출
		$.ajax({
			url : "${pageContext.request.contextPath}/report_passwordCheck",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			data : objParams,
			success : function(data) {
				$("#report_password").val('');
				
				if (data == "success") {
					location.href = "${pageContext.request.contextPath}/report_edit?report_rcdno="+report_rcdno;
				} else {
					alert("비밀번호가 틀렸습니다. 다시 확인해 주세요.");
				}
			},
			error : function(request, status, error) {
				console.log("AJAX_ERROR");
				alert("오류가 발생했습니다");
				
			}
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

		//댓글 저장
		$("#reply_save").click(function() {
			//널 검사
			if ($("#reply_writer").val().trim() == "") {
				alert("이름을 입력하세요.");
				$("#reply_writer").focus();
				return false;
			}

			if ($("#reply_password").val().trim() == "") {
				alert("비밀번호를 입력하세요.");
				$("#reply_password").focus();
				return false;
			}

			if ($("#reply_content").val().trim() == "") {
				alert("내용을 입력하세요.");
				$("#reply_content").focus();
				return false;
			}

			var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
			var report_rcdno = '${report_rcdno}';
			//값 셋팅
			var objParams = {
				board_id : report_rcdno,
				parent_id : "0",
				depth : "0",
				reply_writer : $("#reply_writer").val(),
				reply_password : $("#reply_password").val(),
				reply_content : reply_content
			};

			var reply_id;

			//ajax 호출
			$.ajax({
				url : "${pageContext.request.contextPath}/boardReply_save_report",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post",
				async : false, //동기: false, 비동기: ture
				data : objParams,
				success : function(retVal) {
					
					if (retVal.code == "OK") {
						alert("성공적으로 댓글이 등록되었습니다.");
						reply_id = retVal.reply_id;
						location.reload();
					} else {
						alert("댓글 등록에 실패했습니다. 다시 시도해주세요.");
					}

				},
				error : function(request, status, error) {
					console.log("AJAX_ERROR");
				}
			});
		
		

		});

		//댓글 삭제
		$("button[name='reply_del']").click(function() {

			//reply_id와 password를 가져와야 한다.
			
			
			var check = false;
			var reply_id = $(this).attr("reply_id");
			var reply_password = "reply_password_" + reply_id;

			if ($("#" + reply_password).val().trim() == "") {
				alert("비밀번호를 입력하세요.");
				$("#" + reply_password).focus();
				return false;
			}

			//패스워드와 아이디를 넘겨 삭제를 한다.
			//값 셋팅
			var objParams = {
				reply_password : $("#" + reply_password).val(),
				reply_id : reply_id
			};

			//ajax 호출
			$.ajax({
				url : "${pageContext.request.contextPath}/boardReply_del_report",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post",
				async : false, //동기: false, 비동기: ture
				data : objParams,
				success : function(retVal) {

					if (retVal.code != "OK") {
						alert(retVal.message);
					} else {

						check = true;

					}

				},
				error : function(request, status, error) {
					console.log("AJAX_ERROR");
				}
			});

			location.reload();

		});

		//대댓글 입력창
		$(document).on("click", "button[name='reply_reply']", function() { //동적 이벤트

			$("#reply_add").remove();

			var reply_id = $(this).attr("reply_id");
			var last_check = false;//마지막 tr 체크

			//입력받는 창 등록
			var replyEditor = '<div id="reply_add" class="reply_reply">' + '	<div style = "width:100%">' + '	<textarea name="reply_reply_content" rows="1" style = "width:100%"></textarea>'+ '</div>	<div style = "text-align:right">	<input type="text" name="reply_reply_writer" style="width:30%; text-align:center" maxlength="10" placeholder="작성자"/>' + '		<input type="password" name="reply_reply_password" style="width:30%; text-align:center" maxlength="10" placeholder="비밀번호"/>' + '		<button name="reply_reply_save" reply_id="'+reply_id+'" type="button" class="btn btn-primary btn-xs">등록</button>' + '		<button name="reply_reply_cancel" type="button" class="btn  btn-default  btn-xs">취소</button>' + '	</div>' + '</div>';

			var prevTr = $(this).parent().parent().next();

			//부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
			//마지막 리플 처리
			if (prevTr.attr("reply_type") == undefined) {
				prevTr = $(this).parent().parent();
			} else {
				while (prevTr.attr("reply_type") == "sub") {//댓글의 다음이 sub면 계속 넘어감
					prevTr = prevTr.next();
				}

				if (prevTr.attr("reply_type") == undefined) {//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
					last_check = true;
				} else {
					prevTr = prevTr.prev();
				}

			}

			if (last_check) {//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
				$('#reply_area tr:last').after(replyEditor);
			} else {
				prevTr.after(replyEditor);
			}

		});

		//대댓글 등록
		$(document).on("click", "button[name='reply_reply_save']", function() {

			var reply_reply_writer = $("input[name='reply_reply_writer']");
			var reply_reply_password = $("input[name='reply_reply_password']");
			var reply_reply_content = $("textarea[name='reply_reply_content']");
			var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리

			//널 검사
			if (reply_reply_writer.val().trim() == "") {
				alert("이름을 입력하세요.");
				reply_reply_writer.focus();
				return false;
			}

			if (reply_reply_password.val().trim() == "") {
				alert("비밀번호를 입력하세요.");
				reply_reply_password.focus();
				return false;
			}

			if (reply_reply_content.val().trim() == "") {
				alert("내용을 입력하세요.");
				reply_reply_content.focus();
				return false;
			}
			var report_rcdno = '${report_rcdno}';
			//값 셋팅
			var objParams = {
				board_id : report_rcdno,
				parent_id : $(this).attr("reply_id"),
				depth : "1",
				reply_writer : reply_reply_writer.val(),
				reply_password : reply_reply_password.val(),
				reply_content : reply_reply_content_val
			};

			var reply_id;

			//ajax 호출
			$.ajax({
				url : "${pageContext.request.contextPath}/boardReply_save_report",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post",
				async : false, //동기: false, 비동기: ture
				data : objParams,
				success : function(retVal) {

					if (retVal.code != "OK") {
						alert(retVal.message);
					} else {
						reply_id = retVal.reply_id;
					}

				},
				error : function(request, status, error) {
					console.log("AJAX_ERROR");
				}
			});

			location.reload();
		});

		//대댓글 입력창 취소
		$(document).on("click", "button[name='reply_reply_cancel']", function() {
			$("#reply_add").remove();
		});
	</script>
</body>

</html>
