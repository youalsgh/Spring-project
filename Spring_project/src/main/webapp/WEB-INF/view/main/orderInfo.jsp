<%@page import="command.OrderCommand"%>
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
	List<OrderCommand> orderCommand = (ArrayList<OrderCommand>)request.getAttribute("orderCommand");
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
							<th>주문번호</th>
							<th>주문자</th>
							<th>주소</th>
							<th>주문상태</th>
							<th>주문일자</th>
						</tr>
					   	<%
					   		for(int i = 0 ; i < orderCommand.size() ; i++){
					   			OrderCommand order = orderCommand.get(i);
					   	%>
						<tr>
							<td><%=order.getOrderId() %></td>
							<td><%=order.getAddressee()%></td>
							<td>우편번호:<%=order.getMemberAddr1() %><br>주소:<%=order.getMemberAddr2()%><br>상세주소:<%=order.getMemberAddr3() %></td>
							<td><%=order.getOrderState() %></td>
							<td>
								<%=order.getOrderDate() %> <br>
								<a href="<c:url value='/main/orderItemInfo?orderId='/><%=order.getOrderId() %>" class="btn btn-secondary">상품정보&raquo;</a>
							</td>
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