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
<form action="diem" method="post">
<table style="width: 50%">
	<tr>
		<td algin="right"> Mã lớp môn học: </td>
		<td><input type= "text" name = "MaLopMonHoc">
	</td>
	<tr>
		<td algin="right"> Mã Lớp: </td>
		<td><input type= "text" name = "MaLop">
	</td>
	<tr>
		<td algin="right"> Mã môn học: </td>
		<td><input type= "text" name = "MaMH">
	</td>
	<tr>
		<td algin="right"> Mã sinh viên: </td>
		<td><input type= "text" name = "MaSV">
	</td>
	<tr>
		<td algin="right"> Điểm: </td>
		<td><input type= "number" name = "Diem">
	</td>
</table>
<input type="hidden" name="action" value="add">
<input type="submit" value="Thêm điểm">
</form>
</body>
</html>