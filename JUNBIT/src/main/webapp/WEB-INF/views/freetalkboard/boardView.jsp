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
<title>비트코인 주식 제테크 - 준트</title>

<!-- PLUGINS CSS STYLE -->
<link href="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/listtyicons/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/bootstrapthumbnail/bootstrap-thumbnail.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/datepicker/datepicker.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/selectbox/select_option1.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/isotope/isotope.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/map/css/map.css" rel="stylesheet">

<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Muli:200,300,400,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">

<!-- CUSTOM CSS -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

<!-- FAVICON -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="shortcut icon">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- INTERNAL CSS STYLE -->
<style>
.mouseOverHighlight {
	border-bottom: 1px solid blue;
	cursor: pointer !important;
	color: blue;
	pointer-events: auto;
}
</style>
</head>
<body>




	<div class="page-loader" style="background: url(${pageContext.request.contextPath}/resources/img/preloader.gif) center no-repeat #fff;"></div>

	<div class="main-wrapper">
		<!-- HEADER FILE INCLUDE  -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- PAGE TITLE SECTION -->
		<section class="clearfix pageTitleSection bg-image" style="background-image: url(${pageContext.request.contextPath}/resources/img/background/bg-page-title.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="pageTitle">
						<h2>자유게시판 - 게시글쓰기</h2>
					</div>
				</div>
			</div>
		</div>
		</section>


		<section> <c:set var="login_username" value="${pageContext.request.userPrincipal.name}" /> <c:set var="database_username" value="${boardView.writer}" /> <input type="hidden"
			id="board_id" name="board_id" value="${boardView.id}" />
		<div align="center">
			</br> </br>
			<div class="row">
				<div class="col-xs-1"></div>
				<div class="col-xs-10">
					<table class="table table-hover table-bordered" border="1" width="1200px">
						<tr>

							<c:if test="${login_username eq database_username}">
								<td width="80%" align="middle"><input type="hidden" id="password" name="password" value="password" style="width: 200px;" maxlength="10" placeholder="패스워드" />
									<button id="modify" name="modify" class="btn btn-primary btn-lg" style="width: 10%; margin: 5px; background-color: mediumslateblue;">글 수정</button>
									<button id="delete" name="delete" class="btn btn-primary btn-lg" style="width: 10%; margin: 5px; background-color: crimson;">글 삭제</button>
									<button id="list" name="list" class="btn btn-primary btn-lg" style="width: 15%; margin: 5px">게시판으로</button></td>
							</c:if>
							<c:if test="${login_username ne database_username}">
								<td width="80%" align="middle"><input type="hidden" id="wrong_user" name="password" value="password" style="width: 200px;" maxlength="10" placeholder="패스워드" />
									<button id="list" name="list" class="btn btn-primary btn-lg" style="width: 15%; margin: 5px">게시판으로</button></td>
							</c:if>
							<td width="20%" style = "vertical-align: middle; text-align: center;">
							
							<span class="label label-success" style = "font-size: 100%;">추천수  ${boardView.good_point}</span>
							
							</td>

						</tr>
						<tr>
							<td width="80%">제목: ${boardView.subject}</td>
							<td>작성자: ${boardView.writer}</td>
						</tr>
						<tr height="500px">
							<td colspan="2" valign="top">${boardView.content}</td>
						</tr>
						<tr>
							<td colspan="2" align="middle">

								<button id="good_point" name="good_point" class="btn btn-primary btn-lg" style="width: 10%; margin: 5px">글 추천</button>
							</td>
						</tr>
					</table>
					<table class="table table-hover table-striped table-bordered" border="1" width="1200px" id="reply_area">
						<tr reply_type="all">
							<!-- 뒤에 댓글 붙이기 쉽게 선언 -->
							<td width="70%" style="font-weight: bold; text-align: center;">댓글</td>
							<td width="10%" style="font-weight: bold; text-align: center;">작성자</td>
							<td width="10%" style="font-weight: bold; text-align: center;">대댓글달기</td>
							<td width="10%" style="font-weight: bold; text-align: center;">삭제버튼</td>
						</tr>
						<!-- 댓글이 보여질 공간 -->
						<c:forEach var="replyList" items="${replyList}" varStatus="status">
							<c:set var="reply_username" value="${replyList.reply_writer}" />

							<tr reply_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>">
								<!-- 댓글의 depth 표시 -->
								<td width="70%"><c:if test="${replyList.depth == '1'}">
										<img src="../resources/img/buttonReplyImage.gif">
									</c:if>${replyList.reply_content}</td>
								<td width="10%">${replyList.reply_writer}</td>


								<td width="10%"><c:if test="${replyList.depth != '1'}">
										<!-- 대댓글 기능 나중에 보완 -->
										<button name="reply_reply" class="btn btn-primary" style="width: 100%; background-color: blueviolet" reply_id="${replyList.reply_id}">대댓 달기</button>
										<!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
									</c:if></td>


								<td width="10%"><c:if test="${login_username eq reply_username}">
										<input type="hidden" id="reply_password_${replyList.reply_id}" value="password" style="width: 100px;" maxlength="10" placeholder="password" />
										<button name="reply_del" class="btn btn-primary" style="width: 100%; background-color: crimson;" reply_id="${replyList.reply_id}">삭제</button>
									</c:if> <c:if test="${login_username ne reply_username}">
										<input type="hidden" id="reply_password_${replyList.reply_id}" value="wrong_user" style="width: 100px;" maxlength="10" placeholder="wrong_user" />
									</c:if></td>

							</tr>
						</c:forEach>
						<tr>



						</tr>

					</table>

					<!-- 댓글을 쓰는 공간 -->
					<table class="table table-hover table-bordered" border="1" width="1200px" bordercolor="#46AA46">
						<tr>
							<td width="90%"><textarea id="reply_content" name="reply_content" rows="2" cols="200%" placeholder="댓글을 입력하세요."></textarea></td>
							<td width="90%"><input type="hidden" id="reply_writer" name="reply_writer" style="width: 170px;" maxlength="10" value="${pageContext.request.userPrincipal.name}" /> <input type="hidden"
								value="password" id="reply_password" name="reply_password" style="width: 170px;" maxlength="10" placeholder="패스워드" />
								<button id="reply_save" name="reply_save" class="btn btn-primary" style="width: 100%">댓글 등록</button></td>
						</tr>
					</table>
				</div>
				<table width="1200px">
					<tr>
						<td align="right"></td>
					</tr>
				</table>
			</div>
			<div class="col-xs-1"></div>
		</div>

		</section>



		<!-- FOOTER FILE INCLUDE  -->
		<jsp:include page="footer.jsp"></jsp:include>


	</div>



	<!-- JAVASCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/counter-up/jquery.counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/isotope/isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/fancybox/jquery.fancybox.pack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/isotope/isotope-triger.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/map/js/rich-marker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/map/js/infobox_packed.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/single-map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>


	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();
			boardSetting();
			goodPointSetting();

		});
		

		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/freetalkboard") != -1) {

				$("#navmenu_freetalkboard").css("color", "#39a1f4");

			}

		}
		
		
		function goodPointSetting() {
			$("#good_point").click(function() {

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/good_point_processing",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : {
						"boardViewID" : "${boardView.id}"
					},
					async : false, //동기: false, 비동기: ture
					success : function(retVal) {

						if (retVal == "success") {
							alert('해당 글이 추천이 되었습니다.');
							location.href = "${pageContext.request.contextPath}/freetalkboard/view?id=" + $("#board_id").val();
							
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}

				});

			});
		}

		function boardSetting() {

			$("#list").click(function() {
				location.href = "${pageContext.request.contextPath}/freetalkboard/list";
			});

			//댓글 저장
			$("#reply_save").click(function() {

				//널 검사
				if ($("#reply_writer").val().trim() == "") {
					alert("이름을 입력하세요.");
					$("#reply_writer").focus();
					return false;
				}

				if ($("#reply_password").val().trim() == "") {
					alert("패스워드를 입력하세요.");
					$("#reply_password").focus();
					return false;
				}

				if ($("#reply_content").val().trim() == "") {
					alert("내용을 입력하세요.");
					$("#reply_content").focus();
					return false;
				}

				var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리

				//값 셋팅
				var objParams = {
					board_id : $("#board_id").val(),
					parent_id : "0",
					depth : "0",
					reply_writer : $("#reply_writer").val(),
					reply_password : $("#reply_password").val(),
					reply_content : reply_content
				};

				var reply_id;

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/freetalkboard/reply/save",
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

						if (retVal.code != "OK") {
							alert(retVal.message);

						} else {
							alert("댓글 등록에 성공하였습니다.");
							reply_id = retVal.reply_id;
							location.href = "${pageContext.request.contextPath}/freetalkboard/view?id=" + $("#board_id").val();
						}

					},
					error : function(request, status, error) {
						alert("댓글 등록에 실패하였습니다. 지속적인 오류 발생시 운영진에게 알려주시기 바랍니다.");
					}
				});

			});

			//댓글 삭제
			$("button[name='reply_del']").click(function() {

				var check = false;
				var reply_id = $(this).attr("reply_id");
				var reply_password = "reply_password_" + reply_id;

				if ($("#" + reply_password).val().trim() == "") {
					alert("패스워드을 입력하세요.");
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
					url : "${pageContext.request.contextPath}/freetalkboard/reply/del",
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

				if (check) {
					//삭제하면서 하위 댓글도 삭제
					var prevTr = $(this).parent().parent().next(); //댓글의 다음

					while (prevTr.attr("reply_type") == "sub") {//댓글의 다음이 sub면 계속 넘어감
						prevTr = prevTr.next();
						prevTr.prev().remove();
					}

					//마지막 리플 처리
					if (prevTr.attr("reply_type") == undefined) {
						prevTr = $(this).parent().parent();
						prevTr.remove();
					}

					$(this).parent().parent().remove();
				}

			});

			//대댓글 입력창
			$(document).on("click", "button[name='reply_reply']", function() { //동적 이벤트

				//만약 대댓글 창이 있다면,,,
				if ($('#reply_add').length) // use this if you are using id to check
				{
					$("#reply_add").remove();

				} else {

					var reply_id = $(this).attr("reply_id");
					var last_check = false;//마지막 tr 체크

					//입력받는 창 등록
					var replyEditor = '<tr id="reply_add" class="reply_reply">' + '	<td width="70%">' + '		<textarea name="reply_reply_content" rows="2" cols="160%"></textarea>' + '	</td>' + '	<td width="10%">' + '		${login_username}<input type="hidden" name="reply_reply_writer" value = "${login_username}" style="width:100%;" maxlength="10" />' + '	</td>' + '		<input type="hidden" name="reply_reply_password" style="width:100%;" value = "password" maxlength="10" />' + '		<td width="10%">' + '		<button name="reply_reply_save" class="btn btn-primary" style = "width: 100%"  reply_id="' + reply_id + '">대댓 등록</button></td>' + '			<td width="10%">' + '	</td>' + '</tr>';

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
					alert("패스워드를 입력하세요.");
					reply_reply_password.focus();
					return false;
				}

				if (reply_reply_content.val().trim() == "") {
					alert("내용을 입력하세요.");
					reply_reply_content.focus();
					return false;
				}

				//값 셋팅
				var objParams = {
					board_id : $("#board_id").val(),
					parent_id : $(this).attr("reply_id"),
					depth : "1",
					reply_writer : reply_reply_writer.val(),
					reply_password : reply_reply_password.val(),
					reply_content : reply_reply_content_val
				};

				var reply_id;

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/freetalkboard/reply/save",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					async : false, //동기: false, 비동기: ture
					data : objParams,
					success : function(retVal) {

						if (retVal.code != "OK") {
							alert(retVal.message);
						} else {
							alert('댓글 등록에 성공하였습니다');
							reply_id = retVal.reply_id;
							location.href = "${pageContext.request.contextPath}/freetalkboard/view?id=" + $("#board_id").val();
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			});

			//대댓글 입력창 취소
			$(document).on("click", "button[name='reply_reply_cancel']", function() {
				$("#reply_add").remove();
			});

			//글수정
			$("#modify").click(function() {

				var password = $("input[name='password']");

				if (password.val().trim() == "") {
					alert("패스워드를 입력하세요.");
					password.focus();
					return false;
				}

				//ajax로 패스워드 검수 후 수정 페이지로 포워딩
				//값 셋팅
				var objParams = {
					id : $("#board_id").val(),
					password : $("#password").val()
				};

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/freetalkboard/check",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					async : false, //동기: false, 비동기: ture
					data : objParams,
					success : function(retVal) {

						if (retVal.code != "OK") {
							console.log('edit is not ok');
							alert(retVal.message);
						} else {
							console.log('edit not ok');
							location.href = "${pageContext.request.contextPath}/freetalkboard/edit?id=" + $("#board_id").val();
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			});

			//글 삭제
			$("#delete").click(function() {

				var password = $("input[name='password']");

				if (password.val().trim() == "") {
					alert("패스워드를 입력하세요.");
					password.focus();
					return false;
				}

				//ajax로 패스워드 검수 후 수정 페이지로 포워딩
				//값 셋팅
				var objParams = {
					id : $("#board_id").val(),
					password : $("#password").val()
				};

				//ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/freetalkboard/del",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					async : false, //동기: false, 비동기: ture
					data : objParams,
					success : function(retVal) {

						if (retVal.code != "OK") {
							alert(retVal.message);
						} else {
							alert("삭제 되었습니다.");
							location.href = "${pageContext.request.contextPath}/freetalkboard/list";
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			});

		}
	</script>



</body>
</html>