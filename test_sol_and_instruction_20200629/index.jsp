<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String section = Util.getParamNN(request.getParameter("section"));
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css.css">
<meta charset="UTF-8">
<title>매장별 커피 판매관리 ver 1.0</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
	<%
	switch(section) {
	case "insert":
%>
		<jsp:include page="c_insert.jsp"></jsp:include>
<%
		break;
	case "select":
%>
		<jsp:include page="c_select.jsp"></jsp:include>
<%
		break;
	case "select_by_shop":
%>
		<jsp:include page="c_select_by_shop.jsp"></jsp:include>
<%
		break;
	case "select_by_product":
%>
		<jsp:include page="c_select_by_product.jsp"></jsp:include>
<%
		break;
	default:
%>
		<jsp:include page="c_index.jsp"></jsp:include>
<%
		break;
	}

%>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>