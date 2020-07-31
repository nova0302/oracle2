<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*" %>
<%@ page import="com.javalec.ex.dto.LMDto" %>
<%@ page import="com.javalec.ex.dto.LBDto" %>
<%@ page import="com.javalec.ex.dao.LDao" %>
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
LDao dao = new LDao();
LMDto dto = null;
LBDto bdto = null;
%>
<form>
<table border="1">
<tr>
<td>도서이름</td>
<td>

<select name="bCode" id="bCode">

<%

ArrayList<LBDto> dtos = dao.bList();

for(int i=0; i<dtos.size(); i++){
	LBDto dto = dtos.get(i);	
%>
<option value=<%=dto.getmBCode() %>> <%= dto.getmBName()%> </option>
<%
}
%>

</select>

</td>

</tr>

<tr>
<td>회원이름</td>
<td>
<select name="mCode" id="mCode">

<%
 
ArrayList<LMDto> mdtos = dao.mList();

for(int i=0; i<mdtos.size(); i++){
	LMDto dto = mdtos.get(i);		
%>
<option value=<%=dto.getmMCode() %>> <%= dto.getmMname()%> </option>
<%
}
%>

</select>

</td>
</tr>

	<tr>
		<td colspan="2" style="text-align:center"><input type="button" value="대여" onclick="fn_rent_book()"></td>
	</tr>
</table>
</form>


<script>
	function fn_rent_book(){
		var bCode ;
		var mCode;
		
		bCode = document.getElementById('bCode').value;
		mCode = document.getElementById('mCode').value;
		
		parent.postMessage(bCode + ":" + mCode);
		window.close();
	}					
</script>
</body>
</html>