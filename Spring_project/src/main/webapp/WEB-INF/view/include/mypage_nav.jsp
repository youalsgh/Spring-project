<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String memberId = (String)session.getAttribute("memberId");
%>
<div class="col-lg-2">
	<h1 class="h2 pb-4">Menu</h1>
	<ul class="list-unstyled templatemo-accordion">
		<li class="pb-3"><a
			class="collapsed d-flex justify-content-between h3 text-decoration-none"
			href="#"> 회원정보 <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
		</a>
			<ul class="collapse show list-unstyled pl-3">
				<li><a class="text-decoration-none"
					href="<c:url value='/member/info.do'/>">회원정보 수정</a></li>
				<li><a class="text-decoration-none"
					href="<c:url value='/member/drop_m'/>">회원 탈퇴</a></li>
			</ul></li>
		<li class="pb-3"><a
			class="collapsed d-flex justify-content-between h3 text-decoration-none"
			href="#"> 구매정보 <i
				class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
		</a>
			<ul id="collapseTwo" class="collapse list-unstyled pl-3">
				<li><a class="text-decoration-none" href="<c:url value='/main/orderInfo?memberId='/><%=memberId%>">주문내역</a></li>
				<li><a class="text-decoration-none" href="<c:url value='/main/cart?memberId='/><%=memberId%>">장바구니</a></li>
			</ul></li>
		<li class="pb-3"><a
			class="collapsed d-flex justify-content-between h3 text-decoration-none"
			href="#"> 게시글 관리 <i
				class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
		</a>
			<ul id="collapseThree" class="collapse list-unstyled pl-3">
				<li><a class="text-decoration-none" href="#">작성 게시글 관리</a></li>
				<li><a class="text-decoration-none" href="#">#</a></li>
				<li><a class="text-decoration-none" href="#">#</a></li>
			</ul></li>
	</ul>
</div>