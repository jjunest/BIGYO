/**
 * 
 */
// 주제_대댓글이 몇개인지 표시하는 함수. 시작했을시, 클래스를 바탕으로 파악한다.
	$(document).ready(function() {
		//OPINION과 관련된 자바스크립트 시작
		function reply_number_Setting() {
			// 의견_댓글 개수 카운팅하기
			$(".opinion_reply_number").each(function() {
				var opinion_rcdno = $(this).attr('opinion_rcdno');
				var counting = $(".opinion_reply_" + opinion_rcdno).length
				$(this).text(counting);
			});

			// 의견_대댓글 개수 카운팅하기
			$(".opinion_re_reply_number").each(function() {
				var reply_rcdno = $(this).attr('reply_rcdno');
				var counting = $(".opinion_re_reply_" + reply_rcdno).length
				$(this).text(counting);
			});

		}

		// 페이지 로딩 시에 대댓글 Editor와 글 등록 버튼을 없애주는 토글 버튼.
		function pageLoading_toggle_Setting() {
			$(".opinion_reply_Editor").toggle();
			$(".opinionReplySection").toggle();
			$(".opinion_replysave_BT").toggle();
			$(".opinion_ReReplyEditor").toggle();
			$(".opinion_re_reply_saveBT").toggle();
		}

		// 대댓글 토글 , 답글 보기시 발생하는 함수
		function re_reply_visibilitytoggle(reply_rcdno) {
			// 대댓글 editor를 보여주게하고, 답글 등록 버튼을 보여준ㄷ
			$("#topic_ReReplyEditor_" + reply_rcdno).toggle();
			$("#re_reply_writeBT_" + reply_rcdno).toggle();
			// 대댓글들을 전부 보여준다.
			$('.re_reply_' + reply_rcdno).toggle();
			// 답글 등록
		}
		// 의견의 리플 삭제 버튼 시
		function opinionReply_deleteBT_click(opinionReply_rcdno) {
			var result = confirm('정말 해당 의견을 삭제하시겠습니까?');
			if (result) {
				// 값 셋팅
				var objParams = {
					opinionReply_rcdno : opinionReply_rcdno,
				};
				// ajax 호출
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/opinionReply_delete_process",
					data : objParams,
					success : function(data) {
						if (data == "success") {
							alert("성공적으로 삭제했습니다");
							location.reload();
						} else {
							alert("요청하신 서비스에 실패했습니다. 문제 상황 지속시 연락 부탁드립니다. 010 7272 9771");
						}

					},
					error : function(e) {
						alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771:' + e);
					}
				});

			}
		}
		// 의견 삭제 버튼 클릭 시
		function opinion_deleteBT_click(opinion_rcdno) {
			var result = confirm('정말 해당 의견을 삭제하시겠습니까?');
			if (result) {
				// 값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
				};
				// ajax 호출
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/opinion_delete_process",
					data : objParams,
					success : function(data) {
						if (data == "success") {
							alert("성공적으로 삭제했습니다");
							location.reload();
						} else {
							alert("요청하신 서비스에 실패했습니다. 문제 상황 지속시 연락 부탁드립니다. 010 7272 9771");
						}

					},
					error : function(e) {
						alert('오류가 발생했습니다. 문제 상황 지속 시 연락 부탁드립니다. 010-7272-9771:' + e);
					}
				});

			}

		}

		// 의견_의 좋아요 버튼 눌렀을 시 - onclick()
		function opinion_thumbup(opinion_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				// 값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					recom_type : "thumbup",
					bywhom : "${loginUserInfo.rcdno}"
				};

				// ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_recommend_process",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			}

		}

		// 의견의 대댓글 버튼 클릭시
		function opinion_re_reply_showBT_Click(sp_opinion_reply_rcdno, parentRcdno) {
			$("#opinion_ReReplyEditor_" + sp_opinion_reply_rcdno).toggle();
			$(".opinion_re_reply_" + sp_opinion_reply_rcdno).toggle();
			$("#opinion_re_reply_saveBT_" + sp_opinion_reply_rcdno).toggle();
		}

		// 쇼피니언, 일반의견의 댓글 보기 누르기. onclick()함수 -댓글쓰기/댓글에디터/댓글들 토글하기.
		function opinion_reply_showBT(opinionRcdno) {
			$("#opinion_replysave_BT_" + opinionRcdno).toggle();
			$("#opinion_ReplyEditor_" + opinionRcdno).toggle();
			$(".opinion_reply_" + opinionRcdno).toggle();

		}
		// 의견_대댓글 버튼 등록 클릭 시 발생하는 함수. 답글등록 onClick() 함수
		function opinion_re_reply_save(opinion_rcdno, parent_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				// 널 검사
				if ($("#opinion_ReReplyEditor_" + parent_rcdno).val().trim() == "") {
					alert("답글 내용이 없습니다. 내용을 입력하고 답글등록을 해주세요.");
					$("#opinion_ReReplyEditor_" + parent_rcdno).focus();
					return false;
				}
				// 에디터 내용 가져옴
				var content = $("#opinion_ReReplyEditor_" + parent_rcdno).val().trim();
				// 값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					parent_rcdno : parent_rcdno,
					depth : "1",
					content : content,
					writer : "${loginUserInfo.rcdno}"
				};
				// ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_reply_save",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			}

		}

		// 의견_댓글 달기
		function opinion_reply_save(opinion_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				// 널 검사
				if ($("#opinion_ReplyEditor_" + opinion_rcdno).val().trim() == "") {
					alert("댓글 내용을 입력하세요.");
					$("#opinion_ReplyEditor_" + opinion_rcdno).focus();
					return false;
				}
				// 에디터 내용 가져옴
				var content = $("#opinion_ReplyEditor_" + opinion_rcdno).val().trim();

				// 값 셋팅
				var objParams = {
					opinion_rcdno : opinion_rcdno,
					parent_rcdno : "0",
					depth : "0",
					content : content,
					writer : "${loginUserInfo.rcdno}"
				};
				// ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_reply_save",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			}

		}

		// 의견_댓글의 신고 버튼 눌렀을 시 - onclick()
		function opinion_reply_warning(opinion_reply_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.");
			} else {

				// 값 셋팅
				var objParams = {
					opinion_reply_rcdno : opinion_reply_rcdno,
					recom_type : "warning",
					bywhom : "${loginUserInfo.rcdno}"
				};

				// ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_reply_recommend_process",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});
			}

		}

		// 의견_댓글의 좋아요 버튼 눌렀을 시 - onclick()
		function opinion_reply_thumbup(opinion_reply_rcdno) {
			// 만약 로그인이 안되어있으면 로그인을 하라고 요청하자.
			if ('${loginUserInfo}' == "") {
				alert("로그인이 필요합니다.")
			} else {
				// 값 셋팅
				var objParams = {
					opinion_reply_rcdno : opinion_reply_rcdno,
					recom_type : "thumbup",
					bywhom : "${loginUserInfo.rcdno}"
				};

				// ajax 호출
				$.ajax({
					url : "${pageContext.request.contextPath}/opinion_reply_recommend_process",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					data : objParams,
					success : function(retVal) {

						if (retVal.code == "OK") {
							alert(retVal.message);
							location.reload();
						} else {
							alert(retVal.message);
						}

					},
					error : function(request, status, error) {
						console.log("AJAX_ERROR");
					}
				});

			}

		}
		//OPINION과 관련된 자바스크립트 끝
	});
