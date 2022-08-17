<%@page import="java.util.ArrayList"%>
<%@page import="command.ProductCommand"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
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

<%	
	@SuppressWarnings("unchecked")
	List<ProductCommand> productCommand = (ArrayList<ProductCommand>) request.getAttribute("productCommand");
%>
</head>

<body>

	<jsp:include page="../include/admin_nav.jsp" />

	<!-- Start Content -->
	<div class="container py-5">
		<div class="row">

			<div class="col-lg-3">
				<h1 class="h2 pb-4">Categories</h1>
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> Gender <i
							class="fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul class="collapse show list-unstyled pl-3">
							<li><a class="text-decoration-none" href="#">Men</a></li>
							<li><a class="text-decoration-none" href="#">Women</a></li>
						</ul></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> Sale <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul id="collapseTwo" class="collapse list-unstyled pl-3">
							<li><a class="text-decoration-none" href="#">Sport</a></li>
							<li><a class="text-decoration-none" href="#">Luxury</a></li>
						</ul></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> Product <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul id="collapseThree" class="collapse list-unstyled pl-3">
							<li><a class="text-decoration-none" href="#">Bag</a></li>
							<li><a class="text-decoration-none" href="#">Sweather</a></li>
							<li><a class="text-decoration-none" href="#">Sunglass</a></li>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">All</a>
							</li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">Men's</a>
							</li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none" href="#">Women's</a></li>
						</ul>
					</div>
					<div class="col-md-6 pb-4">
						<div class="d-flex">
							<select class="form-control">
								<option>Featured</option>
								<option>A to Z</option>
								<option>Item</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<%
					for (int i = 0; i < productCommand.size(); i++) {
						ProductCommand product = productCommand.get(i);
					%>
					<div class="col-md-4">
						<div class="card mb-4 product-wap rounded-0">
							<div class="card rounded-0">
								<img class="card-img rounded-0 img-fluid"
									src="<c:url value='/resources/img/'/><%=product.getFileName()%>">
								<div
									class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
									<ul class="list-unstyled">
										<li><a class="btn btn-danger text-white"
											href="<c:url value='/admin/admin_productDetail'/>">수정하기</a></li>
									</ul>
								</div>
							</div>
							<div class="card-body">
								<a href="<c:url value='/shop-single'/>"
									class="h3 text-decoration-none"><%=product.getBrand()%></a>
								<ul
									class="w-100 list-unstyled d-flex justify-content-between mb-0">
									<li><%=product.getName()%></li>
									<li class="pt-2"><span
										class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
										<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
										<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
										<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
										<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
									</li>
								</ul>
								<ul class="list-unstyled d-flex justify-content-center mb-1">
									<li><i class="text-warning fa fa-star"></i> <i
										class="text-warning fa fa-star"></i> <i
										class="text-warning fa fa-star"></i> <i
										class="text-muted fa fa-star"></i> <i
										class="text-muted fa fa-star"></i></li>
								</ul>
								<p class="text-center mb-0"><%=product.getPrice()%></p>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>

				<div class="pageInfo_wrap">
					<div class="pageInfo_area">
						<div class="row">
							<ul id="pageInfo"
								class="pagination pagination-lg justify-content-end pageInfo">

								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="page-item"><a
										class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark ${pageMaker.cri.pageNum == num ? "
										active" : ""}" href='<c:url value="/admin/admin_product?pageNum=${num}"/>'>${num}</a>
									</li>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- End Content -->

	<!-- Start Script -->
	<script src="<c:url value='/resources/js/jquery-1.11.0.min.js'/>"></script>
	<script
		src="<c:url value='/resources/js/jquery-migrate-1.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/templatemo.js'/>"></script>
	<!-- End Script -->
</body>

</html>