<%@page import="edu.smh.dto.SRecordDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 판매등록 </</title>
</head>
<body>
	<h1>판매등록</h1>

	<%
	SRecordDto dto = (SRecordDto)request.getAttribute("sRecord");
	String saleNo = dto.getNextSaleNo();
	ArrayList<String> pcList = dto.getPcList();
	ArrayList<String> scList = dto.getScList();
	%>

	<form name='sRecord' action='saveSRecord.do' method='get'>
		<table border='1'>
			<tr>
				<td>비번호</td>
				<td><input type="text" name="saleNo" value="<%=saleNo%>"></td>
			</tr>
			<tr>
				<td>상품코드</td>
				<td><select name="pCode" id="id-pCode">
						<%
							for (int i = 0; i < pcList.size(); i++) {
								String pCode = pcList.get(i);
						%>
						<option value="<%=pCode%>"> <%=pCode%> </option>
						<%
							}
						%>
				</select> 
			</tr>
			<tr>
				<td>판매날짜</td>
				<td><input type="date" name="saleDate" value=""></td>
			</tr>
			<tr>
				<td>매장코드</td>
				<td><select name="sCode" id="id-sCode">
						<%
							for (int i = 0; i < scList.size(); i++) {
								String sCode = scList.get(i);
						%>
						<option value="<%=sCode%>"> <%=sCode%> </option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="text" name="amount" value=""></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등 록"
					onclick="fn_submit()"> <input type="reset" value="다시쓰기"
					onclick="fn_reset()"></td>
			</tr>
		</table>
	</form>

</body>
</html>