<%@page import="edu.smh.dao.HelloWorldDao"%>
<%@page import="edu.smh.dto.WorldDto"%>
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
world.jsp
	<table border="1">
	
		<% 
//		ArrayList<WorldDto> dtos = (ArrayList<WorldDto>)request.getAttribute("theList");
		HelloWorldDao dao = new HelloWorldDao();
		ArrayList<WorldDto> dtos = dao.wList();
		for(int i = 0; i<dtos.size(); i++){
			WorldDto dto = dtos.get(i);
		%>
		
		<tr>
		<td> <%= dto.getmName() %> </td>
		<td> <%= dto.getmTel() %> </td>
		</tr>
		<%
		}
		%>
		
		
	</table>
</body>
</html>