<%@page import="command.MemberCommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>"> 
    <link rel="stylesheet" href="<c:url value='/resources/css/templatemo.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/admin.css'/>">
    
    <!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet" href="<c:url value='https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/fontawesome.min.css'/>">
    
	<title>Admin Page</title>
	<%
		@SuppressWarnings("unchecked")
		List<MemberCommand> memberList = (ArrayList<MemberCommand>)request.getAttribute("memberList");
		int listCount = (int) request.getAttribute("listCount");
	%>
</head>
<body>
	<jsp:include page="../include/admin_nav.jsp" />
	
	<form action="<c:url value="./BoardListAction.do"/>" method="post" id="admin">
			<div>
				<div class="text-right">
					<span class="badge rounded-pill bg-success" style="margin-top: 50px">전체&nbsp;<%=listCount%>건</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>ID</th>
						<th>Password</th>
						<th>Name</th>
						<th>Email</th>
					</tr>
					<%
					if(memberList != null){
						for (int i = 0; i < memberList.size(); i++) {
							MemberCommand member = (MemberCommand) memberList.get(i);
					%>
					<tr>
						<td><%=member.getId() %></td>
						<td><%=member.getPassword() %></td>
						<td><%=member.getName() %></td>
						<td><%=member.getEmail() %></td>
					</tr>
					<%
						}
					}
					%>
				</table>
			</div>
			<%-- <div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>

							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div> --%>
			<div>
				<table>
					<tr>
						<td width="100%" align="left">
							<select name="items" class="txt">
									<option value="subject">제목에서</option>
									<option value="content">본문에서</option>
									<option value="name">글쓴이에서</option>
							</select>
							<input name="text" type="text"/>
							<input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />
						</td>
					</tr>
					<tr>
					</tr>
				</table>
			</div>
	</form>
	
	<!-- Start Script -->
	<script src="<c:url value='/resources/js/jquery-1.11.0.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-migrate-1.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/js/templatemo.js'/>"></script>
	<!-- End Script -->
</body>
</html>