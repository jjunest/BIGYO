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
<title>비트코인 주식 제테크 - 준트</title>

<!-- PLUGINS CSS STYLE -->
<link href="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/listtyicons/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/bootstrapthumbnail/bootstrap-thumbnail.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/datepicker/datepicker.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/selectbox/select_option1.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/isotope/isotope.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/plugins/map/css/map.css" rel="stylesheet">

<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Muli:200,300,400,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">

<!-- CUSTOM CSS -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

<!-- FAVICON -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="shortcut icon">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- INTERNAL CSS STYLE -->
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
	<div class="page-loader" style="background: url(resources/img/preloader.gif) center no-repeat #fff;"></div>

	<div class="main-wrapper">
		<!-- HEADER FILE INCLUDE  -->
		<jsp:include page="header.jsp"></jsp:include>

		<!-- PAGE TITLE SECTION -->
		<section class="clearfix pageTitleSection bg-image" style="background-image: url(resources/img/background/bg-page-title.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="pageTitle">
						<h2>
							적정 매도가 계산기<br> *조언: 과유불급
						</h2>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section class="clearfix listingSection">
		<div class="container">
			<div class="row">
				<div class="form-group col-sm-6 col-xs-12">
					<p>
						<label for="listingTitle">&nbsp 매수 가격</label> <span id="coin_buyPrice_show">- </span><input type="text" class="form-control" id="coin_buyPrice" class="" name="coin_buyPrice" placeholder="매수가격">

					</p>


				</div>
				<div class="form-group col-sm-6 col-xs-12">
					<p>
						<label for="listingTitle">&nbsp 매수 총 금액</label> <span id="coin_buyTotalMoney_show">- </span> <input type="text" class="form-control" id="coin_buyTotalMoney" class="" name="coin_buyTotalMoney"
							placeholder="매수 총 금액"
						>
					</p>
				</div>
				<div class="form-group col-sm-12 col-xs-12">
					<input type="text" class="form-control" id="coin_buyTotalQuantity" class="" style="color: red" name="coin_buyTotalQuantity" placeholder="매수 총 수량" readOnly>
				</div>


				<div class="form-group col-sm-12 col-xs-12">
					다짐: 나는 매수한 코인 중
					<select id="sellQuantityPercent" name="sellQuantityPercent">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
						<option value="60">60</option>
						<option value="70">70</option>
						<option value="80">80</option>
						<option value="90">90</option>
						<option value="100" selected="selected">100</option>
					</select>
					%를 총
					<select id="sellTotalNumber" name="sellTotalNumber">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>

					번에 걸쳐서 매도 할 것입니다.
				</div>
				<div class="form-group col-sm-12 col-xs-12">
					<input type="text" class="form-control" id="coin_sellTotalQuantity" class="" name="coin_sellTotalQuantity" style="color: blue" placeholder="매도 총 수량" readOnly>
				</div>


				<div id="sellDetailSection">
					<div class="form-group col-sm-12 col-xs-12 sellDetailDiv" id="sellDetailDiv">
						&nbsp &nbsp - 세부 매도 목표 : 매수 가격의
						<select id="sellDetailPricePercent" name="sellDetailPricePercent">
							<option value="10" selected="selected">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
							<option value="60">60</option>
							<option value="70">70</option>
							<option value="80">80</option>
							<option value="90">90</option>
							<option value="100">100</option>
						</select>
						%에서 총 매도 물량의
						<select id="sellDetailQuantityPercent" name="sellDetailQuantityPercent">
							<option value="10">10</option>
							<option value="20" selected="selected">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
							<option value="60">60</option>
							<option value="70">70</option>
							<option value="80">80</option>
							<option value="90">90</option>
							<option value="100">100</option>
						</select>
						% 를 판매하겟습니다. ->
						<div class="form-group col-sm-12 col-xs-12">
							<input type="text" class="form-control" id="coin_sellDetailInfoResult" class="" name="coin_sellDetailInfoResult" style="color: blue" placeholder="매도 목표:" readOnly>
						</div>
					</div>
					<div id="sellDetailSection_clone"></div>
				</div>









			</div>
		</div>
		</section>

		<section></section>

		<section></section>







		<!-- FOOTER FILE INCLUDE  -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


	<!-- JAVASCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/counter-up/jquery.counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/isotope/isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/fancybox/jquery.fancybox.pack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/isotope/isotope-triger.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/map/js/rich-marker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/map/js/infobox_packed.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/single-map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>


	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
	var sellTotalQuantity ="";
		$(document).ready(function() {
		
		
			navMenuColorSetting();
			//매수 시점 가격을 입력했을시 변동해야 하는 것들: 매수 총 수량 및 매도 총수량 변화(매도 비중 default 10%로 저장)
			priceInputboxSetting($("#coin_buyPrice"));
			//매수 시점 총 금액을 입력했을시 변동해야 하는 것들: 매수 총 수량 및 매도 총수량 변화(매도 비중 default 10%로 저장)
			priceInputboxSetting($("#coin_buyTotalMoney"));
			sellQuantityPercentChangeSetting();
			//총 몇번에 나눠 팔지 결정을 하면 sellDetailSection을 추가
			sellTotalNumberChangeSetting();
			//sellDetailResult 부분 채워주기 
		
			
		});
		
		//결과 세팅은, 1.매수가격이 변했을 경우, 2.매수 총금액이 변햇을 경우, 3.매수한 코인 중 x%변했을 경우, 4.총 매도 개수 변했을 경우, 5.세부 매도 목표의 input값 2가지가 변했을 경우 총 6가지에 실시간으로 일어난다.
		function sellDetaiResultSetting(){
			console.log("this is sellTotalQuantity:"+sellTotalQuantity);
			
			//1. 만약 총 매도수량이 저장되어 있지 않으면 , 아무런 행동도 취하지 않는다.
			if(sellTotalQuantity==""||isNaN(sellTotalQuantity)){
			
				console.log("매도 총 수량이 없습니다");
			}else{
				//만약 최초 구매 가격이 없다면 아무 행동도 취하지 않는다.
				var coin_buyPrice = $("#coin_buyPrice").val();
				if(coin_buyPrice==""||coin_buyPrice==null){
					console.log("매수 가격이 없습니다");
				}else{
					coin_buyPrice = removeCommaFunction(coin_buyPrice);
					var detailDivNumber = $(".sellDetailDiv").length;
				
					
					coin_buyPrice = removeCommaFunction(coin_buyPrice);
					for(var i=1;i<detailDivNumber+1;i++ ){
						//첫 번쨰 detailDiv을 게산하자 
						if(i==1){
							var goal_price_percent = $("#sellDetailPricePercent").val();
							coin_buyPrice = parseFloat(coin_buyPrice);
							goal_price_percent = parseFloat(goal_price_percent);
							var goal_price = coin_buyPrice*(1+goal_price_percent*0.01);
							var goal_quantity_percent = $("#sellDetailQuantityPercent").val();
							var goal_quantity = sellTotalQuantity* goal_quantity_percent*0.01;
							var goal_result_message =  "1차 목표 매도가: "+ goal_price+", 목표 매도 수량:"+goal_quantity+" 코인입니다";
							console.log('this is goalmessage:'+goal_result_message);
							$("#coin_sellDetailInfoResult").val(goal_result_message);
						}
				/* 		var detailClonePricePercentId = "sellDetailPricePercent"+i;
						var goal_price_percent = $(detailClonePricePercentId).val();
						coin_buyPrice = parseFloat(coin_buyPrice);
						goal_price_percent = parseFloat(goal_price_percent);
						var goal_price = coin_buyPrice*goal_price_percent*0.01;
						var detailCloneQuantityPercentId = "sellDetailQuantityPercent"+i;
						var goal_quantity_percent = $(detailCloneQuantityPercentId).val();
						var goal_quantity = sellTotalQuantity* goal_quantity_percent*0.01;
						var goal_result_message =  "목표 매도가는"+ goal_price+"목표 수량은"+goal_quantity+"입니다";
						console.log('this is goalmessage:'+goal_result_message); */
					}
					
					
				}
		
				
			}
			
			
		}
		function sellTotalNumberChangeSetting(){
			$("#sellTotalNumber").change(
					function() {
						var sellTotalNumber = $("#sellTotalNumber").val();
					
						//sellDetailDiv를 복제본을 만들어준다.
			sellTotalNumber = parseInt(sellTotalNumber);
			$("#sellDetailSection_clone").empty();
			 	for (i = 2; i < sellTotalNumber+1; i++) {
			 	
 var divClone =  $("#sellDetailDiv").clone();
 //clone된 것의 안에 아이디 바꾸기
 divClone.find("#sellDetailPricePercent").attr("id","sellDetailPricePercent"+i).attr("name","sellDetailPricePercent"+i);
 divClone.find("#sellDetailQuantityPercent").attr("id","sellDetailQuantityPercent"+i).attr("name","sellDetailQuantityPercent"+i);
 divClone.find("#coin_sellDetailInfoResult").attr("id","coin_sellDetailInfoResult"+i).attr("name","coin_sellDetailInfoResult"+i);
 $("#sellDetailSection_clone").append(divClone);
sellDetaiResultSetting();

}
			
						
		
				});
			
			
		}
		function sellQuantityPercentChangeSetting(){
			$("#sellQuantityPercent").change(
					function() {
					//퍼센트가 바뀌면 매수 가격 및 매도 원하는 비중을 받아와서 계산해준다. 현재 TotalQuantity를 받아온다.
		    var buyPrice = parseFloat(removeCommaFunction($("#coin_buyPrice").val()));
			var buyTotalMoney = parseFloat(removeCommaFunction($("#coin_buyTotalMoney").val()));
			var buyTotalQuantity = buyTotalMoney/buyPrice;
						sellTotalQuantitySetting(buyTotalQuantity);
					});

			
		}
		function sellTotalQuantitySetting(buyTotalQuantity){
			var sellQuantityPercent = $("#sellQuantityPercent").val();
			sellTotalQuantity = buyTotalQuantity*(sellQuantityPercent*0.01);
			if(isNaN(sellTotalQuantity)){
				//만약 몫이 숫자가 아니면 가만히 있고, 숫자가 맞으면 표시해준다.
			}else{
				$("#coin_sellTotalQuantity").val("매도 총 수량: "+sellTotalQuantity +' 개의 코인을 매도하겠습니다.');
				//총 팔고싶은 코인 개수를 세팅해주기
				sellTotalQuantity=sellTotalQuantity;
			
			}
			
		}
		function coin_buyTotalQuantitySetting(){
			var buyPrice = parseFloat(removeCommaFunction($("#coin_buyPrice").val()));
			var buyTotalMoney = parseFloat(removeCommaFunction($("#coin_buyTotalMoney").val()));
			var buyTotalQuantity = buyTotalMoney/buyPrice;
			if(isNaN(buyTotalQuantity)){
				//만약 몫이 숫자가 아니면 가만히 있고, 숫자가 맞으면 표시해준다.
				
			}else{
				$("#coin_buyTotalQuantity").val("매수 총 수량: "+buyTotalQuantity +' 개의 코인을 매수하였습니다.');
				
				//총 팔고싶은 코인 개수를 세팅해주기
				sellTotalQuantitySetting(buyTotalQuantity);
			}
		}
		function navMenuColorSetting() {
			/* navigation menu 주소에 따라서 active 설정 시작 */
			var urlpath = $(location).attr("pathname");
			//서버용
			if (urlpath.indexOf("/coinCalculator") != -1) {

				$("#navmenu_coinCalculator").css("color", "#39a1f4");

			}

		}
		
		function priceInputboxSetting(priceInputTagSelector){
			//숫자만 입력 가능하게 하는 자바스크립트 함수
			$(priceInputTagSelector).keypress(function (event) {				
				if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { event.preventDefault(); } });
			// 3자리 컴마를 위한 자바스크립트 함수
				$(priceInputTagSelector).keyup(function (event) {				
					this.value = comma(uncomma(this.value));
					//해당 숫자를 한글로 표시하는 setting 매번 키를 입력할 떄마다 실시간 변화
					priceKoreanChangeSetting();
					// 실시간으로 총 매수 수량 계산
					coin_buyTotalQuantitySetting();
				});
				
			function comma(str) {
			    str = String(str);
			    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			}
			function uncomma(str) {
			    str = String(str);
			    return str.replace(/[^\d]+/g, '');
			}
		}
		
		function priceKoreanChangeSetting(){
			var buyPriceHan = changeHangul($("#coin_buyPrice").val());
			var buyTotalMoneyHan = changeHangul($("#coin_buyTotalMoney").val());
			$("#coin_buyPrice_show").text("- "+ buyPriceHan);
			$("#coin_buyTotalMoney_show").text("- " + buyTotalMoneyHan);
			
		}
		
		
		//숫자 금액을 한글로 변환하는 함수. 
		function changeHangul(obj) {
		
			obj = removeCommaFunction(obj);
				//콤마 삭제 하는 부분 끝
				var num=obj;
				var hanA = new Array("","일","이","삼","사","오","육","칠","팔","구","십");
				var danA = new Array("","십","백","천","","십","백","천","","십","백","천","","십","백","천");
				var result = "";
				for(i=0; i<num.length; i++) {	str = ""; han = hanA[num.charAt(num.length-(i+1))];
				if(han != "") str += han+danA[i]; if(i == 4) str += "만 "; if(i == 8) str += "억 "; if(i == 12) str += "조 "; result = str + result; } if(num != 0) result = result + " 원"; 
				
				return result ;

		    return result;
		}
		
		function removeCommaFunction(obj){

			//콤마 삭제 하는 부분 시작
			    if ( typeof obj == "undefined" || obj == null || obj == "" ) {
			        return "";
			    }
			    obj = '' + obj;
			    obj= obj.replace(/(,)/g, "");
			return obj;
		}
		
	</script>
</body>

</html>
