<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	/* contextpath cp : /bagyo */
	String cp = request.getContextPath();
%>
<%--ContextPath 선언 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
@font-face {
	
}

a {
	
}

.navbar-brand>img {
	width: 250px;
}

@media ( max-width :768px) {
	.navbar-brand>img {
		width: 200px;
	}
}
</style>

</head>





<!-- HEADER -->
<header id="pageTop" class="header"> <!-- TOP INFO BAR -->

<div class="nav-wrapper navbarWhite">

	<div class="container-fluid header-bg">
		<div class="row">
			<div class="col-lg-4 col-sm-4 col-xs-6 header-left empty">empty</div>
			<div class="col-lg-8 col-sm-8 col-xs-6 header-right empty">empty</div>
		</div>
	</div>

	<!-- NAVBAR -->
	<nav id="menuBar" class="navbar navbar-default lightHeader" role="navigation">
	<div class="container">



		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style = "margin-left: -150px" href="<%=cp%>/index"><img src="<%=cp%>/resources/img/JJUNBIT-BETA.png" alt="logo"></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav navbar-right">


				<li class=" dropdown singleDrop"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">정보제공 <i class="fa fa-angle-down"
						aria-hidden="true"></i></a>
					<ul class="dropdown-menu dropdown-menu-left">
						<li class=""><a href="<%=cp%>/coininfoboard/list" class="disabled">코인 정보</a></li>
						<li class="disabled"><a href="#">주식 정보 (준비중)</a></li>
					</ul></li>

			<!-- 	<li class=" dropdown singleDrop"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">종목 추천 <i class="fa fa-angle-down"
						aria-hidden="true"></i></a>
					<ul class="dropdown-menu dropdown-menu-left">
						<li class="disabled"><a href="#">코인 추천(준비중)</a></li>
						<li class="disabled"><a href="#">주식 추천 (준비중)</a></li>
					</ul></li> -->

	<li class=""><a href="<%=cp%>/coinCalculator" style="font-family: NavFont" id="navmenu_coinCalendar">계산기</a></li>
				<li class=""><a href="<%=cp%>/coinCalendar" style="font-family: NavFont" id="navmenu_coinCalendar">코인 달력</a></li>
				<li class=""><a href="<%=cp%>/freetalkboard/list" style="font-family: NavFont" id="navmenu_freetalkboard">자유 게시판 </a></li>
				<li class=""><a href="<%=cp%>/howToUseJunbit" style="font-family: NavFont" id="navmenu_howToUseJunbit">사용 방법 (필독) </a></li>
				<li class=""><a href="<%=cp%>/downloadJunbit" style="font-family: NavFont" id="navmenu_downloadJunbit">다운로드</a></li>
				<%-- 	<li class=""><a href="<%=cp%>/faqs" style="font-family: NavFont" id="navmenu_faqs">FAQ</a></li> --%>
				<!-- 페이지를 검색해보고, SECURITY LOGIN이 되어 있으면 로그아웃을 보여주고, 아니면 로그인 메뉴를 보여준다  -->
				<c:set var="user" value="${pageContext.request.userPrincipal.name}" />
				<c:choose>
					<c:when test="${empty user}">
	<li class=""><a href="<%=cp%>/loginform_custom" style="font-family: NavFont; color: blue" id="navmenu_login">로그인</a></li>
					</c:when>
					<c:otherwise>

						<li class=""><a href="<c:url value="/j_spring_security_logout" />" style="font-family: NavFont; color: blue"> <sec:authorize access="hasRole('ROLE_USER')"></sec:authorize> 로그아웃
						</a></li>

					</c:otherwise>



				</c:choose>

			</ul>
		</div>
	</div>
	</nav>
</div>


</header>




</html>
