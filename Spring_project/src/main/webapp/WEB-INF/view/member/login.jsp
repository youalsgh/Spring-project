<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>CLOTHING STORE</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
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

	<!-- Sign In Start -->
	<form method="post" id="login_form">
		<div class="container-fluid">
			<div class="row h-100 align-items-center justify-content-center"
				style="min-height: 100vh;">
				<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
					<div class="rounded p-4 p-sm-5 my-4 mx-3">
						<div class="d-flex align-items-center justify-content-center mb-3">
							<h3>Sign In</h3>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								name="id" class="id_input" placeholder="ID"
								value="${cookie.rememberId.value}"> <label
								for="floatingInput">ID</label>
						</div>
						<div class="form-floating mb-4">
							<input type="password" class="form-control" id="floatingPassword"
								name="password" class="pw_input" placeholder="Password">
							<label for="floatingPassword">Password</label>
						</div>

						<c:if test="${result == 0}">
							<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>

						<!-- 쿠키 id 저장 여부에 따른 체크박스 체크유무 - 김영재 -->
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<c:choose>
								<c:when test="${cookie.rememberId.value eq null}">
									<div class="form-check">
										<input type="checkbox" class="form-check-input"
											id="rememberId" name="rememberId"> <label
											class="form-check-label" for="rememberId">아이디 기억하기</label>
									</div>
								</c:when>
								<c:otherwise>
									<div class="form-check">
										<input type="checkbox" class="form-check-input"
											id="rememberId" name="rememberId" checked> <label
											class="form-check-label" for="rememberId">아이디 기억하기</label>
									</div>
								</c:otherwise>
							</c:choose>
							<!-- 쿠키 id 저장 여부확인 끝 -->

							<a href='<c:url value='find_pw'/>' style="text-decoration: none">Forgot
								Password</a>
						</div>
						
						<button class="btn btn-success py-3 w-100 mb-4 login_button">Sign
								In</button>
							<p class="text-center mb-0">
								Don't have an Account? <a href='<c:url value='/member/signup'/>'
									style="text-decoration: none">Sign Up</a>
							</p>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Sign In End -->

	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {

			/* 로그인 메서드 서버 요청*/
			$("#login_form").attr("action", "login.do");
			$("#login_form").submit();
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