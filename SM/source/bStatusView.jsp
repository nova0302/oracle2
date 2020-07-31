<%@ page import="java.io.PrintWriter"%>
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
PrintWriter pw = null;
String isRented="";

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
pw = response.getWriter();
dtos = (ArrayList<LDto>)request.getAttribute("bStatusView");
for(int i=0; i<dtos.size() ; i++){
	dto = dtos.get(i);
	isRented = dto.getmIsRented();
%>
<tr>
<td><%= dto.getmBName() %></td>
<td><%= dto.getmBType() %> </td>
<td><%= isRented %> </td>
<td><%= dto.getmRDate() %> </td>
<td><%= dto.getmMName() %> </td>

<td> 

<%
if(isRented.equals("대여중"))
{
%>


<a href="returnTheBook.do?nRent=<%= dto.getMnRent()%>"> <%= dto.getmRent()	%></a>

<%
}else{
%>

<a href="#" onclick="fn_rent()"> <%= dto.getmRent()	%></a>

<%
}
%>


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
	function fn_rent() {
		var popHeight=200; var popWidth = 350;
		
		var winHeight = document.body.clientHeight;	// 현재창의 높이
		var winWidth = document.body.clientWidth;	// 현재창의 너비
		var winX = window.screenLeft;	// 현재창의 x좌표
		var winY = window.screenTop;	// 현재창의 y좌표

		var popX = winX + (winWidth - popWidth)/2;
		var popY = winY + (winHeight - popHeight)/2;
		var child = window.open("rentPopupView.jsp","대여","width="+popWidth+"px,height="+popHeight+"px,top="+popY+",left="+popX);
		
		child.addEventListener("message", function(e) {
			var result = e.data.split(':');
			location.href="rentTheBook.do?bCode=" + result[0] + "&mCode=" + result[1];		
		});

	}	
	
</script>
</body>
</html>