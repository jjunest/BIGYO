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
					<h4>쇼피니언 프로필</h4>
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
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2" style="text-align: center; margin: 0 auto;">
						<img src="${pageContext.request.contextPath}/${userInfomation.sp_user_picUrl}" class="img-responsive"onError="this.src='${pageContext.request.contextPath}/resources/img/default_imgs/default_user_img.png';"  alt="" style="border-radius: 50%; width: 120px; height: 120px; display: inline;">
					</div>

					<!-- 자기 자신이라면 모든 정보를 볼 수 있어야 한다.  -->
					<c:if test="${loginUserInfo.rcdno eq userInfomation.rcdno}">
						<div class="col-md-5" style="font-size: 13px">
							<div>
								<span style="font-weight: bold; font-size: 18px">이름 &nbsp&nbsp</span>${userInfomation.realname }</div>
							<div>
								<span style="font-weight: bold; font-size: 18px">닉네임 &nbsp&nbsp</span>${userInfomation.nickname }</div>
							<div>
								* 현재 <span style="font-weight: bold;">${userInfomation.openname }</span>으로 활동 중 &nbsp&nbsp
							</div>
							<div>
								<span style="font-weight: bold; font-size: 18px">한줄 소개 &nbsp&nbsp</span>${userInfomation.user_self_intro }</div>
							<div>
								<span style="font-weight: bold; font-size: 18px">소속 &nbsp&nbsp </span>${userInfomation.groupname }
								<!-- 공개인지 비공개인지 알려주자. -->
								<c:if test="${userInfomation.groupname_open eq 'on'}">
									<span>*소속 공개중</span>
								</c:if>
								<c:if test="${userInfomation.groupname_open eq 'off'}">
									<span>*소속 비공개중</span>
								</c:if>
							</div>
							<div>
								<span style="font-weight: bold; font-size: 18px">SNS &nbsp&nbsp </span><a href="${userInfomation.sns }" target="_blank">${userInfomation.sns }</a>
								<!-- 공개인지 비공개인지 알려주자. -->
								<c:if test="${userInfomation.sns_open eq 'on'}">
									<span>*SNS 공개중</span>
								</c:if>
								<c:if test="${userInfomation.sns_open eq 'off'}">
									<span>*SNS 비공개중</span>
								</c:if>
							</div>
						</div>
					</c:if>

					<!-- 자기 자신이 아니라면 비공개 정보는 가려야 한다. -->
					<c:if test="${loginUserInfo.rcdno ne userInfomation.rcdno}">
						<div class="col-md-5" style="font-size: 15px">
							<c:if test="${userInfomation.openname eq '이름'}">
								<div style="margin: 10px">
									<span style="font-weight: bold; font-size: 18px">${userInfomation.realname } &nbsp&nbsp</span>
								</div>
							</c:if>
							<c:if test="${userInfomation.openname eq '닉네임'}">
								<div style="margin: 10px">
									<span style="font-weight: bold; font-size: 18px">${userInfomation.nickname } &nbsp&nbsp</span>
								</div>
							</c:if>
							<div style="margin: 10px">
								<span style="font-weight:; font-size: 16px">11${userInfomation.user_self_intro }&nbsp&nbsp111</span>
							</div>
							<c:if test="${userInfomation.groupname_open eq 'on'}">
								<div style="margin: 10px">
									<span style="font-weight:; font-size: 16px">${userInfomation.groupname } &nbsp&nbsp</span>
								</div>
							</c:if>
							<c:if test="${empty userInfomation.groupname_open}">
								<div style="margin: 10px">
									<span style="font-weight:; font-size: 16px">소속 비공개 &nbsp&nbsp</span>
								</div>
							</c:if>
							<c:if test="${userInfomation.sns_open eq 'on'}">
								<div style="margin: 10px">
									<span style="font-weight:; font-size: 14px">${userInfomation.sns } &nbsp&nbsp</span>
								</div>
							</c:if>
							<c:if test="${empty userInfomation.sns_open}">
								<div style="margin: 10px">
									<span style="font-weight:; font-size: 14px"> SNS 비공개 &nbsp&nbsp</span>
								</div>
							</c:if>
						</div>
					</c:if>
					<div class="col-md-5"></div>
				</div>
				<div class="row" style="margin-top: 20px; margin-bottom: 20px">
					<div class="col-md-2" style="text-align: center; margin: 0 auto;">
						<!-- 로그인한 사람이 내 정보를 수정하고자 한다면 -->
						<c:if test="${loginUserInfo.rcdno eq userInfomation.rcdno}">
							<a href="${pageContext.request.contextPath}/edit_userInfo?user_rcdno=${loginUserInfo.rcdno}" id="edit_myUserInfo_BT" type="button" class="btn btn-primary">나의프로필수정</a>
						</c:if>
						<button type="button" class="btn btn-default" onclick="ranking_popular_click(${userInfomation.rcdno})">
							인기지수추천 <i class="far fa-heart"></i>+${userInfomation.ranking_user_like}
						</button>
					</div>
					<div class="col-md-10">
						<div class="row" style="text-align: center;">
							<div class="col-sm-3">
								<div style="" data-toggle="tooltip" data-placement="top" title="쇼피니언 의견을 작성한 총 갯수">쇼피니언 지수</div>
								<div style="width: 30px; height: 1px; border: none; border-bottom: 1px solid #7e96d0; margin-bottom: 10px; margin: 0 auto;"></div>
								<div>
									<i class="fab fa-facebook"></i> &nbsp +${userInfomation.ranking_opinion_show_total }
								</div>
							</div>
							<div class="col-sm-3">
								<div data-toggle="tooltip" data-placement="top" title="일반의견을 작성한 총 갯수">일반의견 지수</div>
								<div style="width: 30px; height: 1px; border: none; border-bottom: 1px solid #7e96d0; margin-bottom: 10px; margin: 0 auto;"></div>
								<div>
									<i class="fas fa-pen-square"></i> &nbsp +${userInfomation.ranking_opinion_normal_total }
								</div>
							</div>
							<div class="col-sm-3">
								<div data-toggle="tooltip" data-placement="top" title="의견 추천을 받은 총 갯수">추천 지수</div>
								<div style="width: 30px; height: 1px; border: none; border-bottom: 1px solid #7e96d0; margin-bottom: 10px; margin: 0 auto;"></div>
								<div>
									<i class="far fa-thumbs-up"></i> &nbsp +${userInfomation.ranking_thumbup_total }
								</div>
							</div>
							<div class="col-sm-3">
								<div data-toggle="tooltip" data-placement="top" title="인기지수 추천을 받은 총 갯수">인기지수</div>
								<div style="width: 30px; height: 1px; border: none; border-bottom: 1px solid #7e96d0; margin-bottom: 10px; margin: 0 auto;"></div>
								<div>
									<i class="far fa-heart"></i>&nbsp +${userInfomation.ranking_user_like}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="divide60"></div>
	</div>
	<!--me page inner-->
	<!-- 의견 시작 -->
	<!-- 의견 시작 -->
	<div class="container">
		<div class="row">
			<h3 class="heading">
				추천 많이 받은 의견 TOP 5 &nbsp&nbsp <span style="font-weight: normal; font-size: smaller; color: #b3bfdd"></span>
			</h3>
		</div>
	</div>
	<div class="container">
		<!--row-->
		<div class="row">
			<div id="testi-carousel2" class="owl-carousel owl-theme owl-spaced">

				<!-- 만약에 리스트에 단 한개도 존재하지 않으면.... -->
				<c:if test="${fn:length(opinion_top_five_list) eq 0}">
					<div class="about-author text_align_center" style="font: 20px; font-weight:bold; border-radius: 3%; border: 1px solid ${side_color}; border-radius: 5px;">아직 등록된 의견이 없습니다. 관심있는 사회문제를 보고 자신의
						의견을 보여주세요.</div>
				</c:if>

				<c:forEach var="listValue_opinion" items="${opinion_top_five_list}">
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
	<div class="divide80"></div>

	<div class="container">
		<div class="row">
			<h3 class="heading">
				유저가 남긴 의견들 &nbsp&nbsp <span style="font-weight: normal; font-size: smaller; color: #b3bfdd"><i class="fa fa-comment"></i> ${fn:length(my_opinions_list)} </span>
			</h3>
		</div>
	</div>
	<div class="container">
		<!--row-->
		<div class="row">
			<!-- 만약에 리스트에 단 한개도 존재하지 않으면.... -->
			<c:if test="${fn:length(my_opinions_list) eq 0}">
				<div class="about-author text_align_center" style="font: 20px; font-weight:bold; border-radius: 3%; border: 1px solid ${side_color}; border-radius: 5px;">아직 등록된 의견이 없습니다. 관심있는 사회문제를 보고 자신의
					의견을 보여주세요.</div>
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
		<!--img slide row-->
	</div>

	<div class="divide60"></div>

	<div class="divide80"></div>
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
	<!-- opinion에 관련된 나의 자바스크립트 -->
	<script src="${pageContext.request.contextPath}/resources/js/jjunest.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();

			//carousel 시작하기 setting
			carousel_Setting();
			//페이지 로딩 시 댓글 버튼 토글 세팅하기
			pageLoading_toggle_Setting();
			//댓글이 몇개인지 카운팅하는 함수
			reply_number_Setting();
		});

		//인기 버튼 클릭시
		function ranking_popular_click(user_rcdno){
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				// 값 셋팅
				var objParams = {
						user_rcdno : user_rcdno,
					bywhom : "${loginUserInfo.rcdno}"
				};

				// ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/ranking_popular_process",
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
		//OPINION과 관련된 자바스크립트 시작
		function reply_number_Setting() {
			// 의견_댓글 개수 카운팅하기
			$(".opinion_reply_number").each(function() {
				var opinion_rcdno = $(this).attr('opinion_rcdno');
				var counting = $(".opinion_reply_" + opinion_rcdno).length
				$(this).text(counting);
			});

			// 의견_대댓글 개수 카운팅하기
			$(".opinion_re_reply_number").each(function() {
				var reply_rcdno = $(this).attr('reply_rcdno');
				var counting = $(".opinion_re_reply_" + reply_rcdno).length
				$(this).text(counting);
			});

		}

		// 페이지 로딩 시에 대댓글 Editor와 글 등록 버튼을 없애주는 토글 버튼.
		function pageLoading_toggle_Setting() {
			$(".opinion_reply_Editor").toggle();
			$(".opinionReplySection").toggle();
			$(".opinion_replysave_BT").toggle();
			$(".opinion_ReReplyEditor").toggle();
			$(".opinion_re_reply_saveBT").toggle();
		}

		// 대댓글 토글 , 답글 보기시 발생하는 함수
		function re_reply_visibilitytoggle(reply_rcdno) {
			// 대댓글 editor를 보여주게하고, 답글 등록 버튼을 보여준ㄷ
			$("#topic_ReReplyEditor_" + reply_rcdno).toggle();
			$("#re_reply_writeBT_" + reply_rcdno).toggle();
			// 대댓글들을 전부 보여준다.
			$('.re_reply_' + reply_rcdno).toggle();
			// 답글 등록
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
		// 의견 삭제 버튼 클릭 시
		function opinion_deleteBT_click(opinion_rcdno) {
			var result = confirm('정말 해당 의견을 삭제하시겠습니까?');
			if (result) {
				// 값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
				};
				// ajax 호출
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

		// 의견_의 좋아요 버튼 눌렀을 시 - onclick()
		function opinion_thumbup(opinion_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				// 값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					recom_type : "thumbup",
					bywhom : "${loginUserInfo.rcdno}"
				};

				// ajax 호출
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

		// 의견의 대댓글 버튼 클릭시
		function opinion_re_reply_showBT_Click(sp_opinion_reply_rcdno, parentRcdno) {
			$("#opinion_ReReplyEditor_" + sp_opinion_reply_rcdno).toggle();
			$(".opinion_re_reply_" + sp_opinion_reply_rcdno).toggle();
			$("#opinion_re_reply_saveBT_" + sp_opinion_reply_rcdno).toggle();
		}

		// 쇼피니언, 일반의견의 댓글 보기 누르기. onclick()함수 -댓글쓰기/댓글에디터/댓글들 토글하기.
		function opinion_reply_showBT(opinionRcdno) {
			$("#opinion_replysave_BT_" + opinionRcdno).toggle();
			$("#opinion_ReplyEditor_" + opinionRcdno).toggle();
			$(".opinion_reply_" + opinionRcdno).toggle();

		}
		// 의견_대댓글 버튼 등록 클릭 시 발생하는 함수. 답글등록 onClick() 함수
		function opinion_re_reply_save(opinion_rcdno, parent_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				// 널 검사
				if ($("#opinion_ReReplyEditor_" + parent_rcdno).val().trim() == "") {
					alert("답글 내용이 없습니다. 내용을 입력하고 답글등록을 해주세요.");
					$("#opinion_ReReplyEditor_" + parent_rcdno).focus();
					return false;
				}
				// 에디터 내용 가져옴
				var content = $("#opinion_ReReplyEditor_" + parent_rcdno).val().trim();
				// 값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					parent_rcdno : parent_rcdno,
					depth : "1",
					content : content,
					writer : "${loginUserInfo.rcdno}"
				};
				// ajax 호출
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

		// 의견_댓글 달기
		function opinion_reply_save(opinion_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				// 널 검사
				if ($("#opinion_ReplyEditor_" + opinion_rcdno).val().trim() == "") {
					alert("댓글 내용을 입력하세요.");
					$("#opinion_ReplyEditor_" + opinion_rcdno).focus();
					return false;
				}
				// 에디터 내용 가져옴
				var content = $("#opinion_ReplyEditor_" + opinion_rcdno).val().trim();

				// 값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					parent_rcdno : "0",
					depth : "0",
					content : content,
					writer : "${loginUserInfo.rcdno}"
				};
				// ajax 호출
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

		// 의견_댓글의 신고 버튼 눌렀을 시 - onclick()
		function opinion_reply_warning(opinion_reply_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.");
			} else {

				// 값 셋팅
				var objParams = {
					opinion_reply_rcdno : opinion_reply_rcdno,
					recom_type : "warning",
					bywhom : "${loginUserInfo.rcdno}"
				};

				// ajax 호출
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

		// 의견_댓글의 좋아요 버튼 눌렀을 시 - onclick()
		function opinion_reply_thumbup(opinion_reply_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				// 값 셋팅
				var objParams = {
					opinion_reply_rcdno : opinion_reply_rcdno,
					recom_type : "thumbup",
					bywhom : "${loginUserInfo.rcdno}"
				};

				// ajax 호출
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
		//OPINION과 관련된 자바스크립트 끝

		function carousel_Setting() {
			$("#testi-carousel1").owlCarousel({
				loop : true,
				margin : 0,
				nav : false,
				responsive : {
					0 : {
						items : 1
					},
					600 : {
						items : 1
					},
					1000 : {
						items : 1
					}
				}
			});
			$("#testi-carousel2").owlCarousel({
				loop : true,
				margin : 0,
				nav : false,
				responsive : {
					0 : {
						items : 1
					},
					600 : {
						items : 1
					},
					1000 : {
						items : 1
					}
				}
			});

		}
		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/userInfo") != -1) {

				$("#navmenu_userInfo").css("color", "#39a1f4");

			}

		}
	</script>
</body>

</html>
