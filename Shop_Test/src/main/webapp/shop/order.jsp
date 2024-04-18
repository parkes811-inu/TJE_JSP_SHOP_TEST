<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ship</title>
	<jsp:include page="/layout/meta.jsp" /> <jsp:include page="/layout/link.jsp" />
</head>
<%
	// 로그인 정보 받아와서 비회원인지 회원인지
	
	
	String name = request.getParameter("name");
	String deliveryDate = request.getParameter("deliveryDate");
	String nation = request.getParameter("nation");
	String zipCode = request.getParameter("zipCode");
	String address = request.getParameter("address");
 	String phone = request.getParameter("phone");
 	
    List<Product> cart = (List<Product>) session.getAttribute("cart");

    if (cart == null) {
        response.sendRedirect("/error/exception.jsp");
    }
    
    
%>
<body>   
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 mt-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 정보</h1>
	</div>
	
	<!-- 배송 정보 영역 -->
	<div class="container shop p-5 mb-5" >
		<form action="order.jsp" name="DeliveryForm" method="post" >
		
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-4" id="">성명 : </label>
				<p> 성명 : <%= name %> </p> <hr>
			</div>
			
			<div class="input-group mb-3 row">
				<p> 배송일 : <%= deliveryDate %> </p> <hr>
			</div>
			
			<div class="input-group mb-3 row">
				<p> 국가명 : <%= nation %> </p> <hr>
			</div>
			
			<div class="input-group mb-3 row">
			    <p> 우편번호 : <%= zipCode %> </p> <hr>
			</div>
			
			<div class="input-group mb-3 row">
				<p> 주소 : <%= address %> </p> <hr>
			</div>
			
			<div class="input-group mb-6 row">
			    <p> 전화번호 : <%= phone %> </p> <hr>
			</div>
			 <hr>
			<div class="input-group mb-3 row">
				<label class="col-md-4" id="">주문 비밀번호 : </label>
				<input type="text" class="form-control col-md-8" 
					   name="password" required>
			</div>
			
			<div class="d-md-flex justify-content-between mt-5 mb-5">
			    <!-- 왼쪽 버튼 -->
			    <div>
			        <a href="cart.jsp" class="btn btn-lg btn-success">이전</a>
			        <a href="/Shop_Test/" class="btn btn-lg btn-danger">취소</a>
			    </div>
			    <!-- 오른쪽 버튼 -->
			    <div>
			        <input type="submit" class="btn btn-lg btn-primary" value="등록" />
			    </div>
			</div>

			
		</form>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>








