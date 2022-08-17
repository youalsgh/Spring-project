<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper">

	<div class="sidebar">
		<!--profile image & text-->
		<div class="profile">
			<img
				src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg"
				alt="profile_picture">
			<a href="<c:url value='/admin/admin_view'/>"><h3>관리자 페이지</h3></a>
		</div>
		<ul>
			<li><a href="<c:url value='/index'/>" class="#"> <span
					class="icon"><i class="fas fa-home"></i></span> <span class="item">메인페이지</span>
			</a></li>
			<li><a href="<c:url value='/admin/admin_member'/>"> <span class="icon"><i
						class="fas fa-user-friends"></i></span> <span class="item">회원관리</span>
			</a></li>
			<li><a href="<c:url value='/admin/admin_productAdd'/>"> <span class="icon"><i
						class="fas fa-desktop"></i></span> <span class="item">상품등록</span>
			</a></li>
			<li><a href="<c:url value='/admin/admin_product?pageNum=1' />"> <span
					class="icon"><i class="fas fa-tachometer-alt"></i></span> <span
					class="item">상품관리</span>

			</a></li>
			<li><a href="#"> <span class="icon"><i
						class="fas fa-database"></i></span> <span class="item">등록</span>
			</a></li>
			<li><a href="#"> <span class="icon"><i
						class="fas fa-chart-line"></i></span> <span class="item">관리</span>
			</a></li>
			<li><a href="#"> <span class="icon"><i
						class="fas fa-user-shield"></i></span> <span class="item">등록</span>
			</a></li>
			<li><a href="#"> <span class="icon"><i
						class="fas fa-cog"></i></span> <span class="item">관리</span>
			</a></li>
			<li><a href="<c:url value='/member/logout.do'/>"> <span
					class="icon"><i class="fas fa-home"></i></span> <span class="item">로그아웃</span>
			</a></li>
		</ul>
	</div>

</div>