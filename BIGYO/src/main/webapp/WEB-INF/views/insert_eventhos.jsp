<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

<!-- SITE TITTLE -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>건강검진 비교 검색 서비스 검진모아</title>

<!-- PLUGINS CSS STYLE -->
<link href="resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link href="resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/plugins/listtyicons/style.css" rel="stylesheet">
<link href="resources/plugins/bootstrapthumbnail/bootstrap-thumbnail.css" rel="stylesheet">
<link href="resources/plugins/datepicker/datepicker.min.css" rel="stylesheet">
<link href="resources/plugins/selectbox/select_option1.css" rel="stylesheet">
<link href="resources/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet">
<link href="resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
<link href="resources/plugins/isotope/isotope.min.css" rel="stylesheet">
<link href="resources/plugins/map/css/map.css" rel="stylesheet">

<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Muli:200,300,400,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">

<!-- CUSTOM CSS -->
<link href="resources/css/style.css" rel="stylesheet">

<!-- FAVICON -->
<link href="resources/img/favicon.png" rel="shortcut icon">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- INTERNAL CSS STYLE -->
<style>
.service_price_age_inputTags.hidden {
	visibility: hidden;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}

.service_price_age_inputArea {
	margin: 10px;
}

.pic_removeBT {
	color: blue;
	position: absolute;
	top: 5px;
	right: 10px;
}

.hosPicPreviewDiv .pic_removeBT:hover {
	color: red;
}

