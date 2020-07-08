<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
Connection con;
Statement st;
ResultSet rs;
String driver ="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String uid="system";
String upw="1234";
String query="select * from vs1";
%>

<%
try{
	Class.forName(driver);
	con = DriverManager.getConnection(url, uid, upw);
	st = con.createStatement();
	rs = st.executeQuery(query);
	
	while(rs.next()){
		String scode = rs.getString("SCODE");
		String sname = rs.getString("SNAME");
		int total = rs.getInt("TOTAL");
		out.println(
				"   매장코드: "+ scode +
				",   매장명: "+ sname +
				",   매장별판매액: "+ total +	
				"<br/>"
				);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(rs != null) rs.close();
		if(st != null) st.close();
		if(con != null) con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}

%>
</body>
</html>