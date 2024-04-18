<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.InputStream"%>
<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

	// https://wwwaloha.oopy.io/d8e8b278-94f8-4aa7-b802-d27627adb285
	
	// to-do : 박은서 선생님 사이트 참고해서 upload.jsp 베껴서 하면됨
	// 상품 수정
	// 파일 데이터 처리
    Part filePart = request.getPart("file"); // 파일 파트 가져오기
	if (filePart != null && filePart.getSize() > 0) {
	    // 파일 처리 로직
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	    InputStream fileContent = filePart.getInputStream();
	    // 파일을 저장하거나 다른 작업 수행
	}
    // 일반 폼 데이터 처리
	String productId = request.getParameter("productId");	// 상품ID
	String name = request.getParameter("name");				// 상품명
	//Integer unitPrice = Integer.parseInt(request.getParameter("unitPrice")); // 가격(단가)
	String description = request.getParameter("description");// 설명
	String manufacturer = request.getParameter("manufacturer");	// 제조 업체
	String category = request.getParameter("category");		 // 카테고리
	String unitsInStockStr = request.getParameter("unitsInStock"); // 재고 수
	long unitsInStock = (unitsInStockStr != null && !unitsInStockStr.isEmpty()) ? Long.parseLong(unitsInStockStr) : 0;
	String condition = request.getParameter("condition");		// 상태
	 
	Product product = new Product();
	//product.setFile(file);
	product.setProductId(productId);
	product.setName(name);
	//product.setUnitPrice(unitPrice);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(unitsInStock);
	product.setCondition(condition);
	
	ProductRepository productDao = new ProductRepository();
	
	int result = productDao.update(product);
	out.println(result);
	out.println("File: " + request.getParameter("file") + "<br>");
	out.println("Product ID: " + request.getParameter("productId") + "<br>");
	out.println("Name: " + request.getParameter("name") + "<br>");
	out.println("Description: " + request.getParameter("description") + "<br>");
	out.println("Manufacturer: " + request.getParameter("manufacturer") + "<br>");
	out.println("Category: " + request.getParameter("category") + "<br>");
	out.println("Condition: " + request.getParameter("condition") + "<br>");
// 	if(result > 0) {
// 		response.sendRedirect("editProducts.jsp");
// 	}
// 	else {
// 	    // out.println("<script>alert('제품 수정 중 에러가 발생하였습니다.'); history.back();</script>");
// 	}
	
%>
<body>

</body>
</html>