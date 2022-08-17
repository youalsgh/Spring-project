<%@page import="command.MemberCommand"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<jsp:include page="../include/nav.jsp" />
	<div class="container py-5">
		<div class="row">
		
			<jsp:include page="../include/mypage_nav.jsp" />
			
			<!-- Sign Up Start -->
			<div class="col-lg-10">
				<div class="row">
					<form id="join_form" method="post">
						<div class="container-fluid">
							<div class="row h-100 justify-content-center"
								style="min-height: 100vh;">
								<div class="col-12 col-sm-8 col-md-6 col-lg-10 col-xl-8">
									<div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
										<div
											class="d-flex align-items-center justify-content-center mb-3">
											<h3>Update Info.</h3>
										</div>
										<!-- 회원정보 수정 아이디 고정 - 김영재 -->
										<div class="form-floating mb-3">
											<input type="text" class="form-control id_check"
												id="floatingText" name="id" placeholder="UserID"
												value="${memberCommand.id}" readonly> <label
												for="floatingText">UserID</label>
										</div>
										<div class="form-floating mb-4">
											<input type="password" class="form-control pw_check"
												id="floatingPassword" name="password" placeholder="Password">
											<label for="floatingPassword">Password</label>
										</div>
										<span class="final_pw_ck">비밀번호를 입력해주세요.</span>

										<div class="form-floating mb-4">
											<input type="password" class="form-control pw_checkCheck"
												id="floatingPasswordCheck" name="passwordCheck"
												placeholder="Password"> <label
												for="floatingPasswordCheck">Password Check</label>
										</div>
										<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> <span
											class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
											class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
										<!-- 회원정보 수정 회원이름 선택적 수정 - 김영재 -->
										<div class="form-floating mb-3">
											<input type="text" class="form-control name_check"
												id="floatingName" name="name" placeholder="User name"
												value="${memberCommand.name }"> <label
												for="floatingName">User name</label>
										</div>
										<span class="final_name_ck">이름을 입력해주세요.</span>

										<div class="form-floating mb-3">
											<input type="email" class="form-control email_check"
												id="floatingEmail" name="email" placeholder="Email"
												value="${memberCommand.email }"> <label
												for="floatingEmail">Email</label>
										</div>
										<span class="final_mail_ck">이메일을 입력해주세요.</span>

										<button class="btn btn-success py-3 w-100 mb-4 signup_button">수정하기</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- Sign Up End -->
		</div>
	</div>

	<!-- ajax에서 비동기방식으로 form내에 id 값만 전송하므로 dataType을 바꿔줘야 한다. -->
	<script>
		var idCheck = false; // 아이디
		var idckCheck = false; // 아이디 중복검사
		var pwCheck = false; // 비밀번호
		var pwckCheck = false; // 비밀번호 확인
		var pwckcorCheck = false; // 비밀번호 확인 일치 확인
		var nameCheck = false; // 이름
		var mailCheck = false;

		$(document).ready(function() {
			$(".signup_button").click(function() {
				var id = $('.id_check').val(); // id 입력란
				var pw = $('.pw_check').val(); // 비밀번호 입력란
				var pwck = $('.pw_checkCheck').val(); // 비밀번호 확인 입력란
				var name = $('.name_check').val(); // 이름 입력란
				var email = $('.email_check').val(); // 이메일 입력란

				/* 아이디 유효성 검사 */
				if (id == "" || id == " " || id == null) {
					$('.final_id_ck').css('display', 'block');
					$('.id_check_success').css('display', 'none');
					idCheck = false;
				} else {
					$('.final_id_ck').css('display', 'none');
					idCheck = true;
				}

				/* 비밀번호 유효성 검사 */
				if (pw == "") {
					$('.final_pw_ck').css('display', 'block');
					pwCheck = false;
				} else {
					$('final_pw_ck').css('display', 'none');
					pwCheck = true;
				}

				/* 비밀번호 확인 유효성 검사 */
				if (pwck == "") {
					$('.final_pwck_ck').css('display', 'block');
					pwckCheck = false;
				} else {
					$('.final_pwck_ck').css('display', 'none');
					pwckCheck = true;
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
				if (pwCheck && pwckcorCheck && nameCheck && mailCheck) {
					if (confirm("수정 하시겠습니까?")) {
						$("#join_form").attr("action", "update");
						$("#join_form").submit();
					} else {
						return false;
					}
				} else
					alert("다시 입력해주세요!");
				return false;
			});

		});

		/* 비밀번호 확인 일치 유효성 검사 */
		$('.pw_checkCheck').on("propertychange change keyup paste input",
				function() {

					var pw = $('.pw_check').val();
					var pwck = $('.pw_checkCheck').val();
					$('.final_pwck_ck').css('display', 'none');

					if (pw != pwck) {
						$('.pwck_input_re_1').css('display', 'none');
						$('.pwck_input_re_2').css('display', 'block');
						pwckcorCheck = false;
					} else {
						$('.pwck_input_re_2').css('display', 'none');
						$('.pwck_input_re_1').css('display', 'block');
						pwckcorCheck = true;
					}
				});
		/* 아이디 중복 체크 */
		$('.id_check').on(
				"propertychange change keyup paste input",
				function() {
					var memberId = $('.id_check').val(); // .id_check에 입력되는 값
					var data = {
						memberId : memberId
					} // 컨트롤에 넘길 데이터 이름 : 데이터(.id_check에 입력되는 값)

					$.ajax({
						type : "post",
						url : "memberIdChk",
						data : data,
						dataType : "text",
						success : function(result) {
							if (result != 'fail') {
								$('.id_check_success').css("display",
										"inline-block");
								$('.id_check_fail').css("display", "none");
								$('.final_id_ck').css("display", "none");
								idckCheck = true;
							} else {
								$('.id_check_fail').css("display",
										"inline-block");
								$('.id_check_success').css("display", "none");
								idckCheck = false;
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