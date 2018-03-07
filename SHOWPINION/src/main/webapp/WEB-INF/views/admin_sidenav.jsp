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

<div class="results-sidebar-box">
	<h4>관리자 메뉴</h4>
	<ul class="list-unstyled">
		<li><a id="admin_sidenav_insertTVTopic" href="${pageContext.request.contextPath}/admin_insert_TVTopic">TV토론 주제 입력</a></li>
		<li><a id="admin_sidenav_insert_normalTopic"  href="${pageContext.request.contextPath}/admin_insert_normalTopic">일반 토론 주제 입력</a></li>
		<li><a id="admin_sidenav_insertShowTopic" href="${pageContext.request.contextPath}/login_custom">나의 토론 주제 보기 (추후 개발)</a></li>
	</ul>
	<hr>
</div>
<!--sidebar box of search results end-->
<div class="results-sidebar-box">
	<h4>일반 사용자 페이지로 가기</h4>
	<ul class="list-unstyled">
		<li><a href="${pageContext.request.contextPath}/index">메인페이지로 </a></li>
		<li><a href="${pageContext.request.contextPath}/thisWeekTopics">이번주 주제 페이지로 </a></li>
		<li><a href="${pageContext.request.contextPath}/all_TVshow_Topics">모든 TV 토론 주제 보기</a></li>
		<li><a href="${pageContext.request.contextPath}/all_Showpinion_Topics">모든 쇼피티언 토론 주제 보기 </a></li>
	</ul>
</div>
<!--sidebar box of search results end-->



</html>