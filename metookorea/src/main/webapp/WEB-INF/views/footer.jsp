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

  <footer id="footer">
            <div class="container">

                <div class="row">
                    <div class="col-md-6 col-sm-6 ">
                        <div class="footer-col">
                            <h3>About us</h3>
                            <p> 
                            It is for justice by Kim & Yang
                            </p>
                        </div>                        
                    </div><!--footer col-->
                    <div class="col-md-6 col-sm-6 ">
                        <div class="footer-col">
                            <h3>Contact</h3>
                            <ul class="list-unstyled contact">
                                <li><p><strong><i class="fa fa-envelope"></i> Mail Us:</strong> <a href="#">jjunest@gmail.com</a></p></li>
                            </ul>
                        </div>                        
                    </div><!--footer col-->

                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="footer-btm">
                            <span>&copy;2018. All rights Reserved in 서프러제트</span>
                        </div>
                    </div>
                </div>
            </div>
        </footer><!--default footer end here-->
        
</html>