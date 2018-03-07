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
					<h4>Be Showpinion</h4>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>

	<div class="container">
		<div class="center-heading">

			<h2>${detail_tvTopic.sp_tvtopics_title}</h2>
			<!-- 주제 작성자와 현재 로그인한 작성자가 같을 시에만, 주제수정버튼과 주제 삭제 버튼을 보이게 한다.  -->
			<c:if test="${detail_tvTopic.writer_infomation.rcdno eq loginUserInfo.rcdno}">
				<div>
					<a href="${pageContext.request.contextPath}/admin_edit_TVTopic?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno}" type="button" class="btn btn-primary" id="topic_edit_BT">주제 수정</a> <a type="button"
						class="btn btn-primary" onclick="topic_deleteBT_click(${detail_tvTopic.sp_tvtopics_rcdno})" id="topic_deleteBT">주제 삭제</a>
				</div>
			</c:if>

			<span class="center-line"></span>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="blog-post">
					<ul class="list-inline post-detail">
						<!-- 작성자의 openName에 따라 공개되는 이름이 다르다. -->
						<c:choose>
							<c:when test="${detail_tvTopic.writer_infomation.openname eq '닉네임'}">
								<c:set value="${detail_tvTopic.writer_infomation.nickname}" var="writerOpenName" />
							</c:when>
							<c:when test="${detail_tvTopic.writer_infomation.openname eq '이름'}">
								<c:set value="${detail_tvTopic.writer_infomation.realname}" var="writerOpenName" />
							</c:when>
						</c:choose>

						<li><i class="fa fa-user"></i>&nbsp<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${detail_tvTopic.writer_infomation.rcdno}" data-toggle="tooltip" data-placement="top"
							title="본 주제에 대하여 정리를 해주신 ${writerOpenName}님께 깊은 감사를 드립니다. "><span>작성자:</span>${writerOpenName}</a></li>
						<li><i class="fa fa-calendar"></i>&nbsp<span>작성일:</span> ${detail_tvTopic.sp_tvtopics_write_date }</li>
						<li><i class="fa fas fa-eye"></i> &nbsp<span>조회수:</span>${detail_tvTopic.sp_tvtopics_view }회</li>
						<li><i class="fa fa-comments"></i> &nbsp<a href="#"><span>의견:<c:out value="${fn:length(opinions_list_normal) + fn:length(opinions_list_show)}" />개
							</span></a></li>
					</ul>
					<div class="divide30"></div>
					<h3 class="heading">문제 상황</h3>
					<p>${detail_tvTopic.sp_tvtopics_situation_desc }</p>
					<div class="divide50"></div>
					<h3 class="heading">찬성 반대 근거</h3>
					<div class="row">
						<div class="col-sm-6 margin30">
							<div class="grid-boxed" data-toggle="tooltip" data-placement="top" title="찬성측  주요 30자 근거" style="border: 4px solid #59df57; border-radius: 5px;">
								<h4>찬성 측 주요 근거</h4>
								<p>
									<span class="label label-success" style="margin-right: 10px">1번째</span>${detail_tvTopic.sp_tvtopics_pro1 }</p>
								<c:if test="${!empty detail_tvTopic.sp_tvtopics_pro2}">
									<p>
										<span class="label label-success" style="margin-right: 10px">2번쨰</span>${detail_tvTopic.sp_tvtopics_pro2 }</p>
								</c:if>
								<c:if test="${!empty detail_tvTopic.sp_tvtopics_pro3}">
									<p>
										<span class="label label-success" style="margin-right: 10px">3번쨰</span>${detail_tvTopic.sp_tvtopics_pro3 }</p>
								</c:if>

							</div>
						</div>
						<div class="col-sm-6 margin30">
							<div class="grid-boxed" data-toggle="tooltip" data-placement="top" title="반대측  주요 30자 근거" style="border: 4px solid #df5759; border-radius: 5px;">
								<h4>반대 측 주요 근거</h4>
								<p>
									<span class="label label-danger" style="margin-right: 10px">1번쨰</span>${detail_tvTopic.sp_tvtopics_con1 }</p>
								<c:if test="${!empty detail_tvTopic.sp_tvtopics_con2}">
									<p>
										<span class="label label-danger" style="margin-right: 10px">2번쨰</span>${detail_tvTopic.sp_tvtopics_con2 }</p>
								</c:if>
								<c:if test="${!empty detail_tvTopic.sp_tvtopics_con3}">
									<p>
										<span class="label label-danger" style="margin-right: 10px">3번쨰</span>${detail_tvTopic.sp_tvtopics_con3 }</p>
								</c:if>
							</div>
						</div>

					</div>
					<div style="text-align: center">
						<a href="${pageContext.request.contextPath}/writeShowpinion?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }" class="btn btn-theme-bg btn-ico btn-lg" style="width: 90%; margin: 5px">의견 쓰기
							&nbsp <i class="fas fa-pen-square"></i>
						</a>
					</div>
					<div style="text-align: center">
						<a href="${pageContext.request.contextPath}/writeShowpinion?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }" class="btn btn-fb-login btn-lg" style="width: 90%; margin: 5px"> SNS에 주제 공유하기
							&nbsp <i class="fab fa-facebook-square"></i>
						</a>
					</div>
				</div>
				<!--blog post-->

			</div>
			<!--col-->
			<div class="col-md-3 col-md-offset-1">
				<div class="row">

					<!-- TV 토론주제면 방송정보 보여주고, 일반 토론주제면 보여주지 말자   -->
					<c:if test="${detail_tvTopic.sp_tvtopics_type eq 'tvshow'}">
						<div class="col-md-12 margin20">
							<div class="team-wrap">
								<img src="${pageContext.request.contextPath}/${detail_tvTopic.sp_tvtopics_tvshow_imgurl}" onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_tvshow_img.png';" style="margin: 0 auto" class="img-responsive" alt="">
								<h4>${detail_tvTopic.sp_tvtopics_tvshow_name }</h4>
								<c:if test="${detail_tvTopic.sp_tvtopics_tvshow_date eq '0001-01-01'}">
									<span>방영 날짜: 정보 없음</span>
								</c:if>
								<p>방송 설명: ${detail_tvTopic.sp_tvtopics_tvshow_desc }</p>
							</div>
							<!--team-wrap-->
						</div>
					</c:if>
					<c:if test="${detail_tvTopic.sp_tvtopics_type ne 'normal'}">
					</c:if>

					<!--team col-->
					<div class="col-md-12 margin20">
						<div class="team-wrap" id="showpinion_chart_div" style="border: 4px solid #59df57; border-radius: 5px;">
							<h4>쇼피니언 지수</h4>
							<div id="showpinion_chart"></div>
						</div>
						<!--team-wrap-->
					</div>
					<!--team col-->
					<div class="col-md-12 margin20">
						<div class="team-wrap" id="normal_chart_div" style="border: 4px solid #59df57; border-radius: 5px;">
							<h4>일반 의견 지수</h4>
							<div id="normal_chart"></div>
						</div>
						<!--team-wrap-->
					</div>
					<!--team col-->
				</div>
			</div>
			<!--row for blog post-->
		</div>
	</div>
	<!--blog full main container-->
	<div class="divide60"></div>
	<!-- 나의 의견 시작 -->
	<div class="container">
		<div class="row">
			<h3 class="heading">
				내가 남긴 의견 &nbsp&nbsp <span style="font-weight: normal; font-size: smaller; color: #b3bfdd"><i class="fa fa-comment"></i> ${fn:length(my_opinions_list)} </span>
			</h3>
		</div>
	</div>
	<div class="container">
		<!--row-->
		<div class="row">
			<div class="">
				<div id="testi-carousel" class="owl-carousel owl-theme owl-spaced">

					<!-- 만약에 리스트에 단 한개도 존재하지 않으면.... -->
					<c:if test="${fn:length(my_opinions_list) eq 0}">
						<div class="about-author text_align_center" style="font: 20px; font-weight:bold; border-radius: 3%; border: 1px solid ${side_color}; border-radius: 5px;">
							아직 등록된 의견이 없습니다. 자신의 의견을 등록해주세요. <a href="${pageContext.request.contextPath}/writeShowpinion?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }" class="btn btn-theme-bg btn-ico btn-lg"
								style="width: 90%; margin: 5px">의견 쓰기 &nbsp <i class="fas fa-pen-square"></i></a>
						</div>
					</c:if>

					<c:forEach var="listValue_opinion" items="${my_opinions_list}">

						<!-- 찬성 반대에 따라 겉을 둘러싸는 색이 달라짐 설정하기 -->
						<c:choose>
							<c:when test="${listValue_opinion.sp_opinion_side  eq 'pro'}">
								<c:set var="side_color" value="#59df57" />
							</c:when>
							<c:otherwise>
								<c:set var="side_color" value="#df5759" />
							</c:otherwise>
						</c:choose>
						
						<div class="about-author" style="border-radius: 3%; border: 4px solid ${side_color}; border-radius: 5px;">
							<div class="row">
								<div class="col-md-3" style="text-align: center">
									<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_opinion.writer_infomation.rcdno }"><img
										src="${pageContext.request.contextPath}/${listValue_opinion.writer_infomation.sp_user_picUrl }" onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_user_img.png';" class="img-responsive" alt="" style="border-radius: 50%; width: 60px; height: 60px"></a>
									<!-- 이름, 닉네임 공개 여부에 따라 글쓴이의 정보 설정 -->
									<p style="margin: 2px">
										<c:if test="${listValue_opinion.writer_infomation.openname eq '이름'}">
											<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_opinion.writer_infomation.rcdno }">${listValue_opinion.writer_infomation.realname}</a>
										</c:if>
										<c:if test="${listValue_opinion.writer_infomation.openname eq '닉네임'}">
											<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_opinion.writer_infomation.rcdno }"> ${listValue_opinion.writer_infomation.nickname}</a>
										</c:if>
									</p>
									<p style="font-size: 80%; color: gray; margin: 2px">${listValue_opinion.sp_opinion_datetime }</p>
								</div>
								<div class="col-md-5" style="">

									<h4 class="colored-text" style="height: 50px; line-height: 50px; white-space: nowrap;">
										<a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${listValue_opinion.sp_opinion_topicrcdno }">${listValue_opinion.sp_opinion_topictitle }</a>
									</h4>
								</div>
								<div class="col-md-4">
									<div>
										본 문제에 관하여
										<c:if test="${listValue_opinion.sp_opinion_side eq 'pro'}">
											<span style="color: #59df57; font-weight: bold;">찬성</span>
										</c:if>
										<c:if test="${listValue_opinion.sp_opinion_side eq 'con'}">
											<span style="color: #df5759; font-weight: bold;">반대</span>
										</c:if>
										입장을 가지고 있습니다.
									</div>
									<p>
										<!-- 해당부분은 쇼피니언 의견입니다. -->
										<span data-toggle="tooltip" data-placement="top" title="본인의 의견을 SNS에 올리시면, 쇼피니언 지수가 높아집니다.">* 본 의견은 <c:if test="${listValue_opinion.sp_opinion_type eq 'normal'}">
							'일반'
						</c:if> <c:if test="${listValue_opinion.sp_opinion_type eq 'show'}">
						'쇼피니언'
						</c:if> 의견입니다 <i class="fa fa-question-circle"></i></span>
									</p>
								</div>
							</div>
							<div class="row" style="margin-top: 5px">
								<div class="col-md-6">
									<p style="font-weight: bold;">
										나의
										<c:if test="${listValue_opinion.sp_opinion_side eq 'pro'}">
							찬성
						</c:if>
										<c:if test="${listValue_opinion.sp_opinion_side eq 'con'}">
						반대
						</c:if>
										근거
									</p>
									<p>
										<span class="badge" style="text-align: left; border-radius: 15%">결정적 이유</span>&nbsp ${listValue_opinion.sp_opinion_reason1 }
									</p>
									<p>
										<c:if test="${listValue_opinion.sp_opinion_reason2 ne '0'}">
											<span class="badge" style="text-align: left; border-radius: 15%">Top2</span>&nbsp ${listValue_opinion.sp_opinion_reason2 }
							</c:if>

									</p>
									<p>
										<c:if test="${listValue_opinion.sp_opinion_reason3 ne '0'}">
											<span class="badge" style="text-align: left; border-radius: 15%">Top3</span>&nbsp ${listValue_opinion.sp_opinion_reason3 }
							</c:if>
									</p>
								</div>
								<div class="col-md-6" style="">
									<p style="font-weight: bold;">공감하는 반대편 근거</p>
									<p>
										<span class="label label-warning">공감: <span>${listValue_opinion.sp_opinion_opreason1_agree }</span>%
										</span>&nbsp ${listValue_opinion.sp_opinion_opreason1}
									</p>
									<p>
										<c:if test="${listValue_opinion.sp_opinion_opreason2 ne '0'}">
											<span class="label label-warning">공감: <span>${listValue_opinion.sp_opinion_opreason2_agree }</span>%
											</span>&nbsp ${listValue_opinion.sp_opinion_opreason2}
									</c:if>


									</p>
									<p>
										<c:if test="${listValue_opinion.sp_opinion_opreason3 ne '0'}">
											<span class="label label-warning">공감: <span>${listValue_opinion.sp_opinion_opreason3_agree }</span>%
											</span>&nbsp ${listValue_opinion.sp_opinion_opreason3}
									</c:if>
									</p>
								</div>
							</div>

							<div class="row" style="margin-top: 5px">

								<div class="col-md-10" style="">
									<div style="font-weight: bold;">상세 의견</div>

									${listValue_opinion.sp_opinion_detail }
								</div>
							</div>
							<!-- 의견_의댓글 부분 시작 -->
							<div class="row" style="text-align: right;">

								<a onclick="opinion_warning(${listValue_opinion.sp_opinion_rcdno})"><i class="fa fa-exclamation-circle"></i> 신고</a> <a onclick="opinion_thumbup(${listValue_opinion.sp_opinion_rcdno})"> <i
									class="far fa-thumbs-up"></i> 추천+<span>${listValue_opinion.sp_opinion_thumbup}</span></a> <a
									href="${pageContext.request.contextPath}/detail_opinion?opinion_rcdno=${listValue_opinion.sp_opinion_rcdno }"> <i class="fa fa-comments"></i>자세히보기
								</a>
							</div>

						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!--img slide row-->
	</div>

	<div class="divide80"></div>


	<!-- 쇼피니언의견 시작 -->
	<div class="container">
		<div class="row">
			<h3 class="heading">
				쇼피니언 의견 &nbsp&nbsp <span style="font-weight: normal; font-size: smaller; color: #b3bfdd"><i class="fa fa-comment"></i> ${fn:length(opinions_list_show)} </span>
			</h3>
			<div class="dropdown" style="text-align: right">
				<button class="btn btn-default dropdown-toggle" type="button" id="show_opinion_order" data-toggle="dropdown">
					최신순 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="show_opinion_order">
					<li role="presentation"><a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }&opinion_order=recent" role="menuitem" tabindex="-1">최신순</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }&opinion_order=thumbup" role="menuitem" tabindex="-1">추천순</a></li>
				</ul>
				<a href="${pageContext.request.contextPath}/writeShowpinion?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }" type="button" class="btn btn-primary">의견쓰기</a>
			</div>

			<!-- 만약에 리스트에 단 한개도 존재하지 않으면.... -->
			<c:if test="${fn:length(opinions_list_show) eq 0}">
				<div class="about-author text_align_center" style="font: 20px; font-weight:bold; border-radius: 3%; border: 1px solid ${side_color}; border-radius: 5px;">
					아직 등록된 의견이 없습니다. 자신의 의견을 등록해주세요. <a href="${pageContext.request.contextPath}/writeShowpinion?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }" class="btn btn-theme-bg btn-ico btn-lg"
						style="width: 90%; margin: 5px">의견 쓰기 &nbsp <i class="fas fa-pen-square"></i></a>
				</div>
			</c:if>
			<c:forEach var="listValue_opinion" items="${opinions_list_show}">
				<!-- 찬성 반대에 따라 겉을 둘러싸는 색이 달라짐 설정하기 -->
				<c:choose>
					<c:when test="${listValue_opinion.sp_opinion_side  eq 'pro'}">
						<c:set var="side_color" value="#59df57" />
					</c:when>
					<c:otherwise>
						<c:set var="side_color" value="#df5759" />
					</c:otherwise>
				</c:choose>

				<div class="about-author" style="border-radius: 3%; border: 4px solid ${side_color}; border-radius: 5px;">

					<div class="row">

						<div class="col-md-3" style="text-align: center">
							<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_opinion.writer_infomation.rcdno }"><img
								src="${pageContext.request.contextPath}/${listValue_opinion.writer_infomation.sp_user_picUrl }" onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_user_img.png';" class="img-responsive" alt="" style="border-radius: 50%; width: 60px; height: 60px"></a>
							<!-- 이름, 닉네임 공개 여부에 따라 글쓴이의 정보 설정 -->
							<p style="margin: 2px">
								<c:if test="${listValue_opinion.writer_infomation.openname eq '이름'}">
									<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_opinion.writer_infomation.rcdno }">${listValue_opinion.writer_infomation.realname}</a>
								</c:if>
								<c:if test="${listValue_opinion.writer_infomation.openname eq '닉네임'}">
									<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_opinion.writer_infomation.rcdno }"> ${listValue_opinion.writer_infomation.nickname}</a>
								</c:if>
							</p>
							<p style="font-size: 80%; color: gray; margin: 2px">${listValue_opinion.sp_opinion_datetime }</p>
						</div>
						<div class="col-md-5" style="">

							<h4 class="colored-text" style="height: 50px; line-height: 50px; white-space: nowrap;">
								<a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${listValue_opinion.sp_opinion_topicrcdno }">${listValue_opinion.sp_opinion_topictitle }</a>
							</h4>
						</div>
						<div class="col-md-4">
							<div>
								본 문제에 관하여
								<c:if test="${listValue_opinion.sp_opinion_side eq 'pro'}">
									<span style="color: #59df57; font-weight: bold;">찬성</span>
								</c:if>
								<c:if test="${listValue_opinion.sp_opinion_side eq 'con'}">
									<span style="color: #df5759; font-weight: bold;">반대</span>
								</c:if>
								입장을 가지고 있습니다.
							</div>
							<p>
								<!-- 해당부분은 쇼피니언 의견입니다. -->
								<span data-toggle="tooltip" data-placement="top" title="본인의 의견을 SNS에 올리시면, 쇼피니언 지수가 높아집니다.">* 본 의견은 <c:if test="${listValue_opinion.sp_opinion_type eq 'normal'}">
							'일반'
						</c:if> <c:if test="${listValue_opinion.sp_opinion_type eq 'show'}">
						'쇼피니언'
						</c:if> 의견입니다 <i class="fa fa-question-circle"></i></span>
							</p>
						</div>
					</div>
					<div class="row" style="margin-top: 5px">
						<div class="col-md-6">
							<p style="font-weight: bold;">
								나의
								<c:if test="${listValue_opinion.sp_opinion_side eq 'pro'}">
							찬성
						</c:if>
								<c:if test="${listValue_opinion.sp_opinion_side eq 'con'}">
						반대
						</c:if>
								근거
							</p>
							<p>
								<span class="badge" style="text-align: left; border-radius: 15%">결정적 이유</span>&nbsp ${listValue_opinion.sp_opinion_reason1 }
							</p>
							<p>
								<c:if test="${listValue_opinion.sp_opinion_reason2 ne '0'}">
									<span class="badge" style="text-align: left; border-radius: 15%">Top2</span>&nbsp ${listValue_opinion.sp_opinion_reason2 }
							</c:if>

							</p>
							<p>
								<c:if test="${listValue_opinion.sp_opinion_reason3 ne '0'}">
									<span class="badge" style="text-align: left; border-radius: 15%">Top3</span>&nbsp ${listValue_opinion.sp_opinion_reason3 }
							</c:if>
							</p>
						</div>
						<div class="col-md-6" style="">
							<p style="font-weight: bold;">공감하는 반대편 근거</p>
							<p>
								<span class="label label-warning">공감: <span>${listValue_opinion.sp_opinion_opreason1_agree }</span>%
								</span>&nbsp ${listValue_opinion.sp_opinion_opreason1}
							</p>
							<p>
								<c:if test="${listValue_opinion.sp_opinion_opreason2 ne '0'}">
									<span class="label label-warning">공감: <span>${listValue_opinion.sp_opinion_opreason2_agree }</span>%
									</span>&nbsp ${listValue_opinion.sp_opinion_opreason2}
									</c:if>


							</p>
							<p>
								<c:if test="${listValue_opinion.sp_opinion_opreason3 ne '0'}">
									<span class="label label-warning">공감: <span>${listValue_opinion.sp_opinion_opreason3_agree }</span>%
									</span>&nbsp ${listValue_opinion.sp_opinion_opreason3}
									</c:if>
							</p>
						</div>
					</div>

					<div class="row" style="margin-top: 5px">

						<div class="col-md-10" style="">
							<div style="font-weight: bold;">상세 의견</div>

							${listValue_opinion.sp_opinion_detail }
						</div>
					</div>
					<!-- 의견_의댓글 부분 시작 -->
					<div class="row" style="text-align: right;">
						<!-- 의견 수정 및 삭제 버튼, 현재 로그인한 작성자가 같을 시에만, 보이게 한다 -->
						<c:if test="${listValue_opinion.writer_infomation.rcdno eq loginUserInfo.rcdno}">
							<div style="text-align: right;">
								<a href="${pageContext.request.contextPath}/opinion_update?opinion_rcdno=${listValue_opinion.sp_opinion_rcdno}&user_rcdno=${listValue_opinion.sp_opinion_writer}" id="opinion_edit_BT"><i
									class="fas fa-eraser"></i>수정</a> <a onclick="opinion_deleteBT_click(${listValue_opinion.sp_opinion_rcdno})" id="opinion_deleteBT"><i class="fas fa-trash-alt"></i>삭제</a>
							</div>
						</c:if>

						<a onclick="opinion_warning(${listValue_opinion.sp_opinion_rcdno})"><i class="fa fa-exclamation-circle"></i> 신고</a> <a onclick="opinion_thumbup(${listValue_opinion.sp_opinion_rcdno})"> <i
							class="far fa-thumbs-up"></i> 추천+<span>${listValue_opinion.sp_opinion_thumbup}</span></a> <a class="opinion_replysave_BT" id="opinion_replysave_BT_${listValue_opinion.sp_opinion_rcdno}"
							name="opinion_replysave_BT_${listValue_opinion.sp_opinion_rcdno}" onclick="opinion_reply_save(${listValue_opinion.sp_opinion_rcdno})" style="color: #286090"> <i class="fa fa-pen-square"></i>
							댓글쓰기
						</a> <a id="opinion_reply_showBT_${listValue_opinion.sp_opinion_rcdno}" onclick="opinion_reply_showBT(${listValue_opinion.sp_opinion_rcdno})"> <i class="fa fa-comments"></i> 댓글 <span> <span
								class="opinion_reply_number" opinion_rcdno="${listValue_opinion.sp_opinion_rcdno}" id="opinion_re_reply_number_${listValue_opinion.sp_opinion_rcdno}">3</span>개
						</span></a>
					</div>
					<!-- 댓글 부분의 첫 번째 의견 남기는 textarea -->
					<div class="" style="text-align: right">
						<textarea class="opinion_reply_Editor" rows="3" id="opinion_ReplyEditor_${listValue_opinion.sp_opinion_rcdno}" name="opinion_ReReplyEditor_${listValue_reply.sp_topic_reply_rcdno}"
							style="width: 100%; margin: 0 auto;" cols=""></textarea>
					</div>
					<!-- 댓글 부분의 부모 댓글 시작-->
					<c:forEach var="opinionReply" items="${listValue_opinion.opinionReplys}" varStatus="indexNum">
						<c:if test="${opinionReply.sp_opinion_reply_depth == '0'}">
							<c:set var="reply_type" value="opinion_reply" />
							<c:set var="reply_class_with_parent_rcdno" value="opinion_reply_${opinionReply.sp_opinion_reply_opinionRcdno}" />
						</c:if>

						<c:if test="${opinionReply.sp_opinion_reply_depth == '1'}">
							<c:set var="reply_type" value="opinion_re_reply" />
							<c:set var="reply_class_with_parent_rcdno" value="opinion_re_reply_${opinionReply.sp_opinion_reply_parentRcdno}" />
						</c:if>

						<div class="row ${reply_type} ${reply_class_with_parent_rcdno} opinionReplySection opinionReplySection_${listValue_opinion.sp_opinion_rcdno}" style="margin-top: 5px">
							<div class="col-md-6" style="">
								<div>
									<c:if test="${opinionReply.sp_opinion_reply_depth == '0'}">
										- 
									</c:if>

									<c:if test="${opinionReply.sp_opinion_reply_depth == '1'}">
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-level-up-alt fa-rotate-90"></i>
									</c:if>
									&nbsp&nbsp${opinionReply.sp_opinion_reply_content}
								</div>
							</div>
							<div class="col-md-6 text_align_right" style="">
								<div>
									<a onclick="opinion_reply_warning(${opinionReply.sp_opinion_reply_rcdno})"><i class="fa fa-exclamation-circle"></i></a><a
										onclick="opinion_reply_thumbup(${opinionReply.sp_opinion_reply_rcdno})"> <i class="far fa-thumbs-up"></i><span>+${opinionReply.sp_opinion_reply_thumbup } </span></a>
									<c:if test="${opinionReply.writer_infomation.openname eq '이름'}">
										<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${opinionReply.writer_infomation.rcdno }"><i class="fa fa-user"></i>&nbsp${opinionReply.writer_infomation.realname}
											&nbsp&nbsp&nbsp&nbsp </a>
									</c:if>
									<c:if test="${opinionReply.writer_infomation.openname eq '닉네임'}">
										<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${opinionReply.writer_infomation.rcdno }"> <i class="fa fa-user"></i>&nbsp${opinionReply.writer_infomation.nickname}
											&nbsp&nbsp&nbsp&nbsp
										</a>
									</c:if>
									<i class="fa fa-calendar"></i>&nbsp${opinionReply.sp_opinion_reply_datetime}
									<!-- 부모 댓글에만 답글표시와 답글등록 버튼을 보이게 한다.  -->
									<c:if test="${opinionReply.sp_opinion_reply_depth == '0'}">
										<a class="opinion_re_reply_saveBT" style="color: #286090" id="opinion_re_reply_saveBT_${opinionReply.sp_opinion_reply_rcdno}"
											onclick="opinion_re_reply_save(${opinionReply.sp_opinion_reply_opinionRcdno},${opinionReply.sp_opinion_reply_rcdno})"> <i class="fa fa-pen-square"></i> <span>답글등록</span></a>
										<a onclick="opinion_re_reply_showBT_Click(${opinionReply.sp_opinion_reply_rcdno},${opinionReply.sp_opinion_reply_parentRcdno})"> <i class="fa fa-comments"></i> +<span
											class="opinion_re_reply_number" reply_rcdno="${opinionReply.sp_opinion_reply_rcdno}" id="opinion_re_reply_number_${opinionReply.sp_opinion_reply_rcdno}">0</span></a>

									</c:if>
									<!-- 의견 _댓글 및 삭제 버튼, 현재 로그인한 작성자가 같을 시에만, 보이게 한다 -->
									<c:if test="${opinionReply.writer_infomation.rcdno eq loginUserInfo.rcdno}">
										<a onclick="opinionReply_deleteBT_click(${opinionReply.sp_opinion_reply_rcdno})" id="">삭제</a>
									</c:if>
								</div>
								<div></div>
							</div>
							<!-- 대댓글 쓰는 공간, 대댓글에는 대댓글 쓰는 공간이 없도록 하자, 가장 부모일때만 대댓글을 달 수 있게 만들었다. -->
							<c:if test="${opinionReply.sp_opinion_reply_depth == '0'}">
								<div class="text_align_right" style="">
									<textarea rows="4" class="opinion_ReReplyEditor" id="opinion_ReReplyEditor_${opinionReply.sp_opinion_reply_rcdno}" name="opinion_ReReplyEditor_${opinionReply.sp_opinion_reply_rcdno}"
										style="width: 100%; margin: 0 auto;" cols=""></textarea>
								</div>
							</c:if>

						</div>
					</c:forEach>
					<!-- 대댓글 공간끝  -->
				</div>
			</c:forEach>
		</div>
		<!-- GALLERY ITEM END -->


		<!-- 더보기는 나중에 개발 -->
		<!--
			<ul class="pager">
				<li class=""><a href="#" style="width: 100%">댓글 더보기 <span>&nbsp &nbsp&nbsp<i class="fa fa-commenting-o" aria-hidden="true"></i> 6개의 의견이 더 존재합니다
					</span></a></li>
			</ul> -->
	</div>

	<!-- 일반 의견 시작 -->
	<!--blog full main container-->
	<div class="divide60"></div>
	<div class="container">
		<div class="row">
			<h3 class="heading">
				일반 의견 &nbsp&nbsp <span style="font-weight: normal; font-size: smaller; color: #b3bfdd"><i class="fa fa-comment"></i> ${fn:length(opinions_list_normal)} </span>
			</h3>
			<div class="dropdown" style="text-align: right">
				<button class="btn btn-default dropdown-toggle" type="button" id="normal_opinion_order" data-toggle="dropdown">
					최신순 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="normal_opinion_order">
					<li role="presentation"><a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }&opinion_order=recent" role="menuitem" tabindex="-1">최신순</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }&opinion_order=thumbup" role="menuitem" tabindex="-1">추천순</a></li>
				</ul>
				<a href="${pageContext.request.contextPath}/writeShowpinion?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }" type="button" class="btn btn-primary">의견쓰기</a>
			</div>

			<!-- 만약에 리스트에 단 한개도 존재하지 않으면.... -->
			<c:if test="${fn:length(opinions_list_normal) eq 0}">
				<div class="about-author text_align_center" style="font: 20px; font-weight:bold; border-radius: 3%; border: 1px solid ${side_color}; border-radius: 5px;">
					아직 등록된 의견이 없습니다. 자신의 의견을 등록해주세요. <a href="${pageContext.request.contextPath}/writeShowpinion?topic_rcdno=${detail_tvTopic.sp_tvtopics_rcdno }" class="btn btn-theme-bg btn-ico btn-lg"
						style="width: 90%; margin: 5px">의견 쓰기 &nbsp <i class="fas fa-pen-square"></i></a>
				</div>
			</c:if>

			<c:forEach var="listValue_opinion" items="${opinions_list_normal}">
				<!-- 찬성 반대에 따라 겉을 둘러싸는 색이 달라짐 설정하기 -->
				<c:choose>
					<c:when test="${listValue_opinion.sp_opinion_side  eq 'pro'}">
						<c:set var="side_color" value="#59df57" />
					</c:when>
					<c:otherwise>
						<c:set var="side_color" value="#df5759" />
					</c:otherwise>
				</c:choose>

				<div class="about-author" style="border-radius: 3%; border: 4px solid ${side_color}; border-radius: 5px;">

					<div class="row">

						<div class="col-md-3" style="text-align: center">
							<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_opinion.writer_infomation.rcdno }"><img
								src="${pageContext.request.contextPath}/${listValue_opinion.writer_infomation.sp_user_picUrl }"  class="img-responsive" alt="" onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_user_img.png';" style="border-radius: 50%; width: 60px; height: 60px"></a>
							<!-- 이름, 닉네임 공개 여부에 따라 글쓴이의 정보 설정 -->
							<p style="margin: 2px">
								<c:if test="${listValue_opinion.writer_infomation.openname eq '이름'}">
									<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_opinion.writer_infomation.rcdno }">${listValue_opinion.writer_infomation.realname}</a>
								</c:if>
								<c:if test="${listValue_opinion.writer_infomation.openname eq '닉네임'}">
									<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_opinion.writer_infomation.rcdno }"> ${listValue_opinion.writer_infomation.nickname}</a>
								</c:if>
							</p>
							<p style="font-size: 80%; color: gray; margin: 2px">${listValue_opinion.sp_opinion_datetime }</p>
						</div>
						<div class="col-md-5" style="">
							<h4 class="colored-text" style="height: 50px; line-height: 50px; white-space: nowrap;">
								<a href="${pageContext.request.contextPath}/detail_TVshow_Topics?topic_rcdno=${listValue_opinion.sp_opinion_topicrcdno }">${listValue_opinion.sp_opinion_topictitle }</a>
							</h4>
						</div>
						<div class="col-md-4">
							<div>
								본 문제에 관하여
								<c:if test="${listValue_opinion.sp_opinion_side eq 'pro'}">
									<span style="color: #59df57; font-weight: bold;">찬성</span>
								</c:if>
								<c:if test="${listValue_opinion.sp_opinion_side eq 'con'}">
									<span style="color: #df5759; font-weight: bold;">반대</span>
								</c:if>
								입장을 가지고 있습니다.
							</div>
							<p>
								<!-- 해당부분은 쇼피니언 의견입니다. -->
								<span data-toggle="tooltip" data-placement="top" title="본인의 의견을 SNS에 올리시면, 쇼피니언 지수가 높아집니다.">* 본 의견은 <c:if test="${listValue_opinion.sp_opinion_type eq 'normal'}">
							'일반'
						</c:if> <c:if test="${listValue_opinion.sp_opinion_type eq 'show'}">
						'쇼피니언'
						</c:if> 의견입니다 <i class="fa fa-question-circle"></i></span>
							</p>
						</div>
					</div>
					<div class="row" style="margin-top: 5px">
						<div class="col-md-6">
							<p style="font-weight: bold;">
								나의
								<c:if test="${listValue_opinion.sp_opinion_side eq 'pro'}">
							찬성
						</c:if>
								<c:if test="${listValue_opinion.sp_opinion_side eq 'con'}">
						반대
						</c:if>
								근거
							</p>
							<p>
								<span class="badge" style="text-align: left; border-radius: 15%">결정적 이유</span>&nbsp ${listValue_opinion.sp_opinion_reason1 }
							</p>
							<p>
								<c:if test="${listValue_opinion.sp_opinion_reason2 ne '0'}">
									<span class="badge" style="text-align: left; border-radius: 15%">Top2</span>&nbsp ${listValue_opinion.sp_opinion_reason2 }
							</c:if>

							</p>
							<p>
								<c:if test="${listValue_opinion.sp_opinion_reason3 ne '0'}">
									<span class="badge" style="text-align: left; border-radius: 15%">Top3</span>&nbsp ${listValue_opinion.sp_opinion_reason3 }
							</c:if>
							</p>
						</div>
						<div class="col-md-6" style="">
							<p style="font-weight: bold;">공감하는 반대편 근거</p>
							<p>
								<span class="label label-warning">공감: <span>${listValue_opinion.sp_opinion_opreason1_agree }</span>%
								</span>&nbsp ${listValue_opinion.sp_opinion_opreason1}
							</p>
							<p>
								<c:if test="${listValue_opinion.sp_opinion_opreason2 ne '0'}">
									<span class="label label-warning">공감: <span>${listValue_opinion.sp_opinion_opreason2_agree }</span>%
									</span>&nbsp ${listValue_opinion.sp_opinion_opreason2}
									</c:if>


							</p>
							<p>
								<c:if test="${listValue_opinion.sp_opinion_opreason3 ne '0'}">
									<span class="label label-warning">공감: <span>${listValue_opinion.sp_opinion_opreason3_agree }</span>%
									</span>&nbsp ${listValue_opinion.sp_opinion_opreason3}
									</c:if>
							</p>
						</div>
					</div>

					<div class="row" style="margin-top: 5px">

						<div class="col-md-10" style="">
							<div style="font-weight: bold;">상세 의견</div>

							${listValue_opinion.sp_opinion_detail }
						</div>
					</div>
					<!-- 의견_의댓글 부분 시작 -->
					<div class="row" style="text-align: right;">
						<!-- 의견 수정 및 삭제 버튼, 현재 로그인한 작성자가 같을 시에만, 보이게 한다 -->
						<c:if test="${listValue_opinion.writer_infomation.rcdno eq loginUserInfo.rcdno}">
							<div style="text-align: right;">
								<a href="${pageContext.request.contextPath}/opinion_update?opinion_rcdno=${listValue_opinion.sp_opinion_rcdno}&user_rcdno=${listValue_opinion.sp_opinion_writer}" id="opinion_edit_BT"><i
									class="fas fa-eraser"></i>수정</a> <a onclick="opinion_deleteBT_click(${listValue_opinion.sp_opinion_rcdno})" id="opinion_deleteBT"><i class="fas fa-trash-alt"></i>삭제</a>
							</div>
						</c:if>

						<a onclick="opinion_warning(${listValue_opinion.sp_opinion_rcdno})"><i class="fa fa-exclamation-circle"></i> 신고</a> <a onclick="opinion_thumbup(${listValue_opinion.sp_opinion_rcdno})"> <i
							class="far fa-thumbs-up"></i> 추천+<span>${listValue_opinion.sp_opinion_thumbup}</span></a> <a class="opinion_replysave_BT" id="opinion_replysave_BT_${listValue_opinion.sp_opinion_rcdno}"
							name="opinion_replysave_BT_${listValue_opinion.sp_opinion_rcdno}" onclick="opinion_reply_save(${listValue_opinion.sp_opinion_rcdno})" style="color: #286090"> <i class="fa fa-pen-square"></i>
							댓글쓰기
						</a> <a id="opinion_reply_showBT_${listValue_opinion.sp_opinion_rcdno}" onclick="opinion_reply_showBT(${listValue_opinion.sp_opinion_rcdno})"> <i class="fa fa-comments"></i> 댓글 <span> <span
								class="opinion_reply_number" opinion_rcdno="${listValue_opinion.sp_opinion_rcdno}" id="opinion_re_reply_number_${listValue_opinion.sp_opinion_rcdno}">3</span>개
						</span></a>
					</div>
					<!-- 댓글 부분의 첫 번째 의견 남기는 textarea -->
					<div class="" style="text-align: right">
						<textarea class="opinion_reply_Editor" rows="3" id="opinion_ReplyEditor_${listValue_opinion.sp_opinion_rcdno}" name="opinion_ReReplyEditor_${listValue_reply.sp_topic_reply_rcdno}"
							style="width: 100%; margin: 0 auto;" cols=""></textarea>
					</div>
					<!-- 댓글 부분의 부모 댓글 시작-->
					<c:forEach var="opinionReply" items="${listValue_opinion.opinionReplys}" varStatus="indexNum">
						<c:if test="${opinionReply.sp_opinion_reply_depth == '0'}">
							<c:set var="reply_type" value="opinion_reply" />
							<c:set var="reply_class_with_parent_rcdno" value="opinion_reply_${opinionReply.sp_opinion_reply_opinionRcdno}" />
						</c:if>

						<c:if test="${opinionReply.sp_opinion_reply_depth == '1'}">
							<c:set var="reply_type" value="opinion_re_reply" />
							<c:set var="reply_class_with_parent_rcdno" value="opinion_re_reply_${opinionReply.sp_opinion_reply_parentRcdno}" />
						</c:if>

						<div class="row ${reply_type} ${reply_class_with_parent_rcdno} opinionReplySection opinionReplySection_${listValue_opinion.sp_opinion_rcdno}" style="margin-top: 5px">
							<div class="col-md-6" style="">
								<div>
									<c:if test="${opinionReply.sp_opinion_reply_depth == '0'}">
										- 
									</c:if>

									<c:if test="${opinionReply.sp_opinion_reply_depth == '1'}">
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-level-up-alt fa-rotate-90"></i>
									</c:if>
									&nbsp&nbsp${opinionReply.sp_opinion_reply_content}
								</div>
							</div>
							<div class="col-md-6 text_align_right" style="">
								<div>
									<a onclick="opinion_reply_warning(${opinionReply.sp_opinion_reply_rcdno})"><i class="fa fa-exclamation-circle"></i></a><a
										onclick="opinion_reply_thumbup(${opinionReply.sp_opinion_reply_rcdno})"> <i class="far fa-thumbs-up"></i><span>+${opinionReply.sp_opinion_reply_thumbup } </span></a>
									<c:if test="${opinionReply.writer_infomation.openname eq '이름'}">
										<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${opinionReply.writer_infomation.rcdno }"><i class="fa fa-user"></i>&nbsp${opinionReply.writer_infomation.realname}
											&nbsp&nbsp&nbsp&nbsp </a>
									</c:if>
									<c:if test="${opinionReply.writer_infomation.openname eq '닉네임'}">
										<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${opinionReply.writer_infomation.rcdno }"> <i class="fa fa-user"></i>&nbsp${opinionReply.writer_infomation.nickname}
											&nbsp&nbsp&nbsp&nbsp
										</a>
									</c:if>
									<i class="fa fa-calendar"></i>&nbsp${opinionReply.sp_opinion_reply_datetime}
									<!-- 부모 댓글에만 답글표시와 답글등록 버튼을 보이게 한다.  -->
									<c:if test="${opinionReply.sp_opinion_reply_depth == '0'}">
										<a class="opinion_re_reply_saveBT" style="color: #286090" id="opinion_re_reply_saveBT_${opinionReply.sp_opinion_reply_rcdno}"
											onclick="opinion_re_reply_save(${opinionReply.sp_opinion_reply_opinionRcdno},${opinionReply.sp_opinion_reply_rcdno})"> <i class="fa fa-pen-square"></i> <span>답글등록</span></a>
										<a onclick="opinion_re_reply_showBT_Click(${opinionReply.sp_opinion_reply_rcdno},${opinionReply.sp_opinion_reply_parentRcdno})"> <i class="fa fa-comments"></i> +<span
											class="opinion_re_reply_number" reply_rcdno="${opinionReply.sp_opinion_reply_rcdno}" id="opinion_re_reply_number_${opinionReply.sp_opinion_reply_rcdno}">0</span></a>

									</c:if>
									<!-- 의견 _댓글 및 삭제 버튼, 현재 로그인한 작성자가 같을 시에만, 보이게 한다 -->
									<c:if test="${opinionReply.writer_infomation.rcdno eq loginUserInfo.rcdno}">
										<a onclick="opinionReply_deleteBT_click(${opinionReply.sp_opinion_reply_rcdno})" id="">삭제</a>
									</c:if>
								</div>
								<div></div>
							</div>
							<!-- 대댓글 쓰는 공간, 대댓글에는 대댓글 쓰는 공간이 없도록 하자, 가장 부모일때만 대댓글을 달 수 있게 만들었다. -->
							<c:if test="${opinionReply.sp_opinion_reply_depth == '0'}">
								<div class="text_align_right" style="">
									<textarea rows="4" class="opinion_ReReplyEditor" id="opinion_ReReplyEditor_${opinionReply.sp_opinion_reply_rcdno}" name="opinion_ReReplyEditor_${opinionReply.sp_opinion_reply_rcdno}"
										style="width: 100%; margin: 0 auto;" cols=""></textarea>
								</div>
							</c:if>

						</div>
					</c:forEach>
					<!-- 대댓글 공간끝  -->
				</div>
			</c:forEach>
			<!-- 더보기는 나중에 개발 -->
			<!--
			<ul class="pager">
				<li class=""><a href="#" style="width: 100%">댓글 더보기 <span>&nbsp &nbsp&nbsp<i class="fa fa-commenting-o" aria-hidden="true"></i> 6개의 의견이 더 존재합니다
					</span></a></li>
			</ul> -->

		</div>
	</div>

	<!-- 일반 댓글 시작 -->
	<div class="divide60"></div>
	<div class="container">
		<div class="row">
			<h3 class="heading">
				댓글 &nbsp&nbsp <span style="font-weight: normal; font-size: smaller; color: #b3bfdd"><i class="fa fa-comment"></i> ${topic_reply_total}</span>
			</h3>
			<!-- 댓글쓰는 공간 -->
			<div class="" style="text-align: right">
				<textarea rows="4" id="topicReplyEditor" name="topicReplyEditor" style="width: 100%; margin: 0 auto;" cols=""></textarea>
			</div>
			<div class="dropdown" style="text-align: right">
				<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
					최신순 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" onclick="topic_reply_order('recent')">최신순</a></li>
					<li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" onclick="topic_reply_order('thumbup')">추천순</a></li>
				</ul>
				<button type="button" class="btn btn-primary" id="reply_writing_start">댓글쓰기</button>
				<button type="button" id="topicReply_Save" name="topicReply_Save" class="btn btn-primary">댓글등록</button>
			</div>

			<!-- 만약에 리스트에 단 한개도 존재하지 않으면.... -->
			<c:if test="${fn:length(topic_reply_list) eq 0}">
				<div class="about-author text_align_center" style="font: 20px; font-weight:bold; border-radius: 3%; border: 1px solid ${side_color}; border-radius: 5px;">아직 등록된 댓글이 없습니다.</div>
			</c:if>


			<div class="comment-post">
				<div class="row">
					<!-- 댓글 리스트 -->
					<c:forEach var="listValue_reply" items="${topic_reply_list}">
						<c:if test="${listValue_reply.sp_topic_reply_depth == '0'}">
							<c:set var="reply_type" value="reply" />
							<c:set var="reply_class_with_parent_rcdno" value="reply_${listValue_reply.sp_topic_reply_parentRcdno}" />
						</c:if>

						<c:if test="${listValue_reply.sp_topic_reply_depth == '1'}">
							<c:set var="reply_type" value="re_reply" />
							<c:set var="reply_class_with_parent_rcdno" value="re_reply_${listValue_reply.sp_topic_reply_parentRcdno}" />
						</c:if>
						<div class="col-md-12 ${reply_type} ${reply_class_with_parent_rcdno}" style="">
							<div class="comment-list">
								<h4>
									<c:if test="${listValue_reply.sp_topic_reply_depth == '1'}">
										<img src="${pageContext.request.contextPath}/resources/img/comment_img.jpg" style="border-radius: 50%" class="img-responsive" alt="">
									</c:if>

									<!-- 이름, 닉네임 공개 여부에 따라 글쓴이의 정보 설정 -->
									<c:if test="${listValue_reply.writer_infomation.openname eq '이름'}">
										<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_reply.writer_infomation.rcdno}"><img
											src="${pageContext.request.contextPath}/${listValue_reply.writer_infomation.sp_user_picUrl}" onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_user_img.png';" style="border-radius: 50%" class="img-responsive" alt=""> 작성자:
											${listValue_reply.writer_infomation.realname} &nbsp</a>
									</c:if>
									<c:if test="${listValue_reply.writer_infomation.openname eq '닉네임'}">
										<a href="${pageContext.request.contextPath}/userInfo?user_rcdno=${listValue_reply.writer_infomation.rcdno}"><img
											src="${pageContext.request.contextPath}/${listValue_reply.writer_infomation.sp_user_picUrl}" onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_user_img.png';" style="border-radius: 50%" class="img-responsive" alt=""> 작성자:
											${listValue_reply.writer_infomation.nickname} &nbsp</a>
									</c:if>


								</h4>
								<p>${listValue_reply.sp_topic_reply_content}</p>
								<div class="row" style="text-align: right;">
									<!-- 의견 댓글 및 삭제 버튼, 현재 로그인한 작성자가 같을 시에만, 보이게 한다 -->
									<c:if test="${listValue_reply.writer_infomation.rcdno eq loginUserInfo.rcdno}">
										<div style="text-align: right;">
											<a onclick="topicReply_deleteBT_click(${listValue_reply.sp_topic_reply_rcdno})"><i class="fas fa-trash-alt"></i>삭제</a>
										</div>
									</c:if>
									<a onclick="topic_reply_warning(${listValue_reply.sp_topic_reply_rcdno})"><i class="fa fa-exclamation-circle"></i> 신고 |</a> <a
										onclick="topic_reply_thumbup(${listValue_reply.sp_topic_reply_rcdno})"> <i class="far fa-thumbs-up"></i> 추천<span>+ ${listValue_reply.sp_topic_reply_thumbup} </span>|
									</a><span><i class="fa fa-calendar"></i> ${listValue_reply.sp_topic_reply_datetime}|</span>
									<!-- 대댓글쓰기 버튼, 대댓글에는 대댓글쓰는 버튼이 없도록 만들었다. -->
									<c:if test="${listValue_reply.sp_topic_reply_depth == '0'}">
										<a id="re_reply_showBT_${listValue_reply.sp_topic_reply_rcdno}" onclick="re_reply_visibilitytoggle(${listValue_reply.sp_topic_reply_rcdno})"><i class="fa fa-comments"></i> +<span
											class="topic_re_reply_number" reply_rcdno="${listValue_reply.sp_topic_reply_rcdno}" id="topic_re_reply_number_${listValue_reply.sp_topic_reply_rcdno}">0</span>개 |</a>
										<a type="button" class="btn btn-primary re_reply_writeBT" id="re_reply_writeBT_${listValue_reply.sp_topic_reply_rcdno}"
											onclick="tvtopic_re_reply_save(${listValue_reply.sp_topic_reply_topicRcdno},${listValue_reply.sp_topic_reply_rcdno})"> <i class="fas fa-edit"></i> 답글등록
										</a>
									</c:if>

								</div>
							</div>
							<!--comments list-->
							<!-- 대댓글 쓰는 공간, 대댓글에는 대댓글 쓰는 공간이 없도록 하자 -->
							<c:if test="${listValue_reply.sp_topic_reply_depth == '0'}">
								<div class="" style="text-align: right">
									<textarea class="re_reply_Editor" rows="4" id="topic_ReReplyEditor_${listValue_reply.sp_topic_reply_rcdno}" name="topic_ReReplyEditor_${listValue_reply.sp_topic_reply_rcdno}"
										style="width: 100%; margin: 0 auto;" cols=""></textarea>
								</div>
							</c:if>


						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 더보기는 나중에 개발 -->
			<!--
			<ul class="pager">
				<li class=""><a href="#" style="width: 100%">댓글 더보기 <span>&nbsp &nbsp&nbsp<i class="fa fa-commenting-o" aria-hidden="true"></i> 6개의 의견이 더 존재합니다
					</span></a></li>
			</ul> -->

		</div>
	</div>

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
			navMenuColorSetting();
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
			list_order_dropdown_Setting();

		});
		
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
		function topic_deleteBT_click(topic_rcdno){
			var result = confirm('정말 해당 주제를 삭제하시겠습니까?'); 
			if(result) {
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
							location.href="${pageContext.request.contextPath}/all_TVshow_Topics";
						} else {
							alert("요청하신 서비스에 실패했습니다. 문제 상황 지속시 연락 부탁드립니다. 010 7272 9771");
						}

					},
					error : function(e) {
						alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771:'+e);
					}
				});
				
				
			} else { 
				
			} 
			
		}
		
		function list_order_dropdown_Setting(){
			var opinion_order;
			<c:if test="${param.opinion_order}">
			opinion_order = "recent";
		</c:if>
		opinion_order = '${param.opinion_order}';
			
			//opinionOrder 순서가없으면 최신순이다.
			if(opinion_order==null || opinion_order=="" || opinion_order=="recent" ){
				$("#show_opinion_order").html("최신순  <span class='caret'></span>");
				$("#normal_opinion_order").html("최신순   <span class='caret'></span>");
			}
			else if(opinion_order=="thumbup" ){
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
		function opinion_deleteBT_click(opinion_rcdno){
			var result = confirm('정말 해당 의견을 삭제하시겠습니까?'); 
			if(result) {
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
						alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771:'+e);
					}
				});
				
			}
			
		}

		//의견_의 좋아요 버튼 눌렀을 시 - onclick()
		function opinion_thumbup(opinion_rcdno){
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if('${loginUserInfo}'==""){
				alert("로그인이 필요합니다.")
			}else{
				//값 셋팅
				var objParams = {
						opinion_rcdno : opinion_rcdno,
						recom_type :"thumbup",
						bywhom :  "${loginUserInfo.rcdno}"
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
		function opinion_re_reply_showBT_Click(sp_opinion_reply_rcdno, parentRcdno){
			$("#opinion_ReReplyEditor_"+sp_opinion_reply_rcdno).toggle();
			$(".opinion_re_reply_"+sp_opinion_reply_rcdno).toggle();
			$("#opinion_re_reply_saveBT_"+sp_opinion_reply_rcdno).toggle();
		}
		
		//쇼피니언, 일반의견의 댓글 보기 누르기. onclick()함수 -댓글쓰기/댓글에디터/댓글들 토글하기.
		function opinion_reply_showBT(opinionRcdno){
		 	$("#opinion_replysave_BT_"+opinionRcdno).toggle();
			$("#opinion_ReplyEditor_"+opinionRcdno).toggle();
			$(".opinion_reply_"+opinionRcdno).toggle(); 
		
			
		}
		//의견_대댓글 버튼 등록 클릭 시 발생하는 함수. 답글등록 onClick() 함수
		function opinion_re_reply_save(opinion_rcdno,parent_rcdno){
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if('${loginUserInfo}'==""){
				alert("로그인이 필요합니다.")
			}else{
				//널 검사
				if ($("#opinion_ReReplyEditor_"+parent_rcdno).val().trim() == "") {
					alert("답글 내용이 없습니다. 내용을 입력하고 답글등록을 해주세요.");
					$("#opinion_ReReplyEditor_"+parent_rcdno).focus();
					return false;
				}
				//에디터 내용 가져옴
				var content = $("#opinion_ReReplyEditor_"+parent_rcdno).val().trim();
				//값 셋팅
				var objParams = {
						opinion_rcdno : opinion_rcdno,
						parent_rcdno :parent_rcdno,
					depth:"1",
					content : content,
					writer :  "${loginUserInfo.rcdno}"
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
		function opinion_reply_save(opinion_rcdno){
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if('${loginUserInfo}'==""){
				alert("로그인이 필요합니다.")
			}else{
				//널 검사
				if ($("#opinion_ReplyEditor_"+opinion_rcdno).val().trim() == "") {
					alert("댓글 내용을 입력하세요.");
					$("#opinion_ReplyEditor_"+opinion_rcdno).focus();
					return false;
				}
				//에디터 내용 가져옴
				var content = $("#opinion_ReplyEditor_"+opinion_rcdno).val().trim();

				//값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					parent_rcdno : "0",
					depth :"0",
					content : content,
					writer :  "${loginUserInfo.rcdno}"
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
		function opinion_reply_warning(opinion_reply_rcdno){
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if('${loginUserInfo}'==""){
				alert("로그인이 필요합니다.");
			}else{
				
				//값 셋팅
				var objParams = {
						opinion_reply_rcdno : opinion_reply_rcdno,
						recom_type :"warning",
						bywhom :  "${loginUserInfo.rcdno}"
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
		function opinion_reply_thumbup(opinion_reply_rcdno){
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if('${loginUserInfo}'==""){
				alert("로그인이 필요합니다.")
			}else{
				//값 셋팅
				var objParams = {
						opinion_reply_rcdno : opinion_reply_rcdno,
						recom_type :"thumbup",
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
		function topic_reply_warning(sp_topic_reply_rcdno){
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if('${loginUserInfo}'==""){
				alert("로그인이 필요합니다.")
			}else{
				//값 셋팅
				var objParams = {
						sp_topic_reply_rcdno : sp_topic_reply_rcdno,
						recom_type :"warning",
						bywhom :  "${loginUserInfo.rcdno}"
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
		function topic_reply_thumbup(sp_topic_reply_rcdno){
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if('${loginUserInfo}'==""){
				alert("로그인이 필요합니다.")
			}else{
				//값 셋팅
				var objParams = {
						sp_topic_reply_rcdno : sp_topic_reply_rcdno,
						recom_type :"thumbup",
						bywhom :  "${loginUserInfo.rcdno}"
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
		function reply_number_Setting(){
			//주제_댓글 개수 카운팅하기
	$(".topic_re_reply_number").each( function() {
        var reply_rcdno = $( this ).attr('reply_rcdno');
        var counting = $(".re_reply_"+reply_rcdno).length
        $( this ).text(counting);
      } );
			
			//의견_댓글 개수 카운팅하기
			
				$(".opinion_reply_number").each( function() {
        var opinion_rcdno = $( this ).attr('opinion_rcdno');
        var counting = $(".opinion_reply_"+opinion_rcdno).length
        $( this ).text(counting);
      } );
			
			
			//의견_대댓글 개수 카운팅하기
	$(".opinion_re_reply_number").each( function() {
        var reply_rcdno = $( this ).attr('reply_rcdno');
        var counting = $(".opinion_re_reply_"+reply_rcdno).length
        $( this ).text(counting);
      } );
			
		}
		function topic_replyBT_toggle_Setting(){
			//
				$("#reply_writing_start").click(function() {
					//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
					if('${loginUserInfo}'==""){
						alert("댓글 등록을 위해서는 로그인이 필요합니다.")
					}else{
						$("#topicReply_Save").toggle();
						$("#reply_writing_start").toggle();
						$("#topicReplyEditor").toggle();
					}
				});
				$("#topicReply_Save").click(function() {
					//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
					if('${loginUserInfo}'==""){
						alert("댓글 등록을 위해서는 로그인이 필요합니다.")
					}else{
					$("#topicReply_Save").toggle();
					$("#reply_writing_start").toggle();
					$("#topicReplyEditor").toggle();
					}
				});
		}
		//페이지 로딩 시에 대댓글 Editor와 글 등록 버튼을 없애주는 토글 버튼.
		function pageLoading_toggle_Setting(){
		$(".re_reply_Editor").toggle();
		$(".re_reply_writeBT").toggle();
		$(".opinion_reply_Editor").toggle();
		$(".opinionReplySection").toggle();
		$(".opinion_replysave_BT").toggle();
		$(".opinion_ReReplyEditor").toggle();
		$(".opinion_re_reply_saveBT").toggle();
		}
		
		//대댓글 토글 , 답글 보기시 발생하는 함수
		function re_reply_visibilitytoggle(reply_rcdno){
			//대댓글 editor를 보여주게하고, 답글 등록 버튼을 보여준ㄷ
			$("#topic_ReReplyEditor_"+reply_rcdno).toggle();
			$("#re_reply_writeBT_"+reply_rcdno).toggle();
			//대댓글들을 전부 보여준다. 
			$('.re_reply_'+reply_rcdno).toggle();
			//답글 등록
		}
		
		//주제_대댓글 버튼 등록 클릭 시 발생하는 함수. 답글등록 onClick() 함수
		function tvtopic_re_reply_save(sp_tvtopics_rcdno,sp_topic_reply_rcdno){
			//만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if('${loginUserInfo}'==""){
				alert("로그인이 필요합니다.")
			}else{
				//널 검사
				if ($("#topic_ReReplyEditor_"+sp_topic_reply_rcdno).val().trim() == "") {
					alert("답글 내용이 없습니다. 내용을 입력하고 답글등록을 해주세요.");
					$("#topic_ReReplyEditor_"+sp_topic_reply_rcdno).focus();
					return false;
				}
				//에디터 내용 가져옴
				var content = $("#topic_ReReplyEditor_"+sp_topic_reply_rcdno).val().trim();
				//값 셋팅
				var objParams = {
						tvtopic_rcdno : sp_tvtopics_rcdno,
						parent_rcdno :sp_topic_reply_rcdno,
					depth:"1",
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
					if('${loginUserInfo}'==""){
						alert("로그인이 필요합니다.")
					}else{
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
							depth :"0",
							content : content,
							writer :  "${loginUserInfo.rcdno}"
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
		function chart_index_Setting(){
			
			
			
		}
		var showpinion_graph_pro_total;
		var showpinion_graph_con_total;
		var normal_graph_pro_total;
		var normal_graph_con_total;
		function google_chart_Setting() {
			showpinion_graph_pro_total = ${showpinion_graph_pro_total};
			showpinion_graph_con_total = ${showpinion_graph_con_total};
		normal_graph_pro_total = ${normal_graph_pro_total};
		normal_graph_con_total = ${normal_graph_con_total};
			
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawChart);
		}
		function drawChart() {
			var showpinion_data = google.visualization.arrayToDataTable([ [ 'Task', 'Hours per Day' ], [ '찬성', showpinion_graph_pro_total ], [ '반대', showpinion_graph_con_total] ]);
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
			if(parseInt(showpinion_graph_pro_total)>parseInt(showpinion_graph_con_total)){
				$("#showpinion_chart_div").css("border"," 4px solid #59df57");
			}else if(parseInt(showpinion_graph_pro_total)<parseInt(showpinion_graph_con_total)){
				$("#showpinion_chart_div").css("border"," 4px solid #df5759");
			}else{
				$("#showpinion_chart_div").css("border"," 1px solid ");
			}
				//일반의견 차트 색깔 정하기
			if(parseInt(normal_graph_pro_total)>parseInt(normal_graph_con_total)){
				$("#normal_chart_div").css("border"," 4px solid #59df57");
			}else if(parseInt(normal_graph_pro_total)<parseInt(normal_graph_con_total)){
				$("#normal_chart_div").css("border"," 4px solid #df5759");
			}else{
				$("#normal_chart_div").css("border"," 1px solid ");
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