.ImgsPreviewDiv {
	display: inline-block;
	position: relative;
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
						<h2>병원 정보 입력 페이지</h2>
					</div>
				</div>
			</div>
		</div>
		</section>

		<!-- DASHBOARD ORDERS SECTION -->
		<section class="clearfix bg-dark listingSection">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<form id="insertHospitalForm" action="insert_eventhos_process" method="post" class="listing__form" enctype="multipart/form-data">
						<div class="dashboardPageTitle text-center">
							<h2>건강검진 정보 입력</h2>
						</div>
						<div class="dashboardBoxBg mb30">
							<div class="profileIntro paraMargin">
								<h3>CHECKUP_INFO TABLE 정보 삽입</h3>
								<div class="row">
									<!-- 
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingCategory">Category</label>
										<div class="contactSelect">
											<select name="guiest_id9" id="guiest_id9" class="select-drop">
												<option value="0">All Category</option>
												<option value="1">Restaurant</option>
												<option value="2">Bar</option>
												<option value="3">Cafe</option>
											</select>
										</div>
									</div>
									-->

									<!-- chk_rcdno, chk_hos_name, chk_hos_pnum, chk_price, chk_loc_sido, chk_loc_full, chk_loc_lat, chk_loc_lng, chk_target_age, chk_info_link, chk_mid_company, chk_mid_company_pnum, chk_mid_company_link, chk_end_date -->
									<!-- hos_rcdno, hos_chk_rcdno, hos_pic_link -->
									<!--  hos_rcdno, hos_chk_rcdno, hos_pic_link -->
									<div class="form-group col-sm-6 col-xs-12">


										<label for="listingTitle">병원 이름(chk_hos_name)</label>
										<div class="row">
											<input type="text" class="form-control col-xs-8" style="width: 70%" id="chk_hos_name" name="chk_hos_name" placeholder="병원 정보를 검색해서 입력하시거나 직접 입력하세요.">
											<button type="button" id="hospitalModalBT" class="btn btn-primary col-xs-4" style="width: 25%; margin-left: 2%" data-toggle="modal" data-target="#hospitalModal">기존병원검색</button>
										</div>
									</div>
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">병원 전화(chk_hos_pnum)</label> <input type="text" class="form-control" id="chk_hos_pnum" name="chk_hos_pnum" placeholder="병원 전화(chk_hos_pnum)">
									</div>
									<!-- 	<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">검진 가격(chk_price)</label> <input type="text" class="form-control" name="chk_price" placeholder="검진 가격(chk_price)">
									</div> -->
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">전체 구 주소(chk_loc_full)</label> <input type="text" class="form-control" id="chk_loc_full" name="chk_loc_full" placeholder="주소 입력을 하시려면 클릭하세요" readonly>
									</div>
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">전체 도로명 주소(chk_loc_full_road)</label> <input type="text" class="form-control" id="chk_loc_full_road" name="chk_loc_full_road" placeholder="도로명주소" readonly>
									</div>
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">시/도(chk_loc_sido)</label> <input type="text" class="form-control" id="chk_loc_sido" name="chk_loc_sido" placeholder="시/도(chk_loc_sido)" readonly>
									</div>
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">위도(chk_loc_lat)- 세로</label> <input type="text" class="form-control" id="chk_loc_lat" name="chk_loc_lat" placeholder="경도(chk_loc_lat)" readonly>
									</div>
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">경도(chk_loc_lng)- 가로</label> <input type="text" class="form-control" id="chk_loc_lng" name="chk_loc_lng" placeholder="위도(chk_loc_lng)" readonly>
									</div>
									<div class="form-group col-sm-12 col-xs-12"></div>

									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">주관 업체(chk_mid_company)</label> <input type="text" class="form-control" name="chk_mid_company" placeholder="주관 업체(chk_mid_company)">
									</div>
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">주관 업체 전화(chk_mid_company_pnum)</label> <input type="text" class="form-control" name="chk_mid_company_pnum" placeholder="주관 업체 전화(chk_mid_company_pnum)">
									</div>
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">주관 업체 링크(chk_mid_company_link)</label> <input type="text" class="form-control" name="chk_mid_company_link" placeholder="주관 업체 링크(chk_mid_company_link)">
									</div>

									<div class="form-group col-sm-12 col-xs-12"></div>
									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">정보 제공 링크(chk_info_link)</label> <input type="text" class="form-control" name="chk_info_link" placeholder="정보 제공 링크(chk_info_link)">
									</div>


									<div class="form-group col-sm-6 col-xs-12">
										<label for="listingTitle">서비스 마감 날짜(chk_end_date)</label> <input type="date" class="form-control" id="chk_end_date" name="chk_end_date" placeholder="마감 날짜(chk_end_date)">
									</div>

								</div>
							</div>
						</div>

						<div class="dashboardBoxBg mb30">
							<div class="profileIntro paraMargin">
								<h3>hos_info TABLE 정보 삽입 (병원 사진을 넣어주세요)</h3>
								<div class="row">
									<div class="form-group col-xs-12">
										<div class="imageUploader text-center">
											<div class="file-upload">
												<div class="upload-area upload-area-hosTable">
													<input type="file" id="imageFile" name="imageFile" class="file" multiple="multiple">
													<button class="browse" type="button">Click or Drag images here</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="">
									<div>병원 검색을 통해 삽입할 병원 사진들</div>
									<div id="searchedHosPictures"></div>
								</div>
							</div>
						</div>

						<div class="dashboardBoxBg mb30">
							<div class="profileIntro paraMargin">
								<h3>service_info TABLE 정보 삽입 (건강검진 정보 사진을 넣어주세요)</h3>
								<div class="row">
									<div class="form-group col-xs-12">
										<div class="imageUploader text-center">
											<div class="file-upload">
												<div class="upload-area upload-area-servTable">
													<input type="file" id="serviceFile" name="serviceFile" class="file" multiple="multiple">
													<button class="browse" type="button">Click or Drag images here</button>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group col-sm-12 col-xs-12">
										<label for="listingTitle"> service_price & service_age TABLE 정보 삽입</label>
									</div>
									<div class="form-group col-sm-12 col-xs-12">
										<label for="listingTitle">건강검진 상품 개수</label>
										<select id="service_priceTotalNum" name="service_priceTotalNum">
											<option value="1">1개</option>
											<option value="2">2개</option>
											<option value="3">3개</option>
											<option value="4">4개</option>
											<option value="5">5개</option>
										</select>
									</div>

									<div class="row service_price_age_inputArea">
										<!-- 첫 번쨰  inputTags 부분은 항상 보여지는 부분 -->
										<div class="row service_price_age_inputTags" id="service_price_age_inputTags1">
											<div class="form-group col-sm-6 col-xs-12">
												<p>
													<label for="listingTitle">&nbsp 서비스 가격</label>
												</p>
												<input type="text" class="form-control" id="serv_price1" class="serv_price_inputbox" name="serv_price1" placeholder="서비스 가격 (serv_price)">
											</div>
											<div class="form-group col-sm-6 col-xs-12">
												<p>
													<label for="listingTitle">&nbsp 추천 연령대(serv_target_age)</label>
												</p>
												<label class="checkbox-inline"> <input type="checkbox" name="serv_age1" value="0"> 전체 연령
												</label> <label class="checkbox-inline"> <input type="checkbox" name=serv_age1 value="20">20대
												</label> <label class="checkbox-inline"> <input type="checkbox" name="serv_age1" value="30">30대
												</label><label class="checkbox-inline"> <input type="checkbox" name="serv_age1" value="40">40대
												</label><label class="checkbox-inline"> <input type="checkbox" name="serv_age1" value="50">50대
												</label>
											</div>
										</div>
										<!-- 두번째부터 다섯번째 inputTags 부분은 hiddenPart -->
										<c:forEach var="i" begin="2" end="5" step="1" varStatus="indexNum">
											<div class="row service_price_age_inputTags hidden" id="service_price_age_inputTags${indexNum.index}">
												<div class="form-group col-sm-6 col-xs-12">
													<p>
														<label for="listingTitle">&nbsp 서비스 가격</label>
													</p>
													<input type="text" class="form-control" id="serv_price${indexNum.index}" class="serv_price_inputbox" name="serv_price${indexNum.index}" placeholder="서비스 가격 (serv_price)">
												</div>
												<div class="form-group col-sm-6 col-xs-12">
													<p>
														<label for="listingTitle">&nbsp 추천 연령대(serv_target_age)</label>
													</p>
													<label class="checkbox-inline"> <input type="checkbox" name="serv_age${indexNum.index}" value="0"> 전체 연령
													</label> <label class="checkbox-inline"> <input type="checkbox" name="serv_age${indexNum.index}" value="20">20대
													</label> <label class="checkbox-inline"> <input type="checkbox" name="serv_age${indexNum.index}" value="30">30대
													</label><label class="checkbox-inline"> <input type="checkbox" name="serv_age${indexNum.index}" value="40">40대
													</label><label class="checkbox-inline"> <input type="checkbox" name="serv_age${indexNum.index}" value="50">50대
													</label>
												</div>
											</div>
										</c:forEach>
									</div>

								</div>
							</div>
						</div>




						<div class="form-footer text-center">
							<button id="submitbutton" type="submit" class="btn-submit">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		</section>



		<!-- FOOTER FILE INCLUDE  -->
		<jsp:include page="footer.jsp"></jsp:include>

		<!-- HIDDEN PART : HOSPITAL MODAL 부분 -->
		<!-- Modal -->
		<div id="hospitalModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">병원 정보 검색</h4>
					</div>
					<div class="modal-body" id="searchHosModalContent">
						<p>Some text in the modal.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-md" style="width: 100px" data-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- JAVASCRIPTS -->
	<script src="resources/plugins/jquery/jquery.min.js"></script>
	<script src="resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/plugins/smoothscroll/SmoothScroll.min.js"></script>
	<script src="resources/plugins/waypoints/waypoints.min.js"></script>
	<script src="resources/plugins/counter-up/jquery.counterup.min.js"></script>
	<script src="resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="resources/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="resources/plugins/isotope/isotope.min.js"></script>
	<script src="resources/plugins/fancybox/jquery.fancybox.pack.js"></script>
	<script src="resources/plugins/isotope/isotope-triger.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58"></script>
	<script src="resources/plugins/map/js/rich-marker.js"></script>
	<script src="resources/plugins/map/js/infobox_packed.js"></script>
	<script src="resources/js/single-map.js"></script>
	<script src="resources/js/map.js"></script>
	<script src="resources/js/custom.js"></script>
	<script src='resources/lib/proj4.js'></script>
	<script>
		var upLoadAreaDiv = $(".upload-area");
		var upLoadAreaDiv_hosTable_string = ".upload-area-hosTable";
		var upLoadAreaDiv_servTable_string = ".upload-area-servTable";
		var upLoadAreaDiv_hosTable_selector = $(".upload-area-hosTable");
		var upLoadAreaDiv_servTable_selector = $(".upload-area-servTable");
		//rowCount 는 StatusBar 생성 시에 사용한다. createStatusbar() 함수에서 사용한다.  
		var rowCount = 0;
		//전역변수, hospital data를 받아온다.
		var searchHosInfoDataList;
		
		// html dom 이 다 로딩된 후 실행된다. 
		$(document).ready(function() {
			console.log("javascript in insert_eventhos.jsp");
			// drag & drop 시에 Jquery 로 css 변화 효과 주기
			dragAndDropJqueryCss();
			// Input multiple files 변화 시에, inputfiles 정리해주고, status div 알맞게 추가하기.
			inputFilesChange();
			displayFilesInDiv_inDatabase();
			// service 상품의 개수를 선택하면, 해당 갯수 만큼 가격 및 연령대 입력란을 만들어주는 함수
			servicepriceTotalNumChange();
			// DatePicker 한글화로 만들고, input TAG DATE 부분의 DatePicker 달력을 자동으로 Open시키는 함수.
			datePickerSetting();
			//serv_price_inputbox 에 숫자만 입력하게 & 3자리 단위 씩 가격 표시
			priceInputboxSetting();
			// 주소 검색을 위한 chk_loc_full input tag 설정 시작
			inputTag_chk_loc_full_Setting();
			// 기존 저장된 병원 검색을 위한 hospitalModal 처리.
			hopsitalModalSetting();
			//병원사진 x표시 눌렀을 시에 사진이 없어지고, hidden inputbox로, deleteFile name & original name을 전달하자.
			clickXButtonOnPicture();
			//insertForm을 제출하는 버튼을 눌렀을 경우
			insertFormSubmit();
			
		});
		

		
		
		function insertFormSubmit(){
			
				$("#insertHospitalForm").submit( function(e) {
				
				//2. deleteHos 와 Serv 사진의 rcdno를 inputtag에 저장해서 넘겨준다.
			      $('<input />').attr('type', 'hidden')
		          .attr("name", "selectedHosPic_hospic_info")
		          .attr('value', JSON.stringify(selectedHosPic_hospic_info))
		          .appendTo('#insertHospitalForm');
				
		      return true;
		  });
			
		}
		
		function clickXButtonOnPicture(){
			//병원 사진에 있는 x버튼 클릭 시..
			$(document).on('click', ".pic_removeBT", function(e) {
				console.log("this is x button clicked");
				e.preventDefault();
		 		var confirmAnwer = confirm("해당 병원 사진을 정말로 삭제하겠습니까?")
				if(confirmAnwer ==true){
					var hos_rcdno = $(this).parent("a").attr('hos_rcdno');
					$(this).parent().remove();
					for (i = 0; i < selectedHosPic_hospic_info.length; i++) {
						if(selectedHosPic_hospic_info[i].hos_rcdno==hos_rcdno){
							console.log("this is selectedHosPicLoop and hos_rcdno1==hosrcdno2");
							selectedHosPic_hospic_info.splice(i,1);
						}
					}
					
					
					console.log("this is selectedPicData when x button clicked:"+JSON.stringify(selectedHosPic_hospic_info));
				}else{
					//아니오라고 눌렀을 시에, 아무 이벤트도 발생하지 않는다.
				}      
			});
			
			
			
			
		}
		
		
		
		function hopsitalModalSetting(){
			$("#hospitalModalBT").click(function(e){
				console.log('this is hospitalModalBT clicked');
				var chk_hos_name = $('#chk_hos_name').val();
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/searchHospitalInfoFromDatabase",
					data : {
						"chk_hos_name" : chk_hos_name
					},
					success : function(data) {
						var hosSearchBodyHtml = "";
						searchHosInfoDataList = data;
						for(var i=0; i<data.length; i++){
						
							console.log("this is data's name");
							
							hosSearchBodyHtml = hosSearchBodyHtml+"<div style =\"background:#eff0f2; margin:5px\"><a href=\"javascript:selectHospitalInfo("+i+");\"><p style =\"background:#eff0f2; margin:3px\">"+data[i].chk_hos_name+"</p><p style =\"background:#eff0f2; margin:3px\">병원 주소: "+data[i].chk_loc_full+"</p> <p style =\"background:#eff0f2; margin:3px\"> 병원사진:"+data[i].hosList.length+"개</p></a></div>";
			            }
						 $("#searchHosModalContent").html(hosSearchBodyHtml);
			                $("#hospitalModal").modal('show');
					},
					error : function(e) {
						console.log("searchHospital ajax 실패! ");
						alert('오류가 발생했습니다. 아래 연락처로 문제 상황을 말씀해주시기 바랍니다: 010-7272-9771');
					}
				});
			  });
		}
		var selectedHosPic_hospic_info;
		function selectHospitalInfo(index){
			//선택된 병원 사진의 hos_rcdno를 저장하는 배열을 초기화 시켜준다.
			selectedHosPic_hospic_info ="";
			//selectedHosPic_hosList 를 저장한다. 
			selectedHosPic_hospic_info = searchHosInfoDataList[index].hosList;
			console.log("this is selectedPicData :"+JSON.stringify(selectedHosPic_hospic_info));
		
			
			//1. hospital MODAL 에서 병원을 선택했을때 input tag들에다 정보를 넣어준다.
			$("#chk_hos_name").val(searchHosInfoDataList[index].chk_hos_name);
			$("#chk_hos_pnum").val(searchHosInfoDataList[index].chk_hos_pnum);
			$("#chk_loc_full").val(searchHosInfoDataList[index].chk_loc_full);
			$("#chk_loc_full_road").val(searchHosInfoDataList[index].chk_loc_full_road);
			$("#chk_loc_sido").val(searchHosInfoDataList[index].chk_loc_sido);
			$("#chk_loc_lat").val(searchHosInfoDataList[index].chk_loc_lat);
			$("#chk_loc_lng").val(searchHosInfoDataList[index].chk_loc_lng);
			
			console.log("this is hosList:"+searchHosInfoDataList[index].hosList.length);
			$( "#searchedHosPictures" ).empty();
			for(var i =0; i<searchHosInfoDataList[index].hosList.length; i++ ){
				var hosPictureDiv = "<div class=\"ImgsPreviewDiv hosPicPreviewDiv\" style = \"margin:5px\"><a href="+searchHosInfoDataList[index].hosList[i].hos_pic_link+" target=\"_blank\" hos_rcdno="+searchHosInfoDataList[index].hosList[i].hos_rcdno+"><img src="+searchHosInfoDataList[index].hosList[i].hos_pic_link+" class=\"img-rounded ImgsTag\" height=\"200\" width=\"200\" ><span class=\"glyphicon glyphicon-remove pic_removeBT\" id=\"pic_removeBT\" aria-hidden=\"true\"></span></a></div>";
				$(hosPictureDiv).appendTo( $( "#searchedHosPictures" ) );
			}
			   $("#hospitalModal").modal('toggle');
			   
			   
			   
		}
		
		
		function displayFilesInDiv_inDatabase(){
			
			
		}
		
		
		
		function inputTag_chk_loc_full_Setting(){
			$("#chk_loc_full").click(function(e){
				e.preventDefault();
				goPopup();
			});
			
		}
		
		/* 도로명 주소를 위한 함수 시작  */
		function goPopup(){
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
			//로컬용 팝업
			var pop = window.open("${pageContext.request.contextPath}/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
			//서버용 팝업
			//var pop = window.open("/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,entX,entY){
				// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
				
				console.log('this is jibunAddr:'+jibunAddr);
				
				$("#chk_loc_full").val(jibunAddr);
				$("#chk_loc_full_road").val(roadFullAddr);
				$("#chk_loc_sido").val(siNm);
				
				var point1 = [entX, entY];

				var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs";
				var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs";
				 var lonAndLat1 = proj4(firstProjection, secondProjection, point1);// from 경위도

				//I'm not going to redefine those two in latter examples.
				var result = proj4(firstProjection, secondProjection, point1);
				console.log('this is result:' + result);
				
				
				$("#chk_loc_lat").val(result[1]);
				$("#chk_loc_lng").val(result[0]);
	
	
					
			/* 	document.form.roadFullAddr.value = roadFullAddr;
				document.form.roadAddrPart1.value = roadAddrPart1;
				document.form.roadAddrPart2.value = roadAddrPart2;
				document.form.addrDetail.value = addrDetail;
				document.form.engAddr.value = engAddr;
				document.form.jibunAddr.value = jibunAddr;
				document.form.zipNo.value = zipNo;
				document.form.admCd.value = admCd;
				document.form.rnMgtSn.value = rnMgtSn;
				document.form.bdMgtSn.value = bdMgtSn;
				document.form.detBdNmList.value = detBdNmList;
				document.form.bdNm.value = bdNm;
				document.form.bdKdcd.value = bdKdcd;
				document.form.siNm.value = siNm;
				document.form.sggNm.value = sggNm;
				document.form.emdNm.value = emdNm;
				document.form.liNm.value = liNm;
				document.form.rn.value = rn;
				document.form.udrtYn.value = udrtYn;
				document.form.buldMnnm.value = buldMnnm;
				document.form.buldSlno.value = buldSlno;
				document.form.mtYn.value = mtYn;
				document.form.lnbrMnnm.value = lnbrMnnm;
				document.form.lnbrSlno.value = lnbrSlno;
				document.form.emdNo.value = emdNo;
				document.form.entX.value = entX;
				document.form.entY.value = entY; */
		}
		/* 도로명 주소를 위한 함수 끝  */
		
		function priceInputboxSetting(){
			//숫자만 입력 가능하게 하는 자바스크립트 함수
		 	for(var i=1; i<6; i++){
			$("#serv_price"+i).keypress(function (event) {				
				console.log('event.value:'+this.value);
				if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { event.preventDefault(); } });
			} 
			// 3자리 컴마를 위한 자바스크립트 함수
			for(var i=1; i<6; i++){
				$("#serv_price"+i).keyup(function (event) {				
					this.value = comma(uncomma(this.value));
				});
				
			}
			function comma(str) {
			    str = String(str);
			    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			}
			function uncomma(str) {
			    str = String(str);
			    return str.replace(/[^\d]+/g, '');
			}
		}
	
		
		function datePickerSetting() {

		}
		function servicepriceTotalNumChange() {
			$("#service_priceTotalNum").change(
					function() {
						
						//service_price_age_inputTags 클래스들은 모두 hidden 클래스를 넣어서 안 보이게 한다. 
						hide_service_price_inputArea();
						$("#service_price_age_inputTags1")
								.removeClass("hidden");
						for (i = 2; i < parseInt(this.value) + 1; i++) {
							console.log('this is loop3');
							$("#service_price_age_inputTags" + i)
									.removeClass("hidden");
							// 해당부분을 hidden후에는 값도 초기화 시켜줘야 한다. 
							 $("#service_price_age_inputTags"+i+" input:text").val("");
							$("#service_price_age_inputTags"+i+" input:checkbox").attr('checked',false);
							
						}

					});

		}

		function hide_service_price_inputArea() {
			$(".service_price_age_inputTags").addClass("hidden");

		}


	  	function inputFilesChange() {
			 //hos_info TABLE 의 input tag가 바뀌었다면.... 
			$("#imageFile").change(
					function() {
						console.log('this is #imagefile change started');
						 //input tag의 아이디값으로 files를 받으면, multiplartServletRequest 파일을 받을 수 있다	
						var mulRequestDatas = $("#imageFile")[0].files;
						 //inputtag에 넣어저 있는 multipart request datas 를 div 에 표시해준다. 
						// 1. change 시에 기존 statusbar를 지우고, div class에 선택된 파일들을 표시해준다.
						deleteStatusbar(upLoadAreaDiv_hosTable_string);
						displayFilesInDiv(mulRequestDatas,
								upLoadAreaDiv_hosTable_selector);
						console.log('this is imagefile change end');
					});

			// serv_info TABLE 의 input tag가 바뀌었다면.... 
			$("#serviceFile").change(
					function() {
						console.log('this is #serviceFile change started');
						// input tag의 아이디값으로 files를 받으면, multiplartServletRequest 파일을 받을 수 있다	
						var mulRequestDatas = $("#serviceFile")[0].files;
						// inputtag에 넣어저 있는 multipart request datas 를 div 에 표시해준다. 
						// 1. change 시에 기존 statusbar를 지우고, div class에 선택된 파일들을 표시해준다.
						deleteStatusbar(upLoadAreaDiv_servTable_string);
						displayFilesInDiv(mulRequestDatas,
								upLoadAreaDiv_servTable_selector);
						console.log('this is imagefile change end');
					});
		}  
	
		
		// StatusBar 생성하기
		function createStatusbar(upLoadAreaDiv) {
			console.log('this is createStatusBar()');
			rowCount++;
			var rowCountForDelete = rowCount;
			var row = "odd";
			if (rowCount % 2 == 0)
				row = "even";
			this.statusbar = $("<div class='statusbar "+row+"'></div>");
			this.filename = $("<div class='filename'></div>").appendTo(
					this.statusbar);
			this.size = $("<div class='filesize'></div>").appendTo(
					this.statusbar);

			upLoadAreaDiv.after(this.statusbar);

			this.setFileNameSize = function(name, size) {
				var sizeStr = "";
				var sizeKB = size / 1024;
				if (parseInt(sizeKB) > 1024) {
					var sizeMB = sizeKB / 1024;
					sizeStr = sizeMB.toFixed(2) + " MB";
				} else {
					sizeStr = sizeKB.toFixed(2) + " KB";
				}

				this.filename.html(name);
				this.size.html(sizeStr);
			}

		}

		// 1. change 시에 div class에 선택된 파일들을 표시해준다.
		function displayFilesInDiv(mulRequestDatas,
				upLoadAreaDiv_hosTable_selector) {
			console.log('this is displayFilesInDiv() length:'
					+ mulRequestDatas.length);
			for (var i = 0; i < mulRequestDatas.length; i++) {

				var fd = new FormData();
				fd.append('file', mulRequestDatas[i]);

				var status = new createStatusbar(
						upLoadAreaDiv_hosTable_selector); //Using this we can set progress.
				status.setFileNameSize(mulRequestDatas[i].name,
						mulRequestDatas[i].size);

			}

		}
		// 모든 statusbar 삭제
		function deleteStatusbar(upLoadAreaDiv_hosTable_string) {
			console.log('this is deleteStatusbar() and upLoadAreaDiv_hosTable_string:'
							+ upLoadAreaDiv_hosTable_string);
			//upLoadAreaDiv_hosTable 에 있는 .statusbar 삭제     
			$(upLoadAreaDiv_hosTable_string).siblings(".statusbar").remove();

		}

		// drag & drop 시에 Jquery 로 css 변화 효과 주기
		function dragAndDropJqueryCss() {
			$(document).on("dragenter", ".upload-area", function(e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('border', '2px solid #0B85A1');
			});
			$(document).on("dragover", ".upload-area", function(e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('border', '2px solid #0B85A1');
			});
			$(document).on("drop", ".upload-area-hosTable", function(e) {
				console.log('this is upload-area-hosTable drop start');
				$(this).css('border', '2px dotted #0B85A1');
				e.preventDefault();
				var files = e.originalEvent.dataTransfer.files;
				/* handleFileUpload(files, upLoadAreaDiv); */
				/* 1. drop된 파일을 input file에 넣기. */

				var mulRequestDatas = e.originalEvent.dataTransfer.files;
				/* 2. #imageFile files를 변경해주고 변경해주면 자동으로 #imageFile Change() event 가 발생() */
				$("#imageFile")[0].files = mulRequestDatas;

			});
			$(document).on("drop", ".upload-area-servTable", function(e) {
				console.log('this is upload-area-servTable drop start');
				$(this).css('border', '2px dotted #0B85A1');
				e.preventDefault();
				var files = e.originalEvent.dataTransfer.files;
				/* handleFileUpload(files, upLoadAreaDiv); */
				/* 1. drop된 파일을 input file에 넣기. */

				var mulRequestDatas = e.originalEvent.dataTransfer.files;
				/* 2. #imageFile files를 변경해주고 변경해주면 자동으로 #imageFile Change() event 가 발생() */
				$("#serviceFile")[0].files = mulRequestDatas;

			});
			$(document).on('dragleave', ".upload-area", function(e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('border', '2px dotted #0B85A1');
				console.log('this is dragleave .upload-area');
			});

		}
	</script>
</body>

</html>
