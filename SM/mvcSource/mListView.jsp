<%@ page import="com.javalec.ex.dto.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원현황</h1>
<table border='1'>
<tr>
<td>이름</td>
<td>전화번호</td>
<td>대출횟수</td>
</tr>
<%
for(LMDto m: ((ArrayList<LMDto>)request.getAttribute("list"))){
%>
<tr>
<td><%= m.getmMname() %></td> <td><%= 	m.getmPhone() %></td> <td><%= 0 %></td></tr>
<%
}
%>
</table>

</body>
</html>