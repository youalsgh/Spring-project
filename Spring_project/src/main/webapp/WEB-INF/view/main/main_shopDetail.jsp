<%@page import="org.apache.catalina.ha.session.ReplicatedSessionListener"%>
<%@page import="java.util.List"%>
<%@page import="command.ReplyCommand"%>
<%@page import="java.util.ArrayList"%>
<%@page import="command.ProductCommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>CLOTHING STORE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>

    <link rel="apple-touch-icon" href="<c:url value='/resources/img/apple-icon.png'/>">
	<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/img/favicon.ico'/>">

    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/templatemo.css'/>">

    <!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet" href="<c:url value='https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/fontawesome.min.css'/>">

    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/slick.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/slick-theme.css'/>">
    
    <%
    	String memberId = (String)session.getAttribute("memberId");
    	ProductCommand product = (ProductCommand) request.getAttribute("product");
    	
    	@SuppressWarnings("unchecked")
    	List<ReplyCommand> replyListAll = (ArrayList<ReplyCommand>) request.getAttribute("replyListAll");
    	
    	@SuppressWarnings("unchecked")
    	List<ProductCommand> relatedProduct = (ArrayList<ProductCommand>) request.getAttribute("relatedProduct");
    %>
    <c:if test='${result == "1"}'>
		<script type="text/javascript">
			alert("장바구니에 등록되었습니다.");
		</script>
	</c:if>
	
	<c:if test='${result == "0"}'>
		<script type="text/javascript">
			alert("장바구니에 등록된 상품입니다.");
		</script>
	</c:if>
	
	<c:if test='${checkReply == "1"}'>
		<script type="text/javascript">
			alert("댓글이 등록되었습니다.")
		</script>
	</c:if>
	
	<c:if test='${checkReply == "0"}'>
		<script type="text/javascript">
			alert("이미 등록한 댓글이 있습니다.")
		</script>
	</c:if>
	
</head>

