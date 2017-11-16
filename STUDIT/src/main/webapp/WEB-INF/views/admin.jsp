<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 나누기의 몫을 정수값으로 구하기 위한 jstl 태그 라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Listsize를 위한 jstl태그라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>즐거운 웹/앱 코딩수업 STUDIT</title>
<!-- Plugins CSS -->
<link href="resources/css/plugins/plugins.css" rel="stylesheet">
<!--dz parallaxer-->
<link href="resources/dzsparallaxer/dzsparallaxer.css" rel="stylesheet">
<link href="resources/dzsparallaxer/scroller.css" rel="stylesheet">
<link href="resources/dzsparallaxer/advancedscroller/plugin.css" rel="stylesheet">
<!--smart form css-->
<link href="resources/smart-form/contact-recaptcha/css/smart-forms.css" rel="stylesheet">
<!-- load css for cubeportfolio -->
<link rel="stylesheet" type="text/css" href="resources/cubeportfolio/css/cubeportfolio.min.css">
<link href="resources/css/style.css" rel="stylesheet">
</head>
<body>


	<section id="pricing" class="bg-faded pt90 pb50">
	<div class="container">
		<div class="row">
			<div class="col-md-6 ml-auto mr-auto text-center mb30">
				<div class="section-title">
					<span class="section-subTitle">학부모 및 학생 과외 문의 사항 페이지</span>
					<h3 class="mb0">문의사항</h3>
				</div>
			</div>
		</div>
		<div class="row">
			
			<c:forEach var="listValue" items="${resultList}">
			
			<div class="col-md-4 mb40 wow fadeInUp" data-wow-delay=".2s">
				<div class="pricing-card active">
					<header class="pricing-header clearfix">
					<div class="price-title">제목: ${listValue.question_title}</div>
					</header>
					<div class="pricing-features">
						<ul class="list-unstyled">
							<li>연락처 : ${listValue.user_phone}</li>
							<li>비상연락처:${listValue.user_phone_extra}</li>
							<li>이름: ${listValue.user_name}</li>
							<li></li>
							<li>문의 내용 :${listValue.question_body}</li>
						</ul>
					</div>
					<!--pricing features-->
					<footer class="pricing-footer text-center"> <a href="#" class="btn btn-white-outline"> 날짜:${listValue.question_date} </a> </footer>
				</div>
				<!--/pricing card-->
			</div>
			
			</c:forEach>
			
		</div>
	</div>
	</section>
	<!--back to top-->
	<a href="#" class="back-to-top hidden-xs-down" id="back-to-top"><i class="fa fa-angle-up"></i></a>
	<!-- jQuery first, then Tether, then Bootstrap JS. -->
	<script type="text/javascript" src="resources/js/plugins/plugins.js"></script>
	<script type="text/javascript" src="resources/js/onepage.custom.js"></script>
	<!--dz parallaxer-->
	<script type="text/javascript" src="resources/dzsparallaxer/dzsparallaxer.js"></script>
	<script type="text/javascript" src="resources/dzsparallaxer/scroller.js"></script>
	<script type="text/javascript" src="resources/dzsparallaxer/advancedscroller/plugin.js"></script>
	<!-- load cubeportfolio -->
	<script type="text/javascript" src="resources/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
	<script type="text/javascript" src="resources/js/folio-load-more.js"></script>
	<script type="text/javascript" src="resources/js/testimonials.js"></script>
	<!--sky form plugin js-->
	<script type="text/javascript" src="resources/smart-form/contact-recaptcha/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="resources/smart-form/contact-recaptcha/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/smart-form/contact-recaptcha/js/additional-methods.min.js"></script>
	<script type="text/javascript" src="resources/smart-form/contact-recaptcha/js/smart-form.js"></script>
	<script src='https://www.google.com/recaptcha/api.js'></script>
</body>

</html>