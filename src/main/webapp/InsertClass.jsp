<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Class" %>

<html>
<head>
<meta charset="UTF-8">
<title>Thêm thông tin</title>
</head>
<body>
<h3>Thêm sinh viên</h3>
<form action="lop" method="post">
<table style="width: 50%">
	<tr>
		<td align="right"> Mã Lớp: </td>
		<td><input type= "text" name = "MaLop">
	</td>
	<tr>
		<td align="right"> Tên Lớp: </td>
		<td><input type= "text" name = "TenLop">
	</td>
	<tr>
		<td align="right"> Mã Khoá Học: </td>
		<td><input type= "text" name = "MaKH">
	</td>
	
</table>
<input type="hidden" name="action" value="add">
<input type="submit" value="Thêm Lớp">
</form>
</body>
</html>