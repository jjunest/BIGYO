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
</style>
</head>
<body class="body-wrapper">
	<!-- HEADER FILE INCLUDE  -->
	<jsp:include page="navbar_header.jsp"></jsp:include>
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h4>Be SHOWPINIAN</h4>
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

		<div class="center-heading">
			<h2>금융 실명제 도입이 필요한가?</h2>
			<span class="center-line"></span>
		</div>


		<div class="row">
			<div class="col-md-8">
				<div class="blog-post">
					<ul class="list-inline post-detail">
						<li><i class="fa fa-user"></i><a href="#" data-toggle="tooltip" data-placement="top" title="본 주제에 대하여 정리를 해주신 분입니다. 깊은 감사를 드립니다. "><span>작성자:</span>jjunest</a></li>
						<li><i class="fa fa-calendar"></i><span>작성일:</span> 31st july 2014</li>
						<li><i class="fa fa-users"></i> <a href="#"><span>조회수:</span>6</a></li>
						<li><i class="fa fa-comment"></i> <a href="#"><span>의견:</span>6</a>개</li>
					</ul>
					<div class="divide30"></div>
					<h3 class="heading">문제 상황</h3>
					<p>문재인 정부의 ‘탈원전’ 정책을 둘러싸고 공방이 뜨겁게 진행되고 있다. 지난 6월 19 일 우리나라 최초의 원자력발전소인 부산의 ‘고리 1호기’가 영구 정지되는 자리에서 문재인 대통령은 ‘탈원전 시대’를 선포하며 에너지정책 대전환을 예고했다. 더불어 신고리 5·6호기의 건설 여부를 놓고, 국민의 의견을 수렴하기 위한 공론조사가 현재
						진행 중이다. 문재인 정부의 ‘탈원전’ 정책을 둘러싸고 공방이 뜨겁게 진행되고 있다. 지난 6월 19 일 우리나라 최초의 원자력발전소인 부산의 ‘고리 1호기’가 영구 정지되는 자리에서 문재인 대통령은 ‘탈원전 시대’를 선포하며 에너지정책 대전환을 예고했다. 더불어 신고리 5·6호기의 건설 여부를 놓고, 국민의 의견을 수렴하기 위한 공론조사가 현재
						진행 중이다.</p>
					<div class="divide50"></div>
					<h3 class="heading">찬성 반대 근거</h3>
					<div class="row">
						<div class="col-sm-6 margin30">
							<div class="grid-boxed" data-toggle="tooltip" data-placement="top" title="찬성측 주요 근거" style="border: 4px solid #59df57; border-radius: 5px;">
								<h4>30자 찬성 측 주요 근거</h4>
								<p>일일일일일이이이이이일일일일일이이이이이일일일일일이이이이이</p>
								<p>일일일일일이이이이이일일일일일이이이이이일일일일일이이이이이</p>
								<p>일일일일일이이이이이일일일일일이이이이이일일일일일이이이이이</p>
							</div>
						</div>
						<div class="col-sm-6 margin30">
							<div class="grid-boxed" data-toggle="tooltip" data-placement="top" title="반대측 주요 근거" style="border: 4px solid #59df57; border-radius: 5px;">
								<h4>30자 반대 측 주요 근거</h4>
								<p>일일일일일이이이이이일일일일일이이이이이일일일일일이이이이이</p>
								<p>일일일일일이이이이이일일일일일이이이이이일일일일일이이이이이</p>
								<p>일일일일일이이이이이일일일일일이이이이이일일일일일이이이이이</p>
							</div>
						</div>

					</div>
					<div style="text-align: center">
						<a href="#" class="btn btn-theme-bg btn-ico btn-lg" style="width: 100%;" data-toggle="modal" data-target="#myModal">의견 쓰기 <i class="fa fa-pencil-square-o"></i></a>
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
	<!--blog full main container-->
	<div class="divide60"></div>

	<div class="container">
		<div class="row">
			<h3 class="heading">
				쇼피니언 의견 &nbsp&nbsp <span style="font-weight: normal; font-size: smaller; color: #b3bfdd"><i class="fa fa-comment"></i> 6</span>
			</h3>
			<div class="dropdown" style="text-align: right">
				<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
					추천순 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">추천순</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">최신순</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">댓글순</a></li>
				</ul>
				<button type="button" class="btn btn-primary">의견쓰기</button>
			</div>


			<div class="about-author" style="border-radius: 3%; border: 4px solid #59df57; border-radius: 5px;">
				<div class="row">
					<div class="col-md-2" style="text-align: center">
						<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="img-responsive" alt="" style="border-radius: 50%; width: 60px; height: 60px">
						<p style="margin: 2px">jjunest</p>
						<p style="font-size: 80%; color: gray; margin: 2px">2017-07-28</p>
					</div>
					<div class="col-md-6" style="">

						<h4 class="colored-text" style="height: 50px; line-height: 50px; white-space: nowrap;">금융 실명제 도입이 필요한가?</h4>
					</div>
					<div class="col-md-4">
						<div style="width: 50px; height: 50px; border-radius: 50%; font-size: 50px; color: white; line-height: 500px; text-align: center; background: green;"></div>
						<p>
							<span>* 본 의견은 '쇼피니언' 의견입니다 <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="본인의 의견을 SNS에 올리시면, 쇼피니언 지수가 높아집니다."></i></span>
						</p>
					</div>

				</div>

				<div class="row" style="margin-top: 5px">
					<div class="col-md-6" style="">
						<p>나의 찬성 근거</p>
						<p>
							<span class="badge" style="text-align: left; border-radius: 15%">결정적 이유</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
						<p>
							<span class="badge" style="text-align: left; border-radius: 15%">Top2</span>&nbsp 가나다라마바사아자차ㅋ타파
						</p>
						<p>
							<span class="badge" style="text-align: left; border-radius: 15%">Top3</span>&nbsp 가나다라마바사아자차ㅋ타파
						</p>
					</div>
					<div class="col-md-6" style="">
						<p>인정하는 반대편 근거</p>
						<p>
							<span class="label label-default">인정: <span>80</span>%
							</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
						<p>
							<span class="label label-default">인정: <span>70</span>%
							</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
						<p>
							<span class="label label-default">인정: <span>30</span>%
							</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
					</div>
				</div>
				<div class="row" style="margin-top: 5px">

					<div class="col-md-10" style="">
						<div>상세 의견</div>

						가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜.
						가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜.
					</div>
				</div>
				<div class="row" style="text-align: right;">

					<a href="#"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 신고</a> <a href="#"> <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 추천 <span>6개</span></a> <a href="#"> <i
						class="fa fa-commenting-o" aria-hidden="true"></i> 댓글 <span> 3개</span></a>
				</div>
			</div>

			<div class="about-author" style="border-radius: 3%; border: 4px solid #59df57; border-radius: 5px;">
				<div class="row">
					<div class="col-md-2" style="text-align: center">
						<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="img-responsive" alt="" style="border-radius: 50%; width: 60px; height: 60px">
						<p style="margin: 2px">jjunest</p>
						<p style="font-size: 80%; color: gray; margin: 2px">2017-07-28</p>
					</div>
					<div class="col-md-6" style="">

						<h4 class="colored-text" style="height: 50px; line-height: 50px; white-space: nowrap;">금융 실명제 도입이 필요한가?</h4>
					</div>
					<div class="col-md-4">
						<div style="width: 50px; height: 50px; border-radius: 50%; font-size: 50px; color: white; line-height: 500px; text-align: center; background: green;"></div>
						<p>
							<span>* 본 의견은 '쇼피니언' 의견입니다 <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="본인의 의견을 SNS에 올리시면, 쇼피니언 지수가 높아집니다."></i></span>
						</p>
					</div>

				</div>

				<div class="row" style="margin-top: 5px">
					<div class="col-md-6" style="">
						<p>나의 찬성 근거</p>
						<p>
							<span class="badge" style="text-align: left; border-radius: 15%">결정적 이유</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
						<p>
							<span class="badge" style="text-align: left; border-radius: 15%">Top2</span>&nbsp 가나다라마바사아자차ㅋ타파
						</p>
						<p>
							<span class="badge" style="text-align: left; border-radius: 15%">Top3</span>&nbsp 가나다라마바사아자차ㅋ타파
						</p>
					</div>
					<div class="col-md-6" style="">
						<p>인정하는 반대편 근거</p>
						<p>
							<span class="label label-default">인정: <span>80</span>%
							</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
						<p>
							<span class="label label-default">인정: <span>70</span>%
							</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
						<p>
							<span class="label label-default">인정: <span>30</span>%
							</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
					</div>
				</div>
				<div class="row" style="margin-top: 5px">

					<div class="col-md-10" style="">
						<div>상세 의견</div>

						가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜.
						가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜.
					</div>
				</div>
				<div class="row" style="text-align: right;">

					<a href="#"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 신고</a> <a href="#"> <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 추천 <span>6개</span></a> <a href="#"> <i
						class="fa fa-commenting-o" aria-hidden="true"></i> 댓글 <span> 3개</span></a>
				</div>
			</div>
			<!--container-->

			<ul class="pager">
				<li class=""><a href="#" style="width: 100%">쇼피니언 의견 더보기 <span>&nbsp &nbsp&nbsp<i class="fa fa-commenting-o" aria-hidden="true"></i> 6개의 의견이 더 존재합니다
					</span></a></li>
			</ul>
		</div>
	</div>
	<!--blog full main container-->
	<div class="divide60"></div>
	<div class="container">
		<div class="row">
			<h3 class="heading">
				일반 의견 &nbsp&nbsp <span style="font-weight: normal; font-size: smaller; color: #b3bfdd"><i class="fa fa-comment"></i> 6</span>
			</h3>
			<div class="dropdown" style="text-align: right">
				<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
					추천순 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">추천순</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">최신순</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">댓글순</a></li>
				</ul>
				<button type="button" class="btn btn-primary">의견 쓰기</button>
			</div>


			<div class="about-author" style="border-radius: 3%; border: 4px solid #59df57; border-radius: 5px;">
				<div class="row">
					<div class="col-md-2" style="text-align: center">
						<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="img-responsive" alt="" style="border-radius: 50%; width: 60px; height: 60px">
						<p style="margin: 2px">jjunest</p>
						<p style="font-size: 80%; color: gray; margin: 2px">2017-07-28</p>
					</div>
					<div class="col-md-6" style="">

						<h4 class="colored-text" style="height: 50px; line-height: 50px; white-space: nowrap;">금융 실명제 도입이 필요한가?</h4>
					</div>
					<div class="col-md-4">
						<div style="width: 50px; height: 50px; border-radius: 50%; font-size: 50px; color: white; line-height: 500px; text-align: center; background: green;"></div>
						<p>
							<span>* 본 의견은 '일반' 의견입니다 <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="본인의 의견을 SNS에 올리시면, 쇼피니언 지수가 높아집니다."></i></span>
						</p>
					</div>

				</div>

				<div class="row" style="margin-top: 5px">
					<div class="col-md-6" style="">
						<p>나의 찬성 근거</p>
						<p>
							<span class="badge" style="text-align: left; border-radius: 15%">결정적 이유</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
						<p>
							<span class="badge" style="text-align: left; border-radius: 15%">Top2</span>&nbsp 가나다라마바사아자차ㅋ타파
						</p>
						<p>
							<span class="badge" style="text-align: left; border-radius: 15%">Top3</span>&nbsp 가나다라마바사아자차ㅋ타파
						</p>
					</div>
					<div class="col-md-6" style="">
						<p>인정하는 반대편 근거</p>
						<p>
							<span class="label label-default">인정: <span>40</span>%
							</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
						<p>
							<span class="label label-default">인정: <span>20</span>%
							</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
						<p>
							<span class="label label-default">인정: <span>80</span>%
							</span>&nbsp 가나다라마바사아자차ㅋ타파ㄴㅇㄹㅇㄴㄹㅇㄹㅇㄹㄴ123
						</p>
					</div>
				</div>
				<div class="row" style="margin-top: 5px">

					<div class="col-md-10" style="">
						<div>상세 의견</div>

						가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜.
						가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜. 가나다라마바사아자차카타파 학나다라맙사아자차ㅏ타파 하간낟라ㅏ바상? ㅇ러댣ㅇㄹㄴㄹ멜.
					</div>
				</div>
				<div class="row" style="text-align: right;">

					<a href="#"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 신고</a> <a href="#"> <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 추천 <span>6개</span></a> <a href="#"> <i
						class="fa fa-commenting-o" aria-hidden="true"></i> 댓글 <span> 3개</span></a>
				</div>
			</div>

			<ul class="pager">
				<li class=""><a href="#" style="width: 100%">일반 의견 더보기 <span>&nbsp &nbsp&nbsp<i class="fa fa-commenting-o" aria-hidden="true"></i> 6개의 의견이 더 존재합니다
					</span></a></li>
			</ul>

		</div>
	</div>


	<div class="divide60"></div>
	<div class="container">
		<div class="row">
			<h3 class="heading">
				댓글 &nbsp&nbsp <span style="font-weight: normal; font-size: smaller; color: #b3bfdd"><i class="fa fa-comment"></i> 6</span>
			</h3>
			<div class="dropdown" style="text-align: right">
				<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
					추천순 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">추천순</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">최신순</a></li>
				</ul>
				<button type="button" class="btn btn-primary">댓글쓰기</button>
			</div>
			<div class="comment-post">
				<div class="row">
					<div class="col-md-12" style="border-top: 0.5px double #ddd; margin-top: 30px; padding-top: 30px">
						<div class="comment-list">
							<h4>
								<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" style="border-radius: 50%" class="img-responsive" alt=""> 작성자: jjunest &nbsp
							</h4>
							<p>여기는 기타 댓글 의견입니다. 가나다라마바사아자차카타파하 가나다라맙사아자차카타파하 가나다라마밧아자차카타파 기는 기타 댓글 의견입니다. 가나다라마바사아자차카타파하 가나다라맙사아자차카타파하 가나다라마밧아자차카타파기는 기타 댓글 의견입니다. 가나다라마바사아자차카타파하 가나다라맙사아자차카타파하 가나다라마밧아자차카타파</p>
							<div class="row" style="text-align: right;">
								<span><i class="fa fa-calendar"></i> 31st july 2014</span> <a href="#"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 신고</a> <a href="#"> <i class="fa fa-thumbs-o-up"
									aria-hidden="true"></i> 추천 <span>6개</span></a>
							</div>
						</div>
						<!--comments list-->
					</div>

					<div class="col-md-12" style="border-top: 0.5px double #ddd; margin-top: 30px; padding-top: 30px">
						<div class="comment-list">
							<h4>
								<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" style="border-radius: 50%" class="img-responsive" alt=""> 작성자: jjunest &nbsp
							</h4>
							<p>여기는 기타 댓글 의견입니다. 가나다라마바사아자차카타파하 가나다라맙사아자차카타파하 가나다라마밧아자차카타파 기는 기타 댓글 의견입니다. 가나다라마바사아자차카타파하 가나다라맙사아자차카타파하 가나다라마밧아자차카타파기는 기타 댓글 의견입니다. 가나다라마바사아자차카타파하 가나다라맙사아자차카타파하 가나다라마밧아자차카타파</p>
							<div class="row" style="text-align: right;">
								<span><i class="fa fa-calendar"></i> 31st july 2014</span> <a href="#"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 신고</a> <a href="#"> <i class="fa fa-thumbs-o-up"
									aria-hidden="true"></i> 추천 <span>6개</span></a>
							</div>
						</div>
						<!--comments list-->
					</div>

				</div>
			</div>
			<ul class="pager">
				<li class=""><a href="#" style="width: 100%">댓글 더보기 <span>&nbsp &nbsp&nbsp<i class="fa fa-commenting-o" aria-hidden="true"></i> 6개의 의견이 더 존재합니다
					</span></a></li>
			</ul>

		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>



	<!-- 모달 및 숨겨져 있는 부분 -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

						</button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>

					</div>
					<div class="modal-body">...</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
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
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

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
		$(document).ready(function() {
			navMenuColorSetting();
			
		
		});

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
