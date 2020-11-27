<%@page import="edu.smh.dao.HelloWorldDao"%>
<%@page import="edu.smh.dto.SaleListDto"%>
<%@page import="edu.smh.dto.HelloDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
	<tr> <th>판매변호</th> <th>판매코드</th> <th>판매일</th> <th>매장코드</th> <th>수량</th> </tr>

		<%
		ArrayList<SaleListDto> dtos = (ArrayList<SaleListDto>) request.getAttribute("theList");
		//HelloWorldDao dao = new HelloWorldDao();
		//ArrayList<HelloDto> dtos = dao.hList();
		//ArrayList<SaleListDto> dtos = dao.sList();
		for (int i = 0; i < dtos.size(); i++) {
			SaleListDto dto = dtos.get(i);
		%>
		<tr>
			<td><%=dto.getSaleNo()%></td>
			<td><%=dto.getPCode()%></td>
			<td><%=dto.getSaleDate()%></td>
			<td><%=dto.getSCode()%></td>
			<td><%=dto.getAmount()%></td>
		</tr>
		<%
			}
		%>


	</table>
</body>
</html>