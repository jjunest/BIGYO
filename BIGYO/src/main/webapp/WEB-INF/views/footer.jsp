<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<%--ContextPath 선언 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


	<!-- FOOTER -->
		<footer
			style="background-image: url(resources/img/background/bg-footer-2.jpg);">
		<!-- FOOTER INFO -->
		<div class="clearfix footerInfo">
			<div class="container">
				<div class="row">
					<div class="col-sm-7 col-xs-12">
						<div class="footerText">
							<a href="index" class="footerLogo"><img
								src="resources/img/logo-footer.png" alt="Footer Logo"></a>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
								aute irure dolor</p>
							<ul class="list-styled list-contact">
								<li><i class="fa fa-phone" aria-hidden="true"></i>[88] 657
									524 332</li>
								<li><i class="fa fa-envelope" aria-hidden="true"></i><a
									href="#">info@listy.com</a></li>
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
								<li><a href="add-listings.html">Add Listing</a></li>
								<li><a href="edit-listings.html">Edit Listing</a></li>
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
								<li><a href="terms-of-services.html">Terms and
										Conditions</a></li>
								<li><a href="how-it-works.html">How It Works</a></li>
								<li><a href="payment-process.html">Payment</a></li>
								<li><a href="pricing-table.html">Pricing</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- COPY RIGHT -->
		<div class="clearfix copyRight">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="copyRightWrapper">
							<div class="row">
								<div class="col-sm-5 col-sm-push-7 col-xs-12">
									<ul class="list-inline socialLink">
										<li><a href="#"><i class="fa fa-facebook"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest-p"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-linkedin"
												aria-hidden="true"></i></a></li>
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
			</div>
		</div>
		</footer>


</html>