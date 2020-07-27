<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
</head>
<body>
<p id="demo"></p>
	<table>
		<tr>
			<td> <input type="checkbox" id="cb_bName"> 책이름</td>
			<td><input type="text" id="bName"></td>
		</tr>
		<tr>
			<td> <input type="checkbox" id="cb_bType"> 책장르</td>
			<td>
				<select name="type" id=bType>
				<option value="소설" selected="selected">소설</option>
				<option value="역사" >역사</option>
				<option value="다큐">다큐</option>
				</select>
			</td>
		</tr>
		<tr>
			<td> <input type="checkbox" id="cb_mName"> 회원명</td>
			<td><input type="text" id="mName"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="검색" onclick="fn_result()"></td>
		</tr>
	</table>
	<script>
		function fn_result() {
			var vbName, vType, vmName;
			if(document.getElementById("cb_bName").checked) 
				vbName = document.getElementById("bName").value;
			
			if(document.getElementById("cb_bType").checked) 
				vType = document.getElementById("bType").value;
			
			if(document.getElementById("cb_mName").checked) 
				vmName = document.getElementById("mName").value;
			
			//document.getElementById("demo").innerHTML = vbName + ":" + vType  ":" + vmName;
			document.getElementById("demo").innerHTML = vbName + ":" + vType +  ":" + vmName;
			parent.postMessage(vbName + ":" + vType +  ":" + vmName);
			window.close();
		}	
	</script>
</body>
</html>