<%@ page import="com.javalec.ex.dto.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>도서현황</h1>
<input type="button" value="검색" onclick="fn_search()">
<%! 
ArrayList<LDto> dtos=null;
LDto dto=null;
%>

<table border="1">
<tr>
<td colspan="6">정렬 
(<a href="write_view.do">책이름</a> / <a href="write_view.do">대여날자</a>)
</td>
</tr>
<tr>
<td>책이름 </td>
<td>책장르 </td>
<td>대여상태 </td>
<td>대여날짜 </td>
<td>대여회원 </td>
<td>반남/대여 </td>
</tr>

<%
dtos = (ArrayList<LDto>)request.getAttribute("bStatusView");
for(int i=0; i<dtos.size() ; i++){
	dto = dtos.get(i);
%>
<tr>
<td><%= dto.getmBName()%></td>
<td><%= dto.getmBType() %> </td>
<td><%= 0 %> </td>
<td><%= dto.getmRDate() %> </td>
<td><%= dto.getmMName() %> </td>
<td><%= 0 %> </td>
</tr>
<%
}
%>

</table>
<script>
	function fn_search() {
		var child = window.open("popup.jsp", "검색", "width=400px,height=300px");
		child.addEventListener("message", function(e) {
			var result = e.data.split(':');
			location.href="index.jsp?section=select&opt=" + result[0] + "&value=" + result[1];
		});
	}
</script>
</body>
</html>