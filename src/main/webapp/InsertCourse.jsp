<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Courses" %>

<html>
<head>
<meta charset="UTF-8">
<title>Thêm thông tin</title>
</head>
<body>
<h3>Thêm sinh viên</h3>
<form action="khoahoc" method="post">
<table style="width: 50%">
	<tr>
		<td align="right"> MaKH: </td>
		<td><input type= "text" name = "MaKH">
	</td>
	<tr>
		<td align="right"> Tên khoá học: </td>
		<td><input type= "text" name = "TenKH">
	</td>
	<tr>
		<td align="right"> Ngày bắt đầu: </td>
		<td><input type= "date" name = "NgayBatDau_N_H">
	</td>
	<tr>
		<td algin="right"> Ngày kết thúc: </td>
		<td><input type= "date" name = "NgayKetThuc_N_H">
	</td>
</table>
<input type="hidden" name="action" value="add">
<input type="submit" value="Thêm sinh viên">
</form>
</body>
</html>