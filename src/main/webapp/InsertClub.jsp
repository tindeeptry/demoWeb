<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Club" %>

<html>
<head>
<meta charset="UTF-8">
<title>Thêm thông tin</title>
</head>
<body>
<h3>Thêm sinh viên</h3>
<form action="CLB" method="post">
<table style="width: 50%">
	<tr>
		<td align="right"> MaHD: </td>
		<td><input type= "text" name = "MaHD">
	</td>
	<tr>
		<td align="right"> Tên Hoạt động: </td>
		<td><input type= "text" name = "TenHD">
	</td>
	<tr>
		<td align="right"> Ngày tổ chức: </td>
		<td><input type= "date" name = "NgayToChuc">
	</td>
</table>
<input type="hidden" name="action" value="add">
<input type="submit" value="Thêm hoạt động">
</form>
</body>
</html>