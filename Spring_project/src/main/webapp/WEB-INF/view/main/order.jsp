<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="command.CartCommand" %>

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
	List<CartCommand> cartList = (ArrayList<CartCommand>)request.getAttribute("cartList");
	String memberId = (String)session.getAttribute("memberId");
%>

<body>

	<jsp:include page="../include/nav.jsp" />
	
	<div class="d-flex align-items-center justify-content-center mb-3">
		<h3 style="padding-top: 100px">주문 상품리스트</h3>
	</div>
	
	<div class="container">
		<div class="row" style="padding-top: 50px">
			<table width="100%">
				<tr>
					<td align="left"><a href="<c:url value='/main/cartDeleteAll?memberId='/><%=memberId%>" class="btn btn-danger" onclick="return confirm('카트 전체를 삭제하시겠습니까?');">삭제하기</a></td>
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
						cart.setTotalPrice(productTotal);
						cart.setTotalPriceAll(sum);
				%>
			   	
				<tr>
					<td><img src="<c:url value='/resources/img/'/><%=cart.getFileName()%>" style="width: 100px; height: 100px">&nbsp; <%=cart.getProductName() %></td>
					<td style="line-height: 100px"><%=cart.getProductPrice() %></td>
					<td><input type="number" id="unit<%=i %>" value="<%=cart.getProductCount() %>" style="width: 50px; margin-top: 50px; transform: translateY(-50%); border: solid lightgray 2px"></td>
					<td style="line-height: 100px"><%=productTotal %></td>
					<td style="line-height: 100px">
						<a href="<c:url value='/main/cartDelete?memberId='/><%=memberId %>&cartId=<%=cart.getCartId() %>" class="btn btn-danger" onclick="return confirm('해당 상품을 삭제하시겠습니까?');">삭제</a>
						<a href="#" class="btn btn-success" onclick="modify<%=i%>()">수정</a>
					</td>
				</tr>	
				<%
					}
				%>
			</table>	
		</div>
	</div>
	
	<form action="orderComplete" method="post">
	<%
		for(int i = 0; i < cartList.size(); i++) {
			CartCommand cart2 = cartList.get(i);
	%>
		<input type="hidden" name="productId" value="<%=cart2.getProductId() %>">
		<input type="hidden" name="productCount" value="<%=cart2.getProductCount() %>">
	<%
		}
	%>
		<div class="container-fluid">
			<div class="row h-100 justify-content-center"
				style="min-height: 100vh;">
				<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
					<div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
						<div class="d-flex align-items-center justify-content-center mb-3">
							<h3>주문자 정보 입력</h3>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control"
								id="floatingName" name="addressee" placeholder="Addressee"> <label
								for="floatingName">Addressee</label>
						</div>
						<div class="row">
							<div class="col-8">
								<input class="address_input_1 form-control" name="memberAddr1" placeholder="우편번호">
							</div>
							<div class="col-4">
								<input type="button" onclick="execution_daum_address()" value="우편번호 찾기">
							</div>
						</div>
						<input class="address_input_2 form-control" name="memberAddr2" placeholder="주소">
						<input class="address_input_3 form-control" name="memberAddr3" placeholder="상세주소">


						<button class="btn btn-success py-3 w-100 mb-4">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		/* 다음 주소 연동 */
	    function execution_daum_address() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    /* 주소변수 문자열과 참고항목 문자열 합치기 */
	                    addr += extraAddr;
	                
	                } else {
	                    addr += ' ';
	                }
	
	                /* 우편번호와 주소 정보를 해당 필드에 넣는다. */
	                $(".address_input_1").val(data.zonecode);
	                $(".address_input_2").val(addr);
	                
	                /* 커서를 상세주소 필드로 이동한다. */
	                $(".address_input_3").attr("readonly", false);
	                $(".address_input_3").focus();
	            }
	        }).open();
	    }
	</script>
</body>
</html>