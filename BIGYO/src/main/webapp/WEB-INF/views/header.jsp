<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<%--ContextPath 선언 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>






  <!-- HEADER -->
    <header id="pageTop" class="header">

      <!-- TOP INFO BAR -->

      <div class="nav-wrapper navbarWhite">

        <div class="container-fluid header-bg">
          <div class="row">
            <div class="col-lg-4 col-sm-4 col-xs-6 header-left empty">empty
            </div>
            <div class="col-lg-8 col-sm-8 col-xs-6 header-right empty">empty
            </div>
          </div>
        </div>

        <!-- NAVBAR -->
        <nav id="menuBar" class="navbar navbar-default lightHeader" role="navigation">
          <div class="container">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index"><img src="resources/img/bigyo_logo_blue.png" alt="logo"></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right">

         
                  <li class=""><a href="serviceIntro" id ="navmenu_serviceIntro">서비스 소개 </a></li>
                  <li class=""><a href="companyIntro" id="navmenu_companyIntro">회사 소개 </a></li>
                  <li class=""><a href="eventHospitals" id = "navmenu_eventHospitals">할인 병원 </a></li>
                  <li class=""><a href="allHospitals" id = "navmenu_allHospitals">전국 검진 병원 </a></li>
                  <li class=""><a href="questions" id = "navmenu_questions">문의 사항 </a></li>
                </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
    
    
    

</html>
