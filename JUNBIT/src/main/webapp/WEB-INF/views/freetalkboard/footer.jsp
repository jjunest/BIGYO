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


<!-- FOOTER -->
<footer style="background-image: url(<%=cp%>/resources/img/background/bg-footer-2.jpg);" id = "footer"> <!-- FOOTER INFO --> < <!-- <div class="clearfix footerInfo">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="copyRightWrapper">
					<div class="row">
						<div class="col-sm-5 col-sm-push-7 col-xs-12">
							<ul class="list-inline socialLink">
								<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
							</ul>
						</div>
						<div class="col-sm-7 col-sm-pull-5 col-xs-12">
							<div class="copyRightText">
								<p>
									Copyright &copy; 2017. All Rights Reserved by <a href="#">Abdus</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div class="row">
			<div class="col-sm-7 col-xs-12">
				<div class="footerText">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
						laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor</p>
					<ul class="list-styled list-contact">
						<li><i class="fa fa-phone" aria-hidden="true"></i>[88] 657 524 332</li>
						<li><i class="fa fa-envelope" aria-hidden="true"></i><a href="#">info@listy.com</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-3 col-xs-12">
				<div class="footerInfoTitle">
					<h4>Links</h4>
				</div>
				<div class="useLink">
					<ul class="list-unstyled">
						<li><a href="dashboard.html">Dashboard</a></li>
						<li><a href="sign-up.html">Create Account</a></li>
						<li><a href="login.html">Login</a></li>

					</ul>
				</div>
			</div>
			<div class="col-sm-2 col-xs-12">
				<div class="footerInfoTitle">
					<h4>Company</h4>
				</div>
				<div class="useLink">
					<ul class="list-unstyled">
						<li><a href="contact-us.html">Contact Us</a></li>
						<li><a href="terms-of-services.html">Terms and Conditions</a></li>
						<li><a href="how-it-works.html">How It Works</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
</div> --> <!-- COPY RIGHT -->
<div class="clearfix copyRight">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="copyRightWrapper">
					<div class="row">
						<div class="col-sm-6 col-xs-12">
							<div class="copyRightText">
								<ul class="list-styled list-contact">
									<li><h3 style = "color: white">INNOVEST</h3></li>
									<li>개발자: 김준혁 (준트)</li>
									<li>주소: 경기도 용인시 수지구 풍덕천1동 </li>
									<li>Copyright &copy; 2017. All Rights Reserved by <a href="#">INNOVEST</a></li>
								
								</ul>
							</div>
						</div>
							<div class="col-sm-6 col-xs-12">
							<div class="copyRightText">
								<ul class="list-styled list-contact">
									<li><h3 style = "color: white">Contact Us</h3></li>
									<li><i class="fa fa-phone" aria-hidden="true"></i>010-7272-9771</li>
									<li><i class="fa fa-envelope" aria-hidden="true"></i><a href="#">jjunest@gmail.com</a></li>
										<li><i class="fa fa-youtube" aria-hidden="true"></i><a href="#"> YOUTUBE에서 '준트'를 구독해주세요</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
</footer>


</html>