<body>
		
	<jsp:include page="../include/nav.jsp" />

    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                        <img class="card-img img-fluid" src="<c:url value='/resources/img/'/><%=product.getFileName()%>" alt="Card image cap" id="product-detail" style="width: 700px; height: 750px">
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5">
                    <div class="card" style="height: 750px">
                        <div class="card-body">
                            <h1 class="h2"><%=product.getName()%></h1>
                            <p class="h3 py-2">
                            	<% String price = String.format("%,d", product.getPrice()); %>
                            	<%=price%>원
                            </p>
                            <p class="py-2">
                            	<%
                            		
                            		for(int i = 0 ; i < (int)product.getRatingAvg() ; i++){
                            	%>
                                	<i class="fa fa-star text-warning"></i>
                                <%
                            		}
                            		for(int i = (int)product.getRatingAvg() ; i < 5 ; i++){
                                %>
                                	<i class="fa fa-star text-secondary"></i>
                                <%
                            		}
                                %>
                                <span class="list-inline-item text-dark">Rating <%=product.getRatingAvg() %> | <%=replyListAll.size()%> Comments</span>
                            </p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Brand:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong><%=product.getBrand() %></strong></p>
                                </li>
                            </ul>

                            <h6>Description:</h6>
                            <p><%=product.getDescription()%></p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Avaliable Color :</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>White / Black</strong></p>
                                </li>
                            </ul>

                            <h6>Specification:</h6>
                            <ul class="list-unstyled pb-3">
                                <li>Lorem ipsum dolor sit</li>
                                <li>Amet, consectetur</li>
                                <li>Adipiscing elit,set</li>
                                <li>Duis aute irure</li>
                                <li>Ut enim ad minim</li>
                                <li>Dolore magna aliqua</li>
                                <li>Excepteur sint</li>
                            </ul>

                            <form id="detail_form" method="post">
                                <input type="hidden" name="memberId" value="<%=memberId%>">
                                <input type="hidden" name="productId" value="<%=product.getId()%>">
                                <div class="row">
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item">Size :
                                                <!-- <input type="hidden" name="product-size" id="product-size" value="S">-->
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">S</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">M</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">L</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success btn-size">XL</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                                Quantity
                                                	<input type="hidden" name="productCount" id="product-quanity" value="1">
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                            <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col d-grid">
                                        <button type="button" class="btn btn-success btn-lg" value="buy">Buy</button>
                                    </div>
                                    <div class="col d-grid">
                                        <button type="button" class="btn btn-success btn-lg btn_cart" value="addtocard">Add To Cart</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Content -->
    
	<div class="container">
    	<h4 class="pt-5"><%=replyListAll.size() %> Comments</h4>
    </div>
	<%
		for(int i = 0 ; i < replyListAll.size() ; i++){
			ReplyCommand reply = replyListAll.get(i);		
	%>
	<div class="container">
		<div class="d-flex align-items-center pt-5 row">
	        
	        <div class="col-lg-1">
	        	<img src="<c:url value='/resources/img/defaultImg.png'/>" style="border-radius: 50%; width: 100px; height: 100px">
	        </div>
	        <div class="col-lg-9 mx-5">
	            <div class="sc-text">
	                <h5 class="badge bg-secondary"><%=reply.getMemberName()%></h5>
	                <span class="px-2"><%=reply.getRegDate() %></span>
	                <p><%=reply.getContent() %></p>
	            </div>
	        </div>
	        <%
	        	if(reply.getMemberId().equals(memberId)){
	        %>
	        <a href='<c:url value="/main/replyDelete?memberId="/><%=memberId %>&productId=<%=reply.getProductId() %>' class="col-lg-1 btn btn-danger" onclick="return confirm('해당 댓글을 삭제하시겠습니까?');">삭제</a>
	        <%
	        	}
	        %>
	    </div>
	</div>
	<%
		}
	%>

    <div class="container leave-comment pt-5">
        <h4>Leave A Comment</h4>
        <form action="replyAdd" method="post" class="comment-form">
            <div class="row">
                <input type="hidden" class="form-control" name="productId" value="<%=product.getId()%>">
                <input type="hidden" class="form-control" name="memberId" value="<%=memberId%>">
                <div class="row">
	                <span class="col-lg-2">평점을 선택해주세요</span>
	                <div class="col-lg-1">
		                <select class="form-control" name="rating">
							<option value="0.0">0.0</option>
							<option value="0.5">0.5</option>
							<option value="1.0">1.0</option>
							<option value="1.5">1.5</option>
							<option value="2.0">2.0</option>
							<option value="2.5">2.5</option>
							<option value="3.0">3.0</option>
							<option value="3.5">3.5</option>
							<option value="4.0">4.0</option>
							<option value="4.5">4.5</option>
							<option value="5.0">5.0</option>
						</select>
					</div>
				</div>
				<div class="row" style="padding-top: 20px">	
	                <div class="col-lg-10 text-center">
	                    <textarea class="form-control" name="content" placeholder="댓글을 입력해주세요"></textarea>
	                </div>
	                <input type="submit" class="btn btn-success col-lg-2" value="입력하기" />
				</div>            
            </div>
        </form>
    </div>
	
    <!-- Start Article -->
    <section class="py-5">
        <div class="container">
            <div class="row text-left p-2 pb-3">
                <h4>Related Products</h4>
            </div>

            <!--Start Carousel Wrapper-->
            <div id="carousel-related-product">
            	<%
					for(int i = 0 ; i < relatedProduct.size() ; i++){
						ProductCommand product1 = relatedProduct.get(i);
				%>
                <div class="p-2 pb-3">
                    <div class="product-wap card rounded-0">
                        <div class="card rounded-0">
                            <img class="card-img rounded-0 img-fluid" src="<c:url value='/resources/img/'/><%=product1.getFileName()%>" style="width: 304px; height: 400px">
                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                    <li><a class="btn btn-success text-white" href="<c:url value='/shop-single'/>"><i class="far fa-heart"></i></a></li>
                                    <li><a class="btn btn-success text-white mt-2" href="<c:url value='/shop-single'/>"><i class="far fa-eye"></i></a></li>
                                    <li><a class="btn btn-success text-white mt-2" href="<c:url value='/shop-single'/>"><i class="fas fa-cart-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="text-center"><a href="<c:url value='/main/main_shopDetail?productId='/><%=product1.getId() %>&productBrand=<%=product.getBrand()%>"
									class="h3 text-decoration-none"><%=product1.getBrand()%></a></p>
							<p class="text-center" style="font-size: 12px"><%=product1.getName()%></p>
                            <ul class="list-unstyled d-flex justify-content-center mb-1">
                                <li>
                                    <%	
	                            		for(int j = 0 ; j < (int)product1.getRatingAvg() ; j++){
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
                            	<% String price1 = String.format("%,d", product1.getPrice()); %>
								<%=price1%>원
                            </p>
                        </div>
                    </div>
                </div>
                <%
					}
   	 			%>
            </div>
        </div>
    </section>
    <!-- End Article -->
		
	<jsp:include page="../include/footer.jsp" />

	<script>
		$(document).ready(function(){
			$(".btn_cart").click(function(){
				if(confirm("장바구니에 추가하시겠습니까?")){
					$("#detail_form").attr("action", "add");
					$("#detail_form").submit();
				}
			});
		});
	</script>
    <!-- Start Script -->
	<script src="<c:url value='/resources/js/jquery-1.11.0.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-migrate-1.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/templatemo.js'/>"></script>
	<!-- End Script -->
	
    <!-- Start Slider Script -->
    <script src="<c:url value='/resources/js/slick.min.js'/>"></script>
    <script>
        $('#carousel-related-product').slick({
            infinite: true,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 3,
            dots: true,
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
    </script>
    <!-- End Slider Script -->

</body>

</html>