<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Contribution" %>

<html>
<head>
<meta charset="UTF-8">
<title>Thêm thông tin</title>
</head>
<body>
<h3>Thêm xếp hạng</h3>
<form action="donggop" method="post">
<table style="width: 50%">
	<tr>
		<td align="right"> MaXH: </td>
		<td><input type= "text" name = "MaKH">
	</td>
	<tr>
		<td align="right"> MaSV: </td>
		<td><input type= "text" name = "TenKH">
	</td>
	<tr>
		<td align="right"> Số hoạt động: </td>
		<td><input type= "number" name = "SoHoatDong">
	</td>
	
</table>
<input type="hidden" name="action" value="add">
<input type="submit" value="Thêm">
</form>
</body>
</html>