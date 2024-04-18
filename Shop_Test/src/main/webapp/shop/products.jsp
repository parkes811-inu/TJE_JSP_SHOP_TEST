<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Products</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />

</head>
<% 
	String root = request.getContextPath(); 
	ProductRepository productDao = new ProductRepository();
	List<Product> productList = new ArrayList<Product>();
	
	//상단 검색 메뉴
	String keyword = request.getParameter("keyword");
	
	// keyword가 널이면 그냥 전체 상품 보여주고, 아니면 keyword로 조회한거 보여주면 될듯 ??
	if(keyword != null && !keyword.trim().isEmpty()) {
		productList = productDao.list(keyword);
		
		// 제품들 정보 이외 이상한 값들이 들어가면 그냥 전체 조회 ?
		if(productList.size() == 0) {
			productList = productDao.list();
		}

	} else {
		productList = productDao.list();
	}
	
	// 데이터 베이스에서 상품 목록 가져와서 그리드로 뿌려야될듯
	// response.?????
%>
<body>   
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">상품 목록</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">쇼핑몰 상품 목록 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="<%= root %>/shop/add.jsp" class="btn btn-primary btn-lg px-3 gap-2">상품 등록</a>
				<a href="<%= root %>/shop/editProducts.jsp" class="btn btn-success btn-lg px-3 gap-2">상품 편집</a>
				<a href="<%= root %>/shop/cart.jsp" class="btn btn-warning btn-lg px-3 gap-2">장바구니</a>
			</div>
			<!-- cardView 사용? -->
            <div class="container mt-5">
			    <div class="row">
			        <%-- 서버 측 출력 --%>
			        <c:forEach var="product" items="<%= productList %>">
			            <div class="col-md-4 mb-3 px-2">
			                <div class="card" style="width: 14rem;">
			                    <img class="card-img-top" src="<%= request.getContextPath() %>${product.file}" alt="${product.name}">
			                    <div class="card-body">
									<h5 class="card-title" style="font-weight: bold;">${product.name}</h5>
			                        <p class="card-text">${product.description}</p>
									<p class="card-price text-end" style="font-weight: bold;">￦ ${product.unitPrice}</p>
			                        
			                        <div class="d-flex justify-content-between mt-1 mb-1">
										<a href="cart.jsp" class="btn btn-white btn-sm text-primary border-primary">🛒</a>
										<a href="product.jsp?productId=${product.productId}" class="btn btn-white btn-sm text-primary border-primary">상세 정보</a>
									</div>	
			                    </div>
			                </div>
			            </div>
			        </c:forEach>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
