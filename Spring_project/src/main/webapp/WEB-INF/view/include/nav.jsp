<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String memberId = (String)session.getAttribute("memberId");
	Integer cartListCount = (Integer) session.getAttribute("cartListCount");
	if(cartListCount == null){
		cartListCount = 0;
	}
%>

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light shadow">
	<div class="container d-flex justify-content-between align-items-center">

		<a class="navbar-brand text-success logo h3 align-self-center"
			href='<c:url value="/index"/>'> CLOTHING STORE </a>

		<button class="navbar-toggler border-0" type="button"
			data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
			<div class="flex-fill">
				<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
					<li class="nav-item"><a class="nav-link" href='<c:url value="/index"/>'>Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href='<c:url value="/main/about"/>'>About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href='<c:url value="/main/main_shop?pageNum=1"/>'>Shop</a>
					</li>
					<li class="nav-item"><a class="nav-link" href='<c:url value="/main/contact"/>'>Contact</a>
					</li>
				</ul>
			</div>
			
			<div class="navbar align-self-center d-flex">
				<div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
					<div class="input-group">
						<input type="text" class="form-control" id="inputMobileSearch"
							placeholder="Search ...">
						<div class="input-group-text">
							<i class="fa fa-fw fa-search"></i>
						</div>
					</div>
				</div>
				<a class="nav-icon d-none d-lg-inline" href="#"
					data-bs-toggle="modal" data-bs-target="#templatemo_search"> <i
					class="fa fa-fw fa-search text-dark mr-2"></i>
				</a> <a class="nav-icon position-relative text-decoration-none" href="<c:url value='/main/cart?memberId='/><%=memberId%>">
					<i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i> <span
					class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"><%=cartListCount%></span>
				</a> <a class="nav-icon position-relative text-decoration-none" href="#">
					<i class="fa fa-fw fa-user text-dark mr-3"></i> <span
					class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
				</a>
			</div>
			
			<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
				<li class="nav-item member">
					<c:if test="${memberId == null}">
						<li class="nav-item">
							<a class="nav-link" href="<c:url value='/member/signup'/>">Sign up</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value='/member/login.do'/>">Login</a>
						</li>
					</c:if>	
					
					<c:if test="${memberId != null && memberAdminCk == 1}">
						<li class="nav-item">
							<a class="nav-link" href="<c:url value='/admin/admin_view'/>">Admin</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value='/member/logout.do'/>" onclick="return confirm('로그아웃 하시겠습니까?');">Logout</a>
						</li>
					</c:if>
					
					<c:if test="${memberId != null && memberAdminCk == 0}">
						<li class="nav-item">
							<a class="nav-link" href="<c:url value='/member/info.do'/>">My page</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value='/member/logout.do'/>" onclick="return confirm('로그아웃 하시겠습니까?');">Logout</a>
						</li>
					</c:if>
					

				</li>
				
			</ul>
			
		</div>
	</div>

	<div id="goingTop" onclick="window.scrollTo(0,0);">
		<img src="<c:url value='/resources/img/arrow.svg'/>">
	</div>

</nav>
<!-- Close Header -->

<!-- Modal -->
<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="w-100 pt-1 mb-5 text-right">
			<button type="button" class="btn-close" data-bs-dismiss="modal"
				aria-label="Close"></button>
		</div>
		<form action="" method="get"
			class="modal-content modal-body border-0 p-0">
			<div class="input-group mb-2">
				<input type="text" class="form-control" id="inputModalSearch"
					name="q" placeholder="Search ...">
				<button type="submit" class="input-group-text bg-success text-light">
					<i class="fa fa-fw fa-search text-white"></i>
				</button>
			</div>
		</form>
	</div>
</div>