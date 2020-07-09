
<%@page import="java.sql.*"%>
<%@page import="dbpkg.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");

Connection conn = null;
Statement stmt = null;
String callback = "";
try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "SELECT MAX(saleno) + 1 saleno FROM tbl_salelist_01";	
	
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String saleno = Util.getParamNN(rs.getString("saleno"));
%>
<h3>판매등록</h3>
<form name="form1" action="action.jsp" method="post">
	<input type="hidden" name="task" value="insert">
	<table border="1">
	<tr>
		<th scope="row">th		</th>
		<td>td		</td>
	</tr>
		
		<tr>
			<th scope="row">비번호</th>
			<td><input type="text" name="saleno" value="<%=saleno%>"></td>
		</tr>
		<tr>
			<th scope="row">상품코드</th>
			<!-- 
			<td><input type="text" name="pcode" value=""></td>
			 -->
			<td><select id="pcode" name="pcode">
					<option value="AA01" selected="selected">AA01</option>
					<option value="AA02">AA02</option>
					<option value="AA03">AA03</option>
					<option value="AA04">AA04</option>
					<option value="AA05">AA05</option>
			</select></td>

		</tr>
		<tr>
			<th scope="row">판매날짜</th>
			<td><input type="date" name="saledate" value=""></td>
		</tr>
		<tr>
			<th scope="row">매장코드</th>
			<!-- 
			<td><input type="text" name="scode" value=""></td>
			 -->
			 <td><select id="scode" name="scode">
					<option value="S001" selected="selected">S001</option>
					<option value="S002">S002</option>
					<option value="S003">S003</option>
					<option value="S004">S004</option>
			</select></td>
			
		</tr>
		<tr>
			<th scope="row">판매수량</th>
			<td><input type="text" name="amount" value=""></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="등 록"	onclick="fn_submit()"> 
			<input type="button" value="다시쓰기"		onclick="fn_reset()"></td>
		</tr>
	</table>
</form>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<script>
	function fn_submit() {
		document.querySelector("form[name='form1']").submit();
	}
	
	function fn_reset() {
		var texts = document.querySelectorAll("input[type='text']");
		var date= document.querySelectorAll("input[type='date']");

		for(var i = 0; i < texts.length; i++) {
			texts[i].value="";
		}
		for(var i = 0; i < date.length; i++) {
			date[i].value="";
		}		
	}
</script>