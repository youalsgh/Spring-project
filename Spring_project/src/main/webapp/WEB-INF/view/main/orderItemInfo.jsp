<%@page import="command.OrderItemCommand"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		href="<c:url value='/resources/css/templatemo.css?ver=1.0'/>">
	
	<!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet"
		href="<c:url value='https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap'/>">
	<link rel="stylesheet"
		href="<c:url value='/resources/css/fontawesome.min.css'/>">
</head>
	
<%
	@SuppressWarnings("unchecked")
	List<OrderItemCommand> orderItemCommand = (ArrayList<OrderItemCommand>)request.getAttribute("orderItemCommand");
	String memberId = (String)session.getAttribute("memberId");	
%>
<body>
	<jsp:include page="../include/nav.jsp" />
	
	<div class="container" style="padding-top: 50px">
		<div class="row">
		
			<jsp:include page="../include/mypage_nav.jsp" />
	
			<div class="col-lg-10">
				<div style="padding-top: 50px">
					<table class="table table-hover">
						<tr>
							<th>상품</th>
							<th>가격</th>
							<th>수량</th>
							<th>상품총액</th>
							<th>비고</th>
						</tr>
					   	<%
					   		for(int i = 0 ; i < orderItemCommand.size() ; i++){
					   			OrderItemCommand orderItem = orderItemCommand.get(i);
					   	%>
						<tr>
							<td><img src="<c:url value='/resources/img/'/><%=orderItem.getFileName()%>" style="width: 100px; height: 100px">&nbsp; <%=orderItem.getProductName() %></td>
							<td style="line-height: 100px"><%=orderItem.getProductPrice()%></td>
							<td style="line-height: 100px"><%=orderItem.getProductCount()%></td>
							<td style="line-height: 100px"><%=orderItem.getProductPrice() * orderItem.getProductCount()%>원</td>
							<td style="line-height: 100px"><a href="<c:url value='/main/orderInfo?memberId='/><%=memberId %>" class="btn btn-secondary">뒤로가기&laquo;</a></td>
						</tr>
						<%
					   		}
						%>
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