<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Teachers" %>

<html>
<head>
<meta charset="UTF-8">
<title>Thêm thông tin</title>
</head>
<body>
<h3>Thêm giáo viên</h3>
<form action="giaovien" method="post">
<table style="width: 50%">
	<tr>
		<td align="right"> MaGV: </td>
		<td><input type= "text" name = "MaGV">
	</td>
	<tr>
		<td align="right"> name: </td>
		<td><input type= "text" name = "TenGV">
	</td>
	<tr>
		<td algin="right"> SĐT: </td>
		<td><input type= "tel" name = "SDT">
	</td>
	<tr>
	<tr>
		<td align="right"> email: </td>
		<td><input type= "text" name = "email">
	</td>
	<tr>
		<td align="right"> DOB: </td>
		<td><input type= "date" name = "DOB">
	</td>
	
</table>
<input type="hidden" name="action" value="add">
<input type="submit" value="Thêm giáo viên">
</form>
</body>
</html>