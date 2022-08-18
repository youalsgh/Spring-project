<%@page import="java.util.ArrayList"%>
<%@page import="command.ProductCommand"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>CLOTHING STORE</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<c:url value='/resources/img/apple-icon.png'/>">
	<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>">

    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/templatemo.css'/>">

    <!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet" href="<c:url value='https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/fontawesome.min.css'/>">
	
	<%
		@SuppressWarnings("unchecked")
		List<ProductCommand> productList = (ArrayList<ProductCommand>)request.getAttribute("productList");
		int count1 = (int)request.getAttribute("count1");
		int count2 = (int)request.getAttribute("count2");
		int count3 = (int)request.getAttribute("count3");
		productList.get(0).setReplyCount(count1);
		productList.get(1).setReplyCount(count2);
		productList.get(2).setReplyCount(count3);
	%>
	
	<c:if test='${result == 1}'>
		<script type="text/javascript">
			alert("주문이 정상적으로 등록되었습니다.");
		</script>
	</c:if>
</head>

<body>

	<jsp:include page="include/nav.jsp" />
	
    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
	            <div class="row">
	                <div class=" order-lg-last" >
	                    <img src="<c:url value='/resources/img/banner1.jpg'/>" style="width: 100%; height: 700px">
	                </div>
	            </div>
            </div>
           <div class="carousel-item">
	            <div class="row">
	                <div class=" order-lg-last" >
	                    <img src="<c:url value='/resources/img/banner2.jpg'/>" style="width: 100%; height: 700px">
	                </div>
	            </div>
            </div>
            <div class="carousel-item">
	            <div class="row">
	                <div class=" order-lg-last">
	                    <img src="<c:url value='/resources/img/banner3.jpg'/>" style="width: 100%; height: 700px">
	                </div>
	            </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->

    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 style="font-weight: bold;">Categories of Products</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="<c:url value='/resources/img/man_tshirt1.jpg'/>" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">Top</h5>
                <p class="text-center"><a class="btn btn-success" href='<c:url value="/main/main_shop?pageNum=1"/>'>Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="<c:url value='/resources/img/man_pants1.jpg'/>" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Bottom</h2>
                <p class="text-center"><a class="btn btn-success" href='<c:url value="/main/main_shop?pageNum=1"/>'>Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="<c:url value='/resources/img/shoes1.jpg'/>" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Accessories</h2>
                <p class="text-center"><a class="btn btn-success" href='<c:url value="/main/main_shop?pageNum=1"/>'>Go Shop</a></p>
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->

    <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">Featured Product</h1>
                    <p>
                        고객들로부터 높은 평점을 받은 상품입니다.
                    </p>
                </div>
            </div>
            <div class="row">
             	<%
             		for(int i = 0 ; i < productList.size() ; i++){
             			ProductCommand product = productList.get(i);
             	%>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="<c:url value='/main/main_shopDetail?productId='/><%=product.getId() %>&productBrand=<%=product.getBrand()%>">
                            <img src="<c:url value='/resources/img/'/><%=product.getFileName()%>" class="card-img-top">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
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
                                <li class="text-muted text-right">
                                	<% String price = String.format("%,d", product.getPrice()); %>
									<%=price%>원
                                </li>
                            </ul>
                            <a href="<c:url value='/main/main_shopDetail?productId='/><%=product.getId() %>&productBrand=<%=product.getBrand()%>" class="h2 text-decoration-none text-dark"><%=product.getName()%></a>
                            <p class="card-text">
                            	<%=product.getDescription()%>
                            </p>
                            <p class="text-muted">Reviews <%=product.getReplyCount()%></p>
                        </div>
                    </div>
                </div>
                <%
             		}
                %>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->

	<jsp:include page="include/footer.jsp" />

    <!-- Start Script -->
	<script src="<c:url value='/resources/js/jquery-1.11.0.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-migrate-1.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/templatemo.js'/>"></script>
	<!-- End Script -->
</body>

</html>