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
<script>
	    $(function() {
		var responseMessage = '${message}';
		var result = '${drop_result}';
		var theForm = document.drop_Info;
		console.log(result);
		if (result != "" && result != null) {
			if (result === "true") {
				alert(responseMessage);
				$("#drop_Info").attr("action", "main.do");
				$("#drop_Info").submit();
			} else if(result === "false") {
				alert(responseMessage);
				return false;
			}
		} else	
		return false;
	})
</script>
</head>
<body>
	<jsp:include page="../include/nav.jsp" />
	<div class="container py-5">
		<div class="row">
		
			<jsp:include page="../include/mypage_nav.jsp" />
			
			<!-- Sign Up Start -->
			<div class="col-lg-10">
				<div class="row">
					<form id="drop_Info" class="drop_Info" method="post">
						<div class="container-fluid">
							<div class="row h-100 justify-content-center"
								style="min-height: 100vh;">
								<div class="col-12 col-sm-8 col-md-6 col-lg-10 col-xl-8">
									<div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
										<div
											class="d-flex align-items-center justify-content-center mb-3">
											<h3>회원 탈퇴</h3>
										</div>
										<!-- 회원 탈퇴 비밀번호 입력 외 고정 - 김영재 -->
										<div class="form-floating mb-3">
											<input type="text" class="form-control id_check"
												id="floatingText" name="id" placeholder="UserID"
												value="${memberCommand.id}" readonly> <label
												for="floatingText">UserID</label>
										</div>

										<div class="form-floating mb-3">
											<input type="text" class="form-control name_check"
												id="floatingName" name="name" placeholder="User name"
												value="${memberCommand.name }" readonly> <label
												for="floatingName">User name</label>
										</div>

										<div class="form-floating mb-3">
											<input type="email" class="form-control email_check"
												id="floatingEmail" name="email" placeholder="Email"
												value="${memberCommand.email }" readonly> <label
												for="floatingEmail">Email</label>
										</div>

										<div class="form-floating mb-4">
											<input type="password" class="form-control pw_check"
												id="floatingPassword" name="password" placeholder="Password">
											<label for="floatingPassword">Password</label>
										</div>
										<span class="final_pw_ck">비밀번호를 입력해주세요.</span>

										<button type="button" class="btn btn-danger py-3 w-100 mb-4 drop_button">탈퇴하기</button>
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
		var pwCheck = false; // 비밀번호

		$(document).ready(function() {
			$(".drop_button").click(function() {
				var pw = $('.pw_check').val(); // 비밀번호 입력란

				/* 비밀번호 유효성 검사 */
				if (pw == "") {
					$('.final_pw_ck').css('display', 'block');
					pwCheck = false;
				} else {
					$('final_pw_ck').css('display', 'none');
					pwCheck = true;
				}

				/* 최종 유효성 검사 */
				if (pwCheck) {
					if (confirm("탈퇴 하시겠습니까?")) {
						$("#drop_Info").attr("action", "drop");
						$("#drop_Info").submit();
					} else {
						return false;
					}
				} else
					alert("다시 입력해주세요!");
				return false;
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