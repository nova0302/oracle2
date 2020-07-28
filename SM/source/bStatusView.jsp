<%@ page import="com.javalec.ex.dto.LDto" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "css/style.css">
</head>
<body>

<jsp:include page="header_n_nav.jsp"/>

<h1>도서현황</h1>
<input type="button" value="검색" onclick="fn_search()">
<%! 
ArrayList<LDto> dtos=null;
LDto dto=null;
%>

<table border="1">
<tr>
<td colspan="6">정렬 
(<a href="bStatusViewB.do">책이름</a> / <a href="bStatusViewR.do">대여날자</a>)
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
<td><%= dto.getmBName() %></td>
<td><%= dto.getmBType() %> </td>
<td><%= dto.getmIsRented() %> </td>
<td><%= dto.getmRDate() %> </td>
<td><%= dto.getmMName() %> </td>
<td id='<%= i %>'> 
<a href='deleteItem.do'> 
<%= dto.getmRent()	%> 
</a>
</td>
</tr>
<%
}
%>


</table>
<p id="demo"></p>
<footer>
<h4>Copyright @ 12020 SMC. All right reserved</h4>
</footer>

<script>
	function fn_search() {
		var child = window.open("bSearchView.jsp", "검색", "width=300px,height=150px;");
		child.addEventListener("message", function(e) {
			var url = "bSearch.do?";
			for(key in e.data){
				url +="&";
				url +=key;
				url +="=";
				url +=e.data[key];
			}
		//document.getElementById("demo").innerHTML = url;				
			//var result = e.data.split(':');
			//location.href="index.jsp?section=select&opt=" + result[0] + "&value=" + result[1];
			//location.href = "testView.jsp";
			location.href = url;
		});
	}	
</script>
</body>
</html>