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
						<img src="${pageContext.request.contextPath}/resources/img/customer-1.jpg" class="img-responsive" alt="" style="border-radius: 50%; width: 120px; height: 120px; display: inline;">
					</div>
					<div class="col-md-5">
						<div>JJUNEST</div>
						<div>소속: OO대학교</div>
						<div>안녕하세요. 사회 문제에 관심이 많은 열혈 대학생입니다.</div>
						<div>
							<a href="#" target="_blank">www.facebook.com/jjunest</a>
						</div>
						<div></div>
					</div>
					<div class="col-md-5"></div>
				</div>
				<div class="row" style="margin-top: 20px; margin-bottom: 20px">
					<div class="col-md-2" style="text-align: center; margin: 0 auto;">
						<button type="button" class="btn btn-default">
							인기지수 <i class="fa fa-heart-o" aria-hidden="true"></i>+1
						</button>
					</div>
					<div class="col-md-10">
						<div class="row" style="text-align: center;">
							<div class="col-md-3">
								<div style="">쇼피니언 지수</div>
								<div style="width: 30px; height: 1px; border: none; border-bottom: 1px solid #7e96d0; margin-bottom: 10px; margin: 0 auto;"></div>
								<div>
									<i class="fa fa-eye" aria-hidden="true"></i> &nbsp 30
								</div>
							</div>
							<div class="col-md-3">
								<div>일반의견 지수</div>
								<div style="width: 30px; height: 1px; border: none; border-bottom: 1px solid #7e96d0; margin-bottom: 10px; margin: 0 auto;"></div>
								<div>
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp 30
								</div>
							</div>
							<div class="col-md-3">
								<div>추천 지수</div>
								<div style="width: 30px; height: 1px; border: none; border-bottom: 1px solid #7e96d0; margin-bottom: 10px; margin: 0 auto;"></div>
								<div>
									<i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp 30
								</div>
							</div>
							<div class="col-md-3">
								<div>댓글 지수</div>
								<div style="width: 30px; height: 1px; border: none; border-bottom: 1px solid #7e96d0; margin-bottom: 10px; margin: 0 auto;"></div>
								<div>
									<i class="fa fa-commenting-o" aria-hidden="true"></i> &nbsp 30
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="divide40"></div>
		<div class="row">
			<h3 class="heading">
				<span> 인기 의견 TOP 5</span>
			</h3>

			<!--row-->
			<div class="row">
				<div class="">
					<div id="testi-carousel1" class="owl-carousel owl-theme owl-spaced">
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

					</div>
				</div>
			</div>
		</div>
		<div class="divide40"></div>
		<div class="row">
			<h3 class="heading">
				<span> 최근 의견 TOP 5 </span>
			</h3>

			<!--row-->
			<div class="row">
				<div class="">
					<div id="testi-carousel2" class="owl-carousel owl-theme owl-spaced">
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
					</div>
				</div>
			</div>
		</div>


		<div class="divide40"></div>
		<div class="row">
			<h3 class="heading">
				<span> 남긴 의견들 </span>
			</h3>
			<div class="row" style="margin: 20px">
				<div class="dropdown" style="text-align: right">
					<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
						<i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp쇼피니언 의견<span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
						<li role="presentation"><a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> &nbsp쇼피니언 의견</a></li>
						<li role="presentation"><a href="#"><i class="fa fa-eye" aria-hidden="true"></i> &nbsp일반 의견</a></li>
						<li role="presentation"><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> &nbsp추천한 의견</a></li>
					</ul>
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
			<div class="container">
				<ul class="pager">
					<li class=""><a href="#" style="width: 100%">더보기 +6 more</a></li>
				</ul>
			</div>

		</div>
	</div>
	<!--me page inner-->
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


	<script type="text/javascript">
		$(document).ready(function() {
			navMenuColorSetting();

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
