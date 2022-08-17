<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<title>CLOTHING STORE</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
		integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
		crossorigin="anonymous"></script>
	
	<link rel="apple-touch-icon"
		href="<c:url value='/resources/img/apple-icon.png'/>">
	<link rel="shortcut icon" type="image/x-icon"
		href="<c:url value='/resources/img/favicon.ico'/>">
	
	<link rel="stylesheet"
		href="<c:url value='/resources/css/bootstrap.min.css'/>">
	<link rel="stylesheet"
		href="<c:url value='/resources/css/templatemo.css'/>">
	
	<!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet"
		href="<c:url value='https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap'/>">
	<link rel="stylesheet"
		href="<c:url value='/resources/css/fontawesome.min.css'/>">
	
	<!-- 비밀번호 확인 팝업창 띄우기 - 김영재 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../include/nav.jsp" />

	<form id="found_pw" method="post">
		<div class="container-fluid">
			<div class="row h-100 justify-content-center"
				style="min-height: 100vh;">
				<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
					<div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
						<div class="d-flex align-items-center justify-content-center mb-3">
							<h3>비밀번호 찾기</h3>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control id_check"
								id="floatingText" name="id" placeholder="UserID"> <label
								for="floatingText">UserID</label>
						</div>
						<span class="id_check_success">아이디가 존재합니다.</span> <span
							class="id_check_fail">아이디를 찾을수 없습니다.</span> <span
							class="final_id_ck">아이디를 입력해주세요.</span>

						<div class="form-floating mb-3">
							<input type="text" class="form-control name_check"
								id="floatingName" name="name" placeholder="User name"> <label
								for="floatingName">User name</label>
						</div>
						<span class="final_name_ck">이름을 입력해주세요.</span>

						<div class="form-floating mb-3">
							<input type="email" class="form-control email_check"
								id="floatingEmail" name="email" placeholder="Email"> <label
								for="floatingEmail">Email</label>
						</div>
						<span class="final_mail_ck">이메일을 입력해주세요.</span>
						<button class="btn btn-success py-3 w-100 mb-4 found_button">비밀번호
							찾기</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script>
		var idCheck = false; // 아이디
		var idckCheck = false; // 아이디 유무 체크
		var nameCheck = false; // 이름
		var mailCheck = false; // 이메일

		$(document).ready(function() {
			$(".found_button").click(function() {
				var id = $('.id_check').val(); // id 입력란
				var name = $('.name_check').val(); // 이름 입력란
				var email = $('.email_check').val(); // 이메일 입력란

				/* 아이디 유효성 검사 */
				if (id == "" || id == " " || id == null) {
					$('.final_id_ck').css('display', 'block');
					$('.id_check_success').css('display', 'none');
					$('.id_check_fail').css('display', 'none');
					idCheck = false;
				} else {
					$('.final_id_ck').css('display', 'none');
					idCheck = true;
				}

				/* 이름 유효성 검사 */
				if (name == "") {
					$('.final_name_ck').css('display', 'block');
					nameCheck = false;
				} else {
					$('.final_name_ck').css('display', 'none');
					nameCheck = true;
				}

				/* 이메일 유효성 검사 */
				if (email == "") {
					$('.final_mail_ck').css('display', 'block');
					mailCheck = false;
				} else {
					$('.final_mail_ck').css('display', 'none');
					mailCheck = true;
				}

				/* 최종 유효성 검사 */
				if (idCheck && idckCheck && nameCheck && mailCheck) {
					$("#found_pw").attr("action", "find_pw");
					$("#found_pw").submit();
				} else
					alert("다시 입력해주세요!");
				return false;
			});

		});

		/* 아이디 중복 체크 */
		$('.id_check').on(
				"propertychange change keyup paste input",
				function() {
					var memberId = $('.id_check').val(); // .id_check에 입력되는 값
					var data = {
						memberId : memberId
					}
					// 컨트롤에 넘길 데이터 이름 : 데이터(.id_check에 입력되는 값)

					$.ajax({
						type : "post",
						url : "memberIdChk",
						data : data,
						dataType : "text",
						success : function(result) {
							if (result != 'fail') {
								$('.id_check_fail').css("display",
										"inline-block");
								$('.id_check_success').css("display", "none");
								$('.final_id_ck').css("display", "none");
								idckCheck = false;
							} else {
								$('.id_check_success').css("display",
										"inline-block");
								$('.id_check_fail').css("display", "none");
								$('.final_id_ck').css("display", "none");
								idckCheck = true;
							}
						}
					});
				});
	</script>
	<!-- Start Script -->

	<script src="<c:url value='/resources/js/jquery-1.11.0.min.js'/>"></script>
	<script
		src="<c:url value='/resources/js/jquery-migrate-1.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/templatemo.js'/>"></script>
	<!-- End Script -->

</body>
</html>