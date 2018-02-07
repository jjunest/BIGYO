<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	/* contextpath cp : /bagyo */
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
</style>



</head>


<div class="top-bar-light">
	<div class="container">
		<div class="row">
			<div class="col-sm-5 hidden-xs">
				<div class="top-bar-socials"></div>
			</div>
			<div class="col-sm-7 text-right">
				<ul class="list-inline top-dark-right">


					<!-- 페이지를 검색해보고, SECURITY LOGIN이 되어 있으면 로그아웃을 보여주고, 아니면 로그인 메뉴를 보여준다  -->
					<c:set var="user" value="${pageContext.request.userPrincipal.name}" />
					<c:choose>
						<c:when test="${empty user}">
							<li><a href="${pageContext.request.contextPath}/login_custom"><i class="fa fa-lock"></i> 로그인</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<c:url value="/j_spring_security_logout" />"><i class="fa fa-lock"></i> 로그아웃</a></li>

						</c:otherwise>



					</c:choose>


					<li><a href="${pageContext.request.contextPath}/sign_up"><i class="fa fa-user"></i> 회원 가입</a></li>
					<li class=""><a href="${pageContext.request.contextPath}/admin">관리자 페이지 가기 </a></li>
				</ul>
				<div class="search">
					<form role="form">
						<input type="text" class="form-control" autocomplete="off" placeholder="Write something and press enter"> <span class="search-close"><i class="fa fa-times"></i></span>
					</form>
				</div>






			</div>
		</div>
	</div>
</div>
<!--top-bar end here-->
<!--navigation -->
<div class="navbar navbar-default navbar-static-top yamm sticky" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="SHOWPINION"></a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class=""><a href="#">홈 </a></li>
				<li class=""><a href="#">쇼피니언 소개 </a></li>
				<li class=""><a href="${pageContext.request.contextPath}/thisWeekTopics">이번주 쇼피니언 주제 </a></li>
				<li class=""><a href="${pageContext.request.contextPath}/all_TVshow_Topics">역대 TV토론 주제 </a></li>
				<li class=""><a href="${pageContext.request.contextPath}/all_Showpinion_Topics">역대 쇼피니언 선정 주제 </a></li>
				<li class=""><a href="${pageContext.request.contextPath}/rankings">랭킹 </a></li>
				<li class=""><a href="${pageContext.request.contextPath}/userInfo">프로필 </a></li>
				<li class=""><a href="${pageContext.request.contextPath}/writeTVTwopics">(관)TV토론 주제 </a></li>

				<!--features-->
				<!--menu Features li end here-->
				<!--mega menu end-->

				<!--                        <li class="dropdown">
                                                    <a href="#" class=" dropdown-toggle" data-toggle="dropdown"><i class="fa fa-lock"></i> Sign In</a>
                                                    <div class="dropdown-menu dropdown-menu-right dropdown-login-box animated fadeInUp">
                                                        <form role="form">
                                                            <h4>Signin</h4>
                        
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                                    <input type="text" class="form-control" placeholder="Username">
                                                                </div>
                                                                <br>
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                                    <input type="password" class="form-control" placeholder="Password">
                                                                </div>
                                                                <div class="checkbox pull-left">
                                                                    <label>
                                                                        <input type="checkbox"> Remember me
                                                                    </label>
                                                                </div>
                                                                <a class="btn btn-theme-bg pull-right">Login</a>
                                                                                                        <button type="submit" class="btn btn-theme pull-right">Login</button>                 
                                                                <div class="clearfix"></div>
                                                                <hr>
                                                                <p>Don't have an account! <a href="#">Register Now</a></p>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </li> menu login li end here-->
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	<!--container-->
</div>
<!--navbar-default-->

</html>