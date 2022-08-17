<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="command.CartCommand" %>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<c:url value='/resources/css/fontawesome.min.css'/>">
</head>

<%
	@SuppressWarnings("unchecked")
	List<CartCommand> cartList = (ArrayList<CartCommand>)request.getAttribute("cartList");
	String memberId = (String)session.getAttribute("memberId");
%>
<body>
	
	<jsp:include page="../include/nav.jsp" />
	
	<div class="container" style="padding-top: 50px">
		<div class="row">
		
			<jsp:include page="../include/mypage_nav.jsp" />
	
			<div class="col-lg-10">
				<div class="row">
					<table width="100%">
						<tr>
							<td align="left"><a href="<c:url value='/main/cartDeleteAll?memberId='/><%=memberId%>" class="btn btn-danger" onclick="return confirm('카트 전체를 삭제하시겠습니까?');">삭제하기</a></td>
							<td align="right"><a href="<c:url value='/main/order?memberId='/><%=memberId%>" class="btn btn-primary">주문하기</a></td>
						</tr>
					</table>
				</div>
				
				<div style="padding-top: 50px">
					<table class="table table-hover">
						<tr>
							<th>상품</th>
							<th>가격</th>
							<th>수량</th>
							<th>소계</th>
							<th>비고</th>
						</tr>
						
						<%	
							if (cartList == null)
							cartList = new ArrayList<CartCommand>();	
							int sum = 0;	
						
							for(int i = 0 ; i < cartList.size() ; i++){
								CartCommand cart = cartList.get(i);
								int productTotal = cart.getProductPrice() * cart.getProductCount();
								sum = sum + productTotal;
						%>
					   	
						<tr>
							<td><img src="<c:url value='/resources/img/'/><%=cart.getFileName()%>" style="width: 100px; height: 100px">&nbsp; <%=cart.getProductName() %></td>
							<td style="line-height: 100px"><%=cart.getProductPrice() %></td>
							<td><input type="number" id="unit<%=i %>" value="<%=cart.getProductCount() %>" min="1" style="width: 50px; margin-top: 50px; transform: translateY(-50%); border: solid lightgray 2px"></td>
							<td style="line-height: 100px"><%=productTotal %></td>
							<td style="line-height: 100px">
								<a href="<c:url value='/main/cartDelete?memberId='/><%=memberId %>&cartId=<%=cart.getCartId() %>" class="btn btn-danger" onclick="return confirm('해당 상품을 삭제하시겠습니까?');">삭제</a>
								<a href="#" class="btn btn-success" onclick="modify<%=i%>()">수정</a>
							</td>
							<script type="text/javascript">
								function modify<%=i%>() {
									let u = document.getElementById('unit<%=i%>').value;
									if (confirm('해당 상품의 수량을 수정하시겠습니까?')) {
										location.href='cartModify?cartId=<%=cart.getCartId()%>&productCount='+u;
									}
								}
							</script>
						</tr>
						
						<%
							}
						%>
						<tr>
							<th></th>
							<th></th>
							<th>총액</th>
							<th><%=sum %></th>
							<th></th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>		
	<!-- Start Script -->
	<script src="<c:url value='/resources/js/jquery-1.11.0.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-migrate-1.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/templatemo.js'/>"></script>
	<!-- End Script -->
</body>
</html>