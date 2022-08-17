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
	<script>
		    $(function() {
			var pw = '${memberCommand_f.password}';
			var responseMessage = '${message}';
			if (pw != "") {
				if (confirm(responseMessage + "\n로그인페이지로 이동하시겠습니까?")) {
					var theForm = document.re_login;
					$("#re_login").attr("action", "login.do");
					$("#re_login").submit();
				} else {
					$("#re_login").attr("action", "../index");
					$("#re_login").submit();
				}
			} else
				alert(responseMessage);
		})
	</script>
</head>
<body>
	<jsp:include page="../include/nav.jsp" />

	<form id="re_login" name="re_login" method="get">
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
								id="floatingText" name="id" placeholder="UserID"
								value="${memberCommand.id}"> <label for="floatingText">UserID</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control name_check"
								id="floatingName" name="name" placeholder="User name"
								value="${memberCommand.name}"> <label
								for="floatingName">User name</label>
						</div>

						<div class="form-floating mb-3">
							<input type="email" class="form-control email_check"
								id="floatingEmail" name="email" placeholder="Email"
								value="${memberCommand.email}"> <label
								for="floatingEmail">Email</label>
						</div>
						<div>
							<p>
						</div>
						<!-- 
						<div class="form-floating mb3">
							<h5>
								<c:out value="${message }" />
							</h5>
						</div>
						 -->
						<div>
							<p>
						</div>
						<button class="btn btn-success py-3 w-100 mb-4 found_button"
							onclick="getPost('02')">비밀번호 찾기</button>
							<!-- 
						<button class="btn btn-success py-3 w-100 mb-4 login_page"
							onclick="getPost('01')">홈으로</button>
							 -->
					</div>
				</div>
			</div>
		</div>
	</form>

	<script>
		function getPost(mode) {
			var theForm = document.re_login;
			if (mode == "01") {
				theForm.method = "get";
				$("#re_login").attr("action", "/index");
			} else if (mode == "02") {
				theForm.method = "post";
				if (idCheck && idckCheck && nameCheck && mailCheck) {
					$("#re_login").attr("action", "find_pw");
					$("#re_login").submit();
				} else
					alert("다시 입력해주세요!");
			}
		}
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