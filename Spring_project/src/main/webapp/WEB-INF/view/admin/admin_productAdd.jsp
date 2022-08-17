<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<link rel="stylesheet"
		href="<c:url value='/resources/css/bootstrap.min.css'/>">
	<link rel="stylesheet"
		href="<c:url value='/resources/css/templatemo.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/admin.css'/>">
	
	<!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet"
		href="<c:url value='https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap'/>">
	<link rel="stylesheet"
		href="<c:url value='/resources/css/fontawesome.min.css'/>">
	
	<title>Admin Page</title>
</head>
<body>
	<jsp:include page="../include/admin_nav.jsp" />

	<form id="productAdd_form" method="post" enctype="multipart/form-data">
		<div class="container-fluid">
			<div class="row h-100 justify-content-center"
				style="min-height: 100vh;">
				<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
					<div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
						<div class="d-flex align-items-center justify-content-center mb-3">
							<h1>상품 등록</h1>
						</div>

						<div class="row">
							<div class="col-lg-3">
								<h4>브랜드</h4>
							</div>
							<div class="col-lg-9">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="ProductBrand"
										name="brand" placeholder="ProductBrand"> <label
										for="ProductBrand">Brand</label>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-3">
								<h4>상품명</h4>
							</div>
							<div class="col-lg-9">
								<div class="form-floating mb-4">
									<input type="text" class="form-control" id="ProductName"
										name="name" placeholder="ProductName"> <label
										for="ProductName">Product Name</label>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-3">
								<h4>가격</h4>
							</div>
							<div class="col-lg-9">
								<div class="form-floating mb-4">
									<input type="text" class="form-control" id="Price" name="price"
										placeholder="Price"> <label for="Price">Price</label>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-3">
								<h4>성별</h4>
							</div>
							
							<div class="col-lg-9">
								<div class="form-floating mb-4">
									<select class="form-control" name="gender">
										<option value="unisex">남여공용</option>
										<option value="man">남성의류</option>
										<option value="woman">여성의류</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-3">
								<h4>상세설명</h4>
							</div>
							<div class="col-lg-9">
								<div class="form-floating mb-4">
									<textarea rows="2" cols="50" name="description"></textarea>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-3">
								<h4>이미지</h4>
							</div>
							<div class="col-lg-9">
								<div class="form-floating mb-3">
									<input type="file" id="fileName" name="fileName">
								</div>
							</div>
						</div>

						<button class="btn btn-success py-3 w-100 mb-4 productAdd_button">Add</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<script>
		/* 상품등록 버튼 클릭 메서드 */
		$(".productAdd_button").click(function(){
			
			/* 상품등록 메서드 서버 요청*/
			$("#productAdd_form").attr("action", "admin_productAdd");
			$("#productAdd_form").submit();
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