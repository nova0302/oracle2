<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>매장별 커피 판매관리 ver 1.0</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h2>매장별 커피 판매관리 ver 1.0</h2>
	</header>
	<nav>
		<ul>
			<li><a href="entryNewRecord.do">판매등록</a>
			<li><a href="saleList.do">판매현황</a>
			<li><a href="index.jsp?section=hello">hello.jsp</a>
			<li><a href="index.jsp?section=world">world.jsp</a>
			<li><a href="index.jsp">홈으로</a>
		</ul>
	</nav>

	<%
		String sec = request.getParameter("section");
	//처음 보여주는 페이지는 newitem입니다.
	if (sec == null || sec.equals("")) {
		sec = "main.jsp";
	} else {
		sec += ".jsp";
	}
	%>
	<section>
		<jsp:include page='<%=sec%>' />
	</section>

	<footer>
		<h3>Copyright @ 2018 All right reserved SangIl Media High School</h3>
	</footer>


</body>
</html>