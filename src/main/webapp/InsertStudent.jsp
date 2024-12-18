<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Students" %>

<html>
<head>
<meta charset="UTF-8">
<title>Thêm thông tin</title>
</head>
<body>
<h3>Thêm sinh viên</h3>
<form action="hocvien" method="post">
<table style="width: 50%">
	<tr>
		<td align="right"> MaSV: </td>
		<td><input type= "text" name = "MaSV">
	</td>
	<tr>
		<td align="right"> name: </td>
		<td><input type= "text" name = "TenSV">
	</td>
	<tr>
		<td align="right"> email: </td>
		<td><input type= "text" name = "email">
	</td>
	<tr>
		<td algin="right"> SĐT: </td>
		<td><input type= "tel" name = "SDT">
	<tr>
		<td align="right"> DOB: </td>
		<td><input type= "date" name = "DOB">
	</td>
	<tr>
		<td align="right"> Dia chi: </td>
		<td><input type= "text" name = "DiaChi">
	</td>
</table>
<input type="hidden" name="action" value="add">
<input type="submit" value="Thêm sinh viên">
</form>
</body>
</html>