<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="command.ProductCommand"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>CLOTHING STORE</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
	
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<link rel="stylesheet"
		href="<c:url value='/resources/css/bootstrap.min.css'/>">
	<link rel="stylesheet"
		href="<c:url value='/resources/css/templatemo.css'/>">
	
	<!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet"
		href="<c:url value='https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap'/>">
	<link rel="stylesheet"
		href="<c:url value='/resources/css/fontawesome.min.css'/>">
	<%
		String memberId = (String)session.getAttribute("memberId");
		
		@SuppressWarnings("unchecked")
		List<ProductCommand> productList = (ArrayList<ProductCommand>) request.getAttribute("productList");
	%>
</head>

<body>

	<jsp:include page="../include/nav.jsp" />

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
							<li><a class="text-decoration-none" href="<c:url value='/main/main_shop?pageNum=1'/>&filter=man">Men</a></li>
							<li><a class="text-decoration-none" href="<c:url value='/main/main_shop?pageNum=1'/>&filter=woman">Women</a></li>
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
								class="h3 text-dark text-decoration-none mr-3" href="<c:url value='/main/main_shop?pageNum=1'/>&filter=all">All</a>
							</li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="<c:url value='/main/main_shop?pageNum=1'/>&filter=man">Men's</a>
							</li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none" href="<c:url value='/main/main_shop?pageNum=1'/>&filter=woman">Women's</a></li>
						</ul>
					</div>
					<div class="col-md-6 pb-4">
						<div class="d-flex">
							<select class="form-control" id="filter" name="filter">
								<option value="new" ${filter == 'new' ? 'selected ="selected"' : ''}>최신 상품 순</option>
								<option value="highPrice" ${filter == 'highPrice' ? 'selected ="selected"' : ''}>높은 가격 순</option>
								<option value="rowPrice" ${filter == 'rowPrice' ? 'selected ="selected"' : ''}>낮은 가격 순</option>
								<option value="highRating" ${filter == 'highRating' ? 'selected ="selected"' : ''}>높은 평점 순</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<%
					for (int i = 0; i < productList.size(); i++) {
						ProductCommand product = productList.get(i);
					%>
					<div class="col-md-4">
						<div class="card mb-4 product-wap rounded-0">
							<div class="card rounded-0">
								<img class="card-img rounded-0 img-fluid"
									src="<c:url value='/resources/img/'/><%=product.getFileName()%>" style="width: 304px; height: 400px">
								<div
									class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
									<ul class="list-unstyled">
										<li><a class="btn btn-success text-white"
											href="<c:url value='/main/main_shopDetail'/>"><i
												class="far fa-heart"></i></a></li>
										<li><a class="btn btn-success text-white mt-2"
											href="<c:url value='/main/main_shopDetail'/>"><i
												class="far fa-eye"></i></a></li>
										<li><a class="btn btn-success text-white mt-2 btn_cart"
											href="<c:url value='/main/main_shopDetail'/>"><i
												class="fas fa-cart-plus"></i></a></li>
												<%--  --%>
									</ul>
								</div>
							</div>
							<div class="card-body">
								<p class="text-center"><a href="<c:url value='/main/main_shopDetail?productId='/><%=product.getId() %>&productBrand=<%=product.getBrand()%>"
									class="h3 text-decoration-none"><%=product.getBrand()%></a></p>
								<p class="text-center" style="font-size: 12px"><%=product.getName()%></p>
									
								<ul class="list-unstyled d-flex justify-content-center mb-1">
									<li>
										<%	
		                            		for(int j = 0 ; j < (int)product.getRatingAvg() ; j++){
		                            	%>
		                                	<i class="fa fa-star text-warning"></i>
		                                <%
		                            		}
		                            		for(int j = (int)product.getRatingAvg() ; j < 5 ; j++){
		                                %>
		                                	<i class="fa fa-star text-secondary"></i>
		                                <%
		                            		}
		                                %>
									</li>
								</ul>
								<p class="text-center mb-0">
									<% String price = String.format("%,d", product.getPrice()); %>
									<%=price%>원
								</p>
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
								class="pagination pagination-lg justify-content-center pageInfo">
								
								<!-- 이전 페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a
										class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
										href="<c:url value="/main/main_shop?pageNum=${pageMaker.startPage-1}"/>">Previous</a>
									</li>
								</c:if>

								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="page-item"><a
										class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark ${pageMaker.cri.pageNum == num ? "
										active" : ""}" href='<c:url value="/main/main_shop?pageNum=${num}"/>&filter=${filter}'>${num}</a>
									</li>
								</c:forEach>

								<!-- 다음 페이지 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="page-item"><a
										class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
										href="<c:url value="main_shop?pageNum=${pageMaker.endPage+1}"/>">Next</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- End Content -->
	
	<jsp:include page="../include/footer.jsp" />

	<script>
		$(document).ready(function(){			
			$('select[name=filter]').change(function(){
				if($(this).val() == "highPrice"){
					$('#filter')
					var filter = $(this).val()
					location.href = 'main_shop?pageNum=1&filter=' + filter;
				} else if($(this).val() == "rowPrice"){
					var filter = $(this).val()
					location.href = 'main_shop?pageNum=1&filter=' + filter;
				} else if($(this).val() == "highRating"){
					var filter = $(this).val()
					location.href = 'main_shop?pageNum=1&filter=' + filter;
				} else if($(this).val() == "new"){
					var filter = $(this).val()
					location.href = 'main_shop?pageNum=1&filter=' + filter;
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