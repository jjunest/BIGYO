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
					<c:if test="${!empty user}">
						<li><a href="<c:url value="/j_spring_security_logout" />"><i class="fa fa-lock"></i> 로그아웃</a></li>
					</c:if>
					<c:if test="${empty user}">
						<li><a href="${pageContext.request.contextPath}/login_custom"><i class="fa fa-lock"></i> 로그인</a></li>
					</c:if>

					<li><a href="${pageContext.request.contextPath}/sign_up"><i class="fa fa-user"></i> 회원 가입</a></li>
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
			<a class="navbar-brand" href="index.html"><img style="width: 150px" src="${pageContext.request.contextPath}/resources/img/m2/logo5.png" alt="SHOWPINION"></a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class=""><a href="${pageContext.request.contextPath}/main"  id = "navmenu_main">미투코리아 소개 </a></li>
				<li class=""><a href="${pageContext.request.contextPath}/me_article_list" id = "navmenu_me_article_list">미투리스트 </a></li>
				<li class=""><a href="${pageContext.request.contextPath}/me_report_list" id = "navmenu_me_report_list">제보리스트 </a></li>
				<li class=""><a href="${pageContext.request.contextPath}/boardList" id = "navmenu_boardList">자유게시판 </a></li>
				<li class=""><a type="button" class="btn btn-default" id = "navmenu_me_report_write" href="${pageContext.request.contextPath}/me_report_write" style="color: black">제보하러가기</a></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class=""><a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/me_report_write_article" style="color: black">언론제보</a></li>

				</sec:authorize>



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