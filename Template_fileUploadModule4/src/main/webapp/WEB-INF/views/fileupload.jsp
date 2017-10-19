<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 650px;
	height: 200px;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 200%;
	display: table-cell;
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
</style>

<body class="body-wrapper">
	<div class="page-loader" style="background: url(resources/img/preloader.gif) center no-repeat #fff;"></div>

	<div class="main-wrapper">
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
					<form action="fileupload_process" id="multiform" name="multiform" method="post" class="listing__form" enctype="multipart/form-data">
						<div class="dashboardPageTitle text-center">
							<h2>건강검진 정보 입력</h2>
						</div>
						<div class="dashboardBoxBg mb30">
							<div class="profileIntro paraMargin">
								<h3>hos_info TABLE 정보 삽입</h3>
								<div class="row">
									<div class="form-group col-xs-12">
										<div class="imageUploader text-center">
											<div class="file-upload">
												<div class="upload-area"></div>
											</div>
										</div>
									</div>

								</div>
								
							</div>
						</div>
						<div id="fileUpload" class="dragAndDropDiv">
							<input type="file" id="imageFile" name="imageFile" class="file" multiple="multiple">
						</div>
						<div class="form-footer text-center">
							<button type="submit" id="btnSubmit" class="btn-submit">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		</section>


	</div>


	<div id=status1 style="background: blue"></div>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script type="text/javascript">
		$(function() {
			var objDragAndDrop = $(".dragAndDropDiv");

			//submit버튼을 눌렀을 시에 발생하는 함수
			$("#btnSubmit").click(
					function(e) {
						e.preventDefault();
						var mulRequestDatas = $("#imageFile")[0].files;
						console.log("this is mulRequestDatas length:"
								+ mulRequestDatas.length);
						for (var i = 0; i < mulRequestDatas.length; i++) {
							var fd = new FormData();
							fd.append('file', mulRequestDatas[i]);
							sendFileToServerByAjax(fd);
						}
					});

			//file Input Tag 의 파일 값이 바뀌면 발생되는 callback 함수. 
			$("#imageFile").change(function() {
				/* input tag의 아이디값으로 files를 받으면, multiplartServletRequest 파일을 받을 수 있다	*/
				var mulRequestDatas = $("#imageFile")[0].files;
				console.log('this is datas:' + mulRequestDatas);
				/* 	handleFileUpload(mulRequestDatas, objDragAndDrop); */
				// inputtag에 넣어저 있는 multipart request datas 를 div 에 표시해준다. 
				// 1. change 시에 기존 statusbar를 지우고, div class에 선택된 파일들을 표시해준다.
				deleteStatusbar();
				displayFilesInDiv(mulRequestDatas, objDragAndDrop);

			});

			$(document).on("dragenter", ".dragAndDropDiv", function(e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('border', '2px solid #0B85A1');
			});

			$(document).on("dragover", ".dragAndDropDiv", function(e) {
				e.stopPropagation();
				e.preventDefault();
			});
			$(document).on("drop", ".dragAndDropDiv", function(e) {

				$(this).css('border', '2px dotted #0B85A1');
				e.preventDefault();
				var files = e.originalEvent.dataTransfer.files;
				console.log('this is datas:' + files);
				/* handleFileUpload(files, objDragAndDrop); */
				/* 1. drop된 파일을 input file에 넣기. */

				var mulRequestDatas = e.originalEvent.dataTransfer.files;
				/* 2. deleteStatusbar() */
				$("#imageFile")[0].files = mulRequestDatas;
				deleteStatusbar();
				displayFilesInDiv(mulRequestDatas, objDragAndDrop);

			});

			$(document).on('dragenter', function(e) {
				e.stopPropagation();
				e.preventDefault();
			});
			$(document).on('dragover', function(e) {
				e.stopPropagation();
				e.preventDefault();
				objDragAndDrop.css('border', '2px dotted #0B85A1');
			});
			$(document).on('drop', function(e) {
				e.stopPropagation();
				e.preventDefault();
			});

		});

		function handleFileUpload(mulRequestDatas, objDragAndDrop) {
			for (var i = 0; i < mulRequestDatas.length; i++) {
				var mulRequestData = new FormData();
				mulRequestData.append('file', mulRequestDatas[i]);

				var status = new createStatusbar(objDragAndDrop); //Using this we can set progress.
				status.setFileNameSize(mulRequestDatas[i].name,
						mulRequestDatas[i].size);
				sendFileToServer(mulRequestData, status);

			}
		}

		// 1. change 시에 div class에 선택된 파일들을 표시해준다.
		var rowCount = 0;
		function displayFilesInDiv(mulRequestDatas, objDragAndDrop) {
			for (var i = 0; i < mulRequestDatas.length; i++) {
				var fd = new FormData();
				fd.append('file', mulRequestDatas[i]);

				var status = new createStatusbar(objDragAndDrop); //Using this we can set progress.
				status.setFileNameSize(mulRequestDatas[i].name,
						mulRequestDatas[i].size);

			}

		}

		function deleteStatusbar() {
			$(".statusbar").remove();

		}

		function createStatusbar(obj) {
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

			obj.after(this.statusbar);

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

		/* formData 의 type 은 multiplartServletRequest */
		function sendFileToServerByAjax(formData) {
		 	var uploadURL = "/template_fileUploadModule4/fileUpload/postByAjax"; //Upload URL
			var extraData = {}; //Extra Data.
			var jqXHR = $.ajax({
				xhr : function() {
					var xhrobj = $.ajaxSettings.xhr();
					if (xhrobj.upload) {
						xhrobj.upload.addEventListener('progress', function(
								event) {
							var percent = 0;
							var position = event.loaded || event.position;
							var total = event.total;
							if (event.lengthComputable) {
								percent = Math.ceil(position / total * 100);
							}

						}, false);
					}
					return xhrobj;
				},
				url : uploadURL,
				type : "POST",
				contentType : false,
				processData : false,
				cache : false,
				data : formData,
				success : function(data) {
					console.log('this is ajax success() called');
					$("#status1").append(
							"File upload Done<br> and data:" + data);
					//location.href = "http://www.example.com/ThankYou.html"
				},

				error : function(data) {
					console.log('this is ajax error() called');
				}
			});
		}
	</script>
</body>

</html